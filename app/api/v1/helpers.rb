module Api
  module V1
    module Helpers
      def render_success(data = {}, msg = nil)
        status 200
        { success: true, message: msg.to_s, data: data }
      end

      def render_fail(msg = nil, data = {})
        status 200
        { success: false, message: msg.to_s, data: data }
      end

      def authenticate!
        current_user or raise AuthorizationError
      end

      def current_user
        User.first
        #@user ||= env['user']
      end

    end
  end
end
