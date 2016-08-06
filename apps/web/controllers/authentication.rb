require 'core_ext/object/try'

module Rover
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :current_user
        expose :current_user?
      end
    end

    def current_user
      @current_user ||= warden.try(:user)
    end

    def current_user?
      !current_user.nil?
    end

    def warden
      request.env['warden']
    end

    def authenticate!
      warden.authenticate!
    end
  end
end
