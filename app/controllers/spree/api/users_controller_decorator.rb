module Spree
  module Api

      class UsersController < Spree::Api::V1::UsersController 
      #Spree::Api::UsersController.class_eval do
        before_action :authenticate_user, :except => [:sign_up, :sign_in]
  
        def sign_up
  
          @user = Spree::User.find_by_email(params[:user][:email])
  
          if @user.present?
            render "spree/api/users/user_exists", :status => 401 and return
          end
  
          @user = Spree::User.new(user_params)
          if !@user.save
            unauthorized
            return
          end
          @user.generate_spree_api_key!
        end
  
        def sign_in
          puts("hola controller")
          @user = Spree::User.find_by_email(params[:user][:email])
          if !@user.present? || !@user.valid_password?(params[:user][:password])
            unauthorized
            return
          end
          @user.generate_spree_api_key! if @user.spree_api_key.blank?
        end
  
  
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end

      
    #end
    end
  end
end



# #module Spree
# # module Api
#     Spree::Api::UsersController.class_eval do


#     before_action :authenticate_user, only: [:login]
#     before_action :check_for_user_or_api_key, only: [:login]

#       def login
        
#         @user = User.find_for_database_authentication(:email => params[:email])
#         return invalid_login_attempt unless @user

#         if @user.valid_password?(params[:password])

#           @user.ensure_authentication_token! 
#           respond_with(@user, status: :ok)
#           return

#         else
#           render "spree/api/errors/unauthorized", :success => false, :status => :unauthorized and return
#         end
#       end

#     end
# # end
# #end