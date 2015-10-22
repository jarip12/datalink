module Api
  module V1
    module Auth
      class Authenticator

	      def initialize(request, params)
	        @request = request
	        @params  = params
	      end

				def check_server_token!
					ap "check server token"
					ap "params server_token is #{@params['server_token']} "
					ap "system server_token is #{Setting.server_token} "
					raise Api::V1::IncorrectSignatureError, @params[:signature] unless @params["server_token"] == Setting.server_token
				end

	      def endpoint
	        @request.env['api.endpoint']
	      end

	      def route_scopes
	        endpoint.options[:route_options][:scopes]
	      end

			end
  	end
	end
end
