module API
  class Base < Grape::API
    prefix    'api'
    format    :json

    rescue_from :all, :backtrace => true
    error_formatter :json, API::ErrorFormatter
    formatter :json, Grape::Formatter::Rabl

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end

    mount API::V1::Catalogs
    mount API::V1::Movies
    mount API::V1::Users
    mount API::V1::Ratings
    add_swagger_documentation
  end
end
