class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user
            signin user
            redirect_to user
        else
            flash.now[:warning] = "Could not find username."
            render 'new'
        end
    end
end
