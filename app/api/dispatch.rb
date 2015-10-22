
module Api
  class Dispatch < Grape::API

    mount Api::V1::Root
    #mount Api::V1::NotaryForeignTables

    #use Api::V1::Auth::Middleware

    format :json
    default_format :json

    content_type    :json, "application/json;charset=utf-8"

  end
end