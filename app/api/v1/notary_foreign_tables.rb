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

        notary_foreign_table_params = ActionController::Parameters.new(params).permit(:sex, :use_country, :now_address, :before_abroad_address, :abroad_day, :notary_type, :notary_type_info, :translate_lang, :email, :mobile, :file_num,
                                                                                      :require_notary, :photo_num, :work_unit, :comment, :agent_name, :agent_relation, :agent_mobile, :agent_address, :notary_use, :reserve_hour, :reserve_day, :user_id, :id_no, :user_verified, :realname, :age, :birth_day, :residence)
        @notary_foreign_table = NotaryForeignTable.new(notary_foreign_table_params)

        ap notary_foreign_table_params

        data = {}

        if @notary_foreign_table.save
          ap params

          reservation = Reservation.create!(user_id: @notary_foreign_table.user_id, notary_table_id: @notary_foreign_table.id, notary_table_type: "waimin")
          @notary_foreign_table.reservation_id = reservation.id
          @notary_foreign_table.save

          params["notary_relations"].each do |info|
            ap info
            notary_relation_params = ActionController::Parameters.new(info).permit(:relation, :realname, :english_name, :sex, :birth_day, :now_address, :before_abroad_address)
            notary_relation_params["notary_foreign_table_id"] = @notary_foreign_table.id
            NotaryRelation.create!(notary_relation_params)
          end


          render_success(data)
        else

          ap @notary_foreign_table.errors

          render_fail(data)
        end


      end


    end
  end
end