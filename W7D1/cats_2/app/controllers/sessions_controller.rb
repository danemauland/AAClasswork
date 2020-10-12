class SessionsController < ApplicationController
    before_action :already_signed_in, only: [:new] 

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            login_user!(user)
            redirect_to cats_url
        else     
            flash.now[:errors] = ['Invalid credentials']
            render :new
        end
    end
    
    def destroy 
        user = current_user
        if user
            user.reset_session_token!
        end
        session[:session_token] = nil
        redirect_to new_session_url
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end