module Api
  module V1
    module NamedParams
      extend ::Grape::API::Helpers

      params :auth do
        requires :server_token, type: String,  desc: "Access Server Token."
      end

    end
  end
end
