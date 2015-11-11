module Api
  module V1
    class NotaryForeignTables < Grape::API
      version 'v1', using: :path
      PREFIX = '/api'

      helpers Api::V1::Helpers
      helpers ::Api::V1::NamedParams

      use Api::V1::Auth::Middleware


      cascade false

      format :json
      default_format :json

      params do
        use :auth
      end
      post "notary_foreign_tables" do

        notary_foreign_table_params = ActionController::Parameters.new(params).permit(:reserve_hour, :reserve_day, :user_id, :id_no, :user_verified, :realname, :age, :birth_day, :company_location, :residence, :paperwork_name, :paperwork_no, :apply_context, :proxy_people_name, :apply_date, :reserve_at)

        @notary_foreign_table = NotaryForeignTable.new(notary_foreign_table_params)

        ap notary_foreign_table_params

        @notary_foreign_table.reserve_at = Time.now + rand(1...7).days

        data = {}

        if @notary_foreign_table.save
          ap params

          Reservation.create(user_id: @notary_foreign_table.user_id, reserve_at: @notary_foreign_table.reserve_at, notary_table_id: @notary_foreign_table.id, notary_table_type: "foreign")

          render_success(data)
        else

          render_fail(data)
        end


      end


    end
  end
end