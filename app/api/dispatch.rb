
module Api
  class Dispatch < Grape::API

    mount Api::V1::Root
    mount Api::V1::NotaryForeignTable

    format :json
    default_format :json

    content_type    :json, "application/json;charset=utf-8"

  end
end