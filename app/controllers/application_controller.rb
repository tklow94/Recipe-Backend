class ApplicationController < ActionController::API
#   before_action :authorized
#   def encode_token(payload)
#     JWT.encode(payload, 'recipe-final')
#   end
#   def auth_header
#     request.headers[:authorization]
#   end
#   def decoded_token
#     # byebug
#     if auth_header
#       token = auth_header.split(' ')[1]
#       # byebug
      
#       begin 
        
#         JWT.decode(token, 'recipe-final', true, algorithm: 'HS256')[0]
#       rescue JWT::DecodeError
#         nil
#       end
#     end
#   end
#   def current_user
#     if decoded_token
#       @user = User.find(decoded_token["user_id"])
#     end
#   end
#   def logged_in?
#     !!current_user
#   end
#   def authorized
#     render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
#   end
# end
    def authenticate
        authorization_header = request.headers[:authorization]
    
        if (!authorization_header)
          render status: :unauthorized
        else
          token = authorization_header.split(" ")[1]
          secret_key = Rails.application.secrets.secret_key_base[0]
          decoded_token = JWT.decode(token, secret_key)[0]
    
          @user = User.find(decoded_token["user_id"])
    end
    end
  end

  
  
  


