module Web::Controllers::Sessions
  class Create
    include Web::Action

    params do
      required(:email).filled(:str?)
      required(:password).filled(:str?)
    end

    def call(params)
      halt 400 unless params.valid?

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
