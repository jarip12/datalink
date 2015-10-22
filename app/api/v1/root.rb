require_relative 'errors'

module Api
  module V1
    class Root < Grape::API

      version 'v1', using: :path
      PREFIX = '/api'
      helpers Api::V1::Helpers

      cascade false

      use Api::V1::Auth::Middleware

      mount Api::V1::NotaryForeignTables


      #include Api::V1::ExceptionHandlers

      #mount Api::V1::NotaryForeignTable

      format :json
      default_format :json

      before do
        header 'Access-Control-Allow-Origin', '*'
      end

    end
  end
end