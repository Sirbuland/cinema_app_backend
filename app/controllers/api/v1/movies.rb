# frozen_string_literal: true

module API
  module V1
    class Movies < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      before do
        error!("401 Unauthorized", 401) unless authenticated
      end

      resource :movies do
        desc 'Return list of movie catalogs'
        params do
          requires :id, :type => String, :desc => "Movie Title"
        end

        get 'movie_detail' do
          movie = Movie.find_by(id: params[:id])
          error!({:error_code => 404, :error_message => "Catalog not found"}, 400) if movie.blank?
          return OmdbService.new.fetch_by_title(movie.title)
        end
      end

    end
  end
end

