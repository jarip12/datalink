module Api
  module V1
    class Assets < Grape::API
      version 'v1', using: :path
      PREFIX = '/api'

      helpers ::Api::V1::NamedParams

      cascade false

      format :json
      default_format :json

      post "assets/save_files_and_subtitles" do
        if (not params[:files]) and (not params[:subtitles])
          return render_fail("files或者subtitles至少要存在一个")
        end

        data = {}

        asset_file_ids = []
        if params[:files]
          params[:files].each do |info|
            file_params = ActionController::Parameters.new(info).permit(:file_type, :name, :path,
                                                                      :description, :resolution_x, :resolution_y, :duration, :file_size, :md5)
            file_params["user_id"] = current_user.id
            file_params["db_version"] = params["db_version"].to_f
            asset_file = AssetFile.create!(file_params)
            asset_file_ids.append(asset_file.id)
          end
          data["file_ids"] = asset_file_ids
        end

        asset_subtitle_ids = []
        if params[:subtitles]
          params[:subtitles].each do |info|
            subtitle_params = ActionController::Parameters.new(info).permit(:name, :description, :text, :font_name, :font_size, :font_style, :font_color, :font_alpha, :stroke_color,
                                                                            :stroke_width, :stroke_alpha, :shadow_offset_x, :shadow_offset_y, :shadow_color, :shadow_alpha, :direction,
                :effect, :duration, :speed
            )
            subtitle_params["user_id"] = current_user.id
            subtitle_params["db_version"] = params["db_version"].to_f
            asset_subtitle = AssetSubtitle.create!(subtitle_params)
            asset_subtitle_ids.append(asset_subtitle.id)
          end
          data["subtitle_ids"] = asset_subtitle_ids
        end

        render_success(data)

      end

      post "assets/save" do

        if params[:assets]
          asset_ids = []
          params[:assets].each do |info|
            asset_params = ActionController::Parameters.new(info).permit(:group_id, :asset_file_id, :asset_subtitle_id,
                                                                     :position_x, :position_y, :size_x, :size_y, :alpha, :order, :repeat)
            asset_params['user_id'] = current_user.id
            asset_params['db_version'] = params["db_version"].to_f
            if asset_params.has_key?("asset_subtitle_id") and asset_params.has_key?("asset_file_id")
              return render_fail("asset不能既有标题，又有字幕")
            elsif (not asset_params.has_key?("asset_subtitle_id")) and (not asset_params.has_key?("asset_file_id"))
              return render_fail("asset要有标题，或者字幕, 有且一个")
            elsif asset_params.has_key?("asset_file_id") and (not AssetFile.exists?(asset_params["asset_file_id"].to_i))
              return render_fail("文件#{asset_params['asset_file_id']}不存在")
            elsif asset_params.has_key?("asset_subtitle_id") and (not AssetSubtitle.exists?(asset_params["asset_subtitle_id"].to_i))
              return render_fail("字幕#{asset_params['asset_subtitle_id']}不存在")
            end
            asset = Asset.create!(asset_params)
            asset_ids.append(asset.id)
          end
          return render_success({asset_ids: asset_ids})
        else
          return render_fail("assets不在json中")
        end
      end


    end
  end
end