class ProfilesController < ApplicationController
  before_action :set_archive_and_profile, only: [:show, :edit, :update, :destroy]

  layout "with_left_sidebar", except: [:search]
  #load_and_authorize_resource

  load_and_authorize_resource :archive
  load_and_authorize_resource :profile, :through => :archive, :singleton => true
  skip_load_and_authorize_resource :archive, :search

  def can_edit_multi_times

  end


  def search
    ap params
    q = params[:q]
    @profiles = Profile.where("realname LIKE '#{q}%'")
  end

  # GET /profiles
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      flash[:notice] = {:class =>'success', :body => t('action.updated.successfully')}
      if can? :edit, @archive
        redirect_to archive_profile_edit_path(@archive)
      else
        redirect_to archive_profile_path(@archive)
      end
    else
      render :edit
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive_and_profile
      @archive = Archive.find(params[:archive_id])
      ap @archive
      @profile = @archive.profile
      ap @profile
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:realname, :id_no, :sex, :mobile, :birth_day, :death_day, :address, :archive_id, :avatar)
    end
end
