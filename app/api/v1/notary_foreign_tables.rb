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

        notary_foreign_table_params = ActionController::Parameters.new(params).permit(:id, :user_id, :realname, :age, :birth_day, :company_location, :residence, :paperwork_name, :paperwork_no, :apply_context, :proxy_people_name, :apply_date, :reserve_at)

        ap notary_foreign_table_params

        data = {}

        if NotaryForeignTable.create(notary_foreign_table_params)

          render_success(data)
        else

          render_success(data)
        end


      end


    end
  end
end