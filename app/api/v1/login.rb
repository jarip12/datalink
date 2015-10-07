module Api
  module V1
    class Login < Grape::API
      version 'v1', using: :path
      PREFIX = '/api'

      cascade false

      format :json
      default_format :json

      helpers ::Api::V1::NamedParams

      post "login" do
        user = User.find_by_email(params[:username])
        if user and user.valid_password?(params[:password])
          user.generate_tokens
          user.save!
          info = user.all_screens.each.map do |screen|
            {
              player_name: screen.player.name,
              player_id: screen.player.id,
              screen_name: screen.name,
              screen_id: screen.id
            }
          end
          @data = Api::V1::Entities::User.represent(user).as_json
          @data["info"] = info
          render_success(@data)
        else
          return render_fail("用户名或密码错误")
        end
      end

      get "logout" do
        current_user.generate_tokens
        render_success
      end


    end
  end
end