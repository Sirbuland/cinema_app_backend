module API
  module V1
    class Ratings < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      before do
        error!("401 Unauthorized", 401) unless authenticated
      end

      resources :ratings do
        desc "get all movie ratings"
        params do
          requires :movie_id, type: Integer, desc: 'Get all movie ratings'
        end

        get :rabl => "ratings/index" do
          @movie = Movie.find_by(id: params[:movie_id])
          error!({:error_code => 404, :error_message => "Movie not found"}, 400) if @movie.blank?
          @ratings = current_user.ratings.where(movie: @movie)
        end

        desc "Create a movie rating"
        params do
          requires :rating, type: Hash, desc: 'New rating data'
        end
        post do
          rating = current_user.ratings.create(params[:rating])
          if rating.persisted?
            status(200)
            {
              status: "ok",
              catalog: rating
            }
          else
            error!({:error_code => 500, :error_message => rating.errors.full_messages.to_sentence }, 500)
          end
        end
      end
    end
  end
end
