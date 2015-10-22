module Api
  module V1
    module NamedParams
      extend ::Grape::API::Helpers

      params :auth do
        requires :access_key, type: String,  desc: "Access key."
        requires :tonce,      type: Integer, desc: "Tonce is an integer represents the milliseconds elapsed since Unix epoch."
        requires :signature,  type: String,  desc: "The signature of your request payload, generated using your secret key."
      end

    end
  end
end
