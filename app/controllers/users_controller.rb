class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.create!(
            email: params['user']['email'],
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation']
        )

        if user
            session[:user_id] = user.id
            UserHistorium.create!(
                historia: 1,
                user: session[:user_id]
            )
            redirect_to historia_path, notice: "Usuário foi criado com sucesso!"
        else
            render json: { status: 500}
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end