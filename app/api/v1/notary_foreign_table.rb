module Api
  module V1
    class NotaryForeignTables < Grape::API
      version 'v1', using: :path
      PREFIX = '/api'

      cascade false

      format :json
      default_format :json

      post "assets/save_files_and_subtitles" do

        render_success(data)

      end


    end
  end
end