module Web::Controllers::Users
  class Destroy
    include Web::Action

    def call(params)
      UserRepository.delete(current_user)

      warden.logout

      redirect_to routes.root_path
    end
  end
end
