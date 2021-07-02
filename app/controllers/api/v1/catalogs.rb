# frozen_string_literal: true

module API
  module V1
    class Catalogs < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      before do
        error!("401 Unauthorized", 401) unless authenticated
      end

      resource :catalogs do
        desc 'Return list of movie catalogs'
        params do
          optional :movie_id, type: Integer, desc: 'Movie ID'
        end

        get :rabl => "catalogs/index" do
          puts "I am here in all catalogs"
          @shows = Show.in_the_future.order(:time)
          @shows = @shows.where(movie_id: params[:movie_id]) if params[:movie_id].present?
          return @shows
        end

        params do
          requires :id, :type => Integer, :desc => "Catalog ID"
          requires :catalog, :type => Hash, :desc => "Catalog data"
        end

        put do
          show = Show.find_by(id: params[:id])
          error!({:error_code => 404, :error_message => "Catalog not found"}, 400) if show.blank?
          error!({:error_code => 403, :error_message => "Not Allowed"}, 403) if !current_user.internal?
          params[:catalog][:time] = Time.parse(params[:catalog][:time]) if params[:catalog][:time].present?
          if show.update(params[:catalog])
            status(200)
            {
              status: "ok",
              catalog: show
            }
          else
          end
        end
      end
    end
  end
end
