class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.create!(
            email: params['user']['email'],
            password: params['user']['password'],
            password_confirmation: params['user']['password']
        )

        if user
            session[:user_id] = user.id
			@historium = Historium.select(:livro).distinct
			@historium.each do |livros|
				inicio = Historium.where(livro: livros.livro).minimum("id")
				now = Time.now
				data = { historia_id: inicio, user_id: user.id, livro:livros.livro , created_at: now, updated_at: now }
				UserHistorium.insert(data)
			end
            redirect_to historia_path, notice: "Usuário foi criado com sucesso!"
        else
            redirect_to new_user_path, notice: "Erro ao cadastrar Usuário!"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end