class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  layout "with_left_sidebar", except: [:search, :new_archive, :create]

  load_and_authorize_resource

  def can_edit_multi_times

  end

  def new_archive
    @profile = Profile.new
  end


  def search
    ap params
    q = params[:q]
    @profiles = Profile.where("realname LIKE '#{q}%' or id_no LIKE '#{q}%'").page params[:page]
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

    if @profile.valid? and @profile.save(:validate => false)
      @archive = Archive.create
      @profile.archive_id = @archive.id
      @profile.save(:validate => false)
      if can? :edit, @profile
        ap "can edit profile"
        redirect_to edit_profile_url(@profile), notice: t('action.created.successfully')
      else
        ap "cannot edit profile"
        redirect_to profile_url(@profile), notice: t('action.created.successfully')
      end
    else
      render :new_archive
    end
  end

  # PATCH/PUT /profiles/1
  def update
    @profile.updated_once = true
    if @profile.update(profile_params)
      if can? :edit, @profile
        flash[:notice] = {:class =>'success', :body => t('action.updated.successfully')}
        redirect_to edit_profile_path(@profile)
      else
        flash[:notice] = {:class =>'success', :body => t('action.updated.once_successfully')}
        redirect_to profile_path(@profile)
      end
    else
      ap @profile.errors
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
    def set_profile
      @profile = Profile.find(params[:id])
      @archive = @profile.archive
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:realname, :email, :id_no, :sex, :mobile, :birth_day, :death_day, :address, :archive_id, :avatar)
    end
end
