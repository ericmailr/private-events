class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
       @user = User.new
       @user.username = user_params[:username] 
       @user.password_digest = User.digest(user_params[:password])
       if @user.save
           redirect_to @user
       else
           render 'new'
       end
    end

    def show
        @user = User.find(params[:id])
        @upcoming_events = @user.attended_events.upcoming
        @past_events = @user.attended_events.past
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end
end
