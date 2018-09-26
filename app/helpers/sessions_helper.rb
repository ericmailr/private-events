module SessionsHelper
    def signin(user)
        cookies.permanent.signed[:user_id] = user.id
    end

    def current_user
        if (user_id = cookies.signed[:user_id])
            @current_user ||= User.find(user_id)
        else
            @current_user = nil
        end
    end

    def signed_in?
        !current_user.nil?
    end

    def signout
        @current_user = nil
        cookies.delete :user_id
    end
end
