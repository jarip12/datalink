module Api
  module V1
    class NotaryForeignTables < Grape::API
      version 'v1', using: :path
      PREFIX = '/api'

      helpers Api::V1::Helpers

      cascade false

      format :json
      default_format :json

      post "notary_foreign_tables" do

        ap params

        data = {}

        if NotaryForeignTable.create(params)

          render_success(data)
        else

          render_success(data)
        end


      end


    end
  end
end