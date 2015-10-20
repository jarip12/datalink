class ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]
  autocomplete :user, :email, :full => true

  layout "with_left_sidebar", except: [:new]

  load_and_authorize_resource


  def notary_records
    @archive = Archive.find(params[:archive_id])
    @notary_records = @archive.notary_records
  end


  def faker_field

  end

  # GET /archives
  def index
    @archives = Archive.all
  end

  # GET /archives/1
  def show
  end

  # GET /archives/new
  def new
    #binding.pry
    @archive = Archive.new
    #@archive.save(validate: false)
    ap @archive
    @profile = @archive.build_profile
  end

  # GET /archives/1/edit
  def edit
  end

  # POST /archives
  def create
    #binding.pry
    @archive = Archive.new(except_profile_params)


    if @archive.save
      profile_attrs = archive_params[:profile_attributes]
      profile_attrs['archive_id'] = @archive.id
      @profile = Profile.new(profile_attrs)
      @profile.save(:validate => false)

      ap @profile

      if can? :edit, @profile
        ap "can edit profile"
        redirect_to edit_profile_url(@profile), notice: t('action.created.successfully')
      else
        ap "cannot edit profile"
        redirect_to profile_url(@profile), notice: t('action.created.successfully')
      end

    else
      ap @archive.errors
      ap "archive create fail"
      render :new
    end
  end

  # PATCH/PUT /archives/1
  def update
    if @archive.update(archive_params)
      if can? :edit, @archive
        redirect_to archive_profile_edit_url(@archive), notice: t('action.created.successfully')
      else
        redirect_to archive_profile_url(@archive), notice: t('action.created.successfully')
      end
    else
      render :edit
    end
  end

  # DELETE /archives/1
  def destroy
    @archive.destroy
    redirect_to archives_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def archive_params
      params.require(:archive).permit(:realname, :id_no, :user_id, profile_attributes: [:realname, :id_no],
          loans_attributes: [:notary_type, :description, :amount, :repay_on_time],
          house_purchases_attributes: [:trade_day, :trade_type, :house_type, :house_address, :house_amount],
          deposits_attributes: [:deposit_day, :receive_day, :amount],
          family_relations_attributes: [:id_no, :realname, :relation]
      )
    end

    def except_profile_params
      archive_params.except(:profile_attributes)
    end
end
