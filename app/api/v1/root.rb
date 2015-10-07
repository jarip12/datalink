require_relative 'errors'

module Api
  module V1
    class Root < Grape::API

      version 'v1', using: :path
      PREFIX = '/api'

      cascade false
      include Api::V1::ExceptionHandlers

      use Api::V1::Auth::Middleware

      mount Api::V1::Notary

      format :json
      default_format :json

      before do
        header 'Access-Control-Allow-Origin', '*'
      end

    end
  end
end