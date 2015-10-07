module Api
  module V1

	  module ExceptionHandlers

	    def self.included(base)
	      base.instance_eval do
	        rescue_from Grape::Exceptions::ValidationErrors do |e|
	          Rack::Response.new({
	            success: false,
							message: e.message,
							data: {}
	          }.to_json, e.status)
	        end
	      end
	    end

	  end

	  class Error < Grape::Exceptions::Base
	    attr :code, :text

	    # code: api error code defined by Peatio, errors originated from
	    # subclasses of Error have code start from 2000.
	    # text: human readable error message
	    # status: http status code
	    def initialize(opts={})
	      @text    = opts[:text]   || ''

	      @status  = 200
	      @message = {success: false, message: @text, data: {}}
	    end
	  end

	  class AuthorizationError < Error
	    def initialize
	      super code: 2001, text: 'Authorization failed', status: 401
	    end
	  end



	  class IncorrectSignatureError < Error
	    def initialize(signature)
	      super code: 2005, text: "Signature #{signature} is incorrect.", status: 401
	    end
	  end

	  class TonceUsedError < Error
	    def initialize(access_key, tonce)
	      super code: 2006, text: "The tonce #{tonce} has already been used by access key #{access_key}.", status: 401
	    end
	  end

	  class InvalidTonceError < Error
	    def initialize(tonce, now)
	      super code: 2007, text: "The tonce #{tonce} is invalid, current timestamp is #{now}.", status: 401
	    end
	  end

	  class InvalidAccessKeyError < Error
	    def initialize(access_key)
	      super code: 2008, text: "The access key #{access_key} does not exist.", status: 401
	    end
	  end

	  class DisabledAccessKeyError < Error
	    def initialize(access_key)
	      super code: 2009, text: "The access key #{access_key} is disabled.", status: 401
	    end
	  end

	  class ExpiredAccessKeyError < Error
	    def initialize(access_key)
	      super code: 2010, text: "The access key #{access_key} has expired.", status: 401
	    end
	  end


  end
end
