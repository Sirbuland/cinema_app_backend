module API
  module V1
    class Users < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resources :users do
        desc "Authenticate user and return user object, access token"
        params do
          requires :email, :type => String, :desc => "User email"
          requires :password, :type => String, :desc => "User password"
        end
        post 'authenticate' do
          email = params[:email]
          password = params[:password]

          if email.nil? or password.nil?
            error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
            return
          end

          user = User.find_by(email: email.downcase)
          if user.nil?
            error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
            return
          end

          if !user.valid_password?(password)
            error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
            return
          else
            user.ensure_authentication_token
            user.save
            status(201)
            {
              status: "ok",
              token: user.authentication_token
            }
          end
        end

        desc "Register user and return user object, access token"
        params do
          requires :first_name, :type => String, :desc => "First Name"
          requires :last_name, :type => String, :desc => "Last Name"
          requires :email, :type => String, :desc => "Email"
          requires :password, :type => String, :desc => "Password"
          requires :user_type, :type => String, :desc => "User type"
        end
        post 'register' do
          user = User.new(
            first_name: params[:first_name],
            last_name:  params[:last_name],
            password:   params[:password],
            email:      params[:email],
            user_type:  params[:user_type]
          )

          if user.valid?
            user.save
            return user
          else
            error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
          end
        end

        desc "Logout user and return user object, access token"
        params do
          requires :token, :type => String, :desc => "Authenticaiton Token"
        end
        delete 'logout' do
          user = User.find_by(authentication_token: params[:token])

          if !user.nil?
            user.remove_authentication_token!
            status(200)
            {
              status: 'ok',
              token: user.authentication_token
            }
          else
            error!({:error_code => 404, :error_message => "Invalid token."}, 401)
          end
        end
      end
    end
  end
end
