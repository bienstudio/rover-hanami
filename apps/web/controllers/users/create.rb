module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:name).filled(:str?)
        required(:email).filled(:str?, format?: /@/)
        required(:password).filled(:str?)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      @user = UserRepository.create(User.new(params[:user]))

      warden.set_user(@user)

      redirect_to routes.root_path
    end
  end
end
