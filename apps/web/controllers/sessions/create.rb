module Web::Controllers::Sessions
  class Create
    include Web::Action

    def call(params)
      user = UserRepository.authenticate(
        email: params[:email],
        password: params[:password]
      )

      return redirect_to routes.login_path unless user

      warden.set_user(user)

      redirect_to '/'
    end
  end
end
