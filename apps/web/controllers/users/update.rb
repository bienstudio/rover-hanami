module Web::Controllers::Users
  class Update
    include Web::Action

    params do
      required(:user).schema do
        optional(:name).filled(:str?)
        optional(:email).filled(:str?)
        optional(:password).filled(:str?)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      current_user.name = params[:user][:name] unless params[:user][:name].nil?
      current_user.email = params[:user][:email] unless params[:user][:email].nil?
      current_user.password = params[:user][:password] unless params[:user][:password].nil?

      UserRepository.update(current_user)

      redirect_to routes.account_path
    end
  end
end
