class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url, notice: "#{@user.name} successfully registered"
        else
            render "new"
        end
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
end
