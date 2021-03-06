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

        ap "random_token: " + params[:random_token]

        tables = NotaryForeignTable.where(table_no: params[:table_no])
        if tables.count > 0
          return render_success({})
        end
        notary_foreign_table_params = ActionController::Parameters.new(params).permit(:table_no, :sex, :use_country, :now_address, :before_abroad_address, :abroad_day, :notary_type, :notary_type_info, :translate_lang, :email, :mobile, :file_num,
                                                                                      :require_notary, :photo_num, :work_unit, :comment, :agent_name, :agent_relation, :agent_mobile, :agent_address, :notary_use, :reserve_hour, :reserve_day, :user_id, :id_no, :user_verified, :realname, :age, :birth_day, :residence)

        @notary_foreign_table = NotaryForeignTable.new(notary_foreign_table_params)
        reserve_at = (@notary_foreign_table.reserve_day + " " + @notary_foreign_table.reserve_hour + ":00").to_datetime
        ap @notary_foreign_table.reserve_hour.split(':')[-1]
        if Reservation.where(reserve_at: reserve_at).count > 0 or (@notary_foreign_table.reserve_hour.split(':')[-1] != '00' and @notary_foreign_table.reserve_hour.split(':')[-1] != '30')
          return render_fail('预约时间已经存在或者不合法', {})
        end

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

          params["notary_types"].each do |info|
            ap info
            notary_type_params = ActionController::Parameters.new(info).permit(:type_name, :type_info)
            notary_type_params["notary_foreign_table_id"] = @notary_foreign_table.id
            NotaryType.create!(notary_type_params)
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