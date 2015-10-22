module Api
  module V1
		module Auth
			class Middleware < ::Grape::Middleware::Base

	    	def before
	        if provided?
	          auth = Api::V1::Auth::Authenticator.new(request, params)
						auth.check_server_token!
	        end
	      end

	      def provided?
					params["server_token"]
	      end

	      def request
	        @request ||= ::Grape::Request.new(env)
	      end

	      def params
	        @params ||= request.env["action_dispatch.request.request_parameters"]
	      end

	    end
    end

  end
end
