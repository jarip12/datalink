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

        notary_foreign_table_params = ActionController::Parameters.new(params).permit(:user_id, :realname, :age, :birth_day, :company_location, :residence, :paperwork_name, :paperwork_no, :apply_context, :proxy_people_name, :apply_date, :reserve_at)

        @notary_foreign_table = NotaryForeignTable.new(notary_foreign_table_params)

        ap notary_foreign_table_params

        @notary_foreign_table.reserve_at = Time.now + rand(1...7).days

        data = {}

        if @notary_foreign_table.save

          Reservation.create(notary_table_id: @notary_foreign_table.id, notary_table_type: "foreign")

          render_success(data)
        else

          render_success(data)
        end


      end


    end
  end
end