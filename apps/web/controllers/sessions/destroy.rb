module Web::Controllers::Sessions
  class Destroy
    include Web::Action

    def call(params)
      warden.logout

      redirect_to routes.root_path
    end
  end
end
