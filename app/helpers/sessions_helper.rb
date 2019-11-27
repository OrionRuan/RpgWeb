module SessionsHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    def block_access
        if current_user.present?
            redirect_to root_path 
        end
    end
    def logged_in?
        !current_user.nil?
    end
end