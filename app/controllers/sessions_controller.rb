class SessionsController < ApplicationController
    include CurrentUserConcern
   def create
    @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to sessions_path
        else
            redirect_to root_path, notice: 'Usuário ou senha incorretos.'
        end
   end 

   def logged_in
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: {
                logged_in: false
            }
        end
   end

   def logout
        reset_session
        @current_user = nil
   end

   def destroy
        logout
        redirect_to root_url
    end
end