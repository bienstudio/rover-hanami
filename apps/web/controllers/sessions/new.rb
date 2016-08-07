module Web::Controllers::Sessions
  class New
    include Web::Action

    def call(params)
      return redirect_to(routes.root_path) if current_user?
    end
  end
end
