def warden
  @warden ||= begin
    opts = -> do
      [404, { 'Content-Type' => 'text/plain' }, ['Not found!']]
    end

    manager = Warden::Manager.new(opts)

    Warden::Proxy.new({ 'rack.session' => {} }, manager)
  end
end
