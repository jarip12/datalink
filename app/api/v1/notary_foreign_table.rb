module Api
  module V1
    class NotaryForeignTable < Grape::API
      version 'v1', using: :path
      PREFIX = '/api'

      helpers Api::V1::Helpers

      cascade false

      format :json
      default_format :json

      post "notary_foreign_table/create" do

        ap params

        data = {}

        render_success(data)

      end


    end
  end
end