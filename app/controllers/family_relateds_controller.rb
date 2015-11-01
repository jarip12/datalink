class FamilyRelatedsController < ApplicationController
  before_action :set_family_related, only: [:show, :edit, :update, :destroy]
  layout "with_left_sidebar"
  load_and_authorize_resource


  # GET /family_relateds
  def index
    @family_relateds = FamilyRelated.all
  end

  # GET /family_relateds/1
  def show
  end

  # GET /family_relateds/new
  def new
    @family_related = FamilyRelated.new
  end

  # GET /family_relateds/1/edit
  def edit
  end

  # POST /family_relateds
  def create
    @family_related = FamilyRelated.new(family_related_params)

    if @family_related.save
      redirect_to @family_related, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /family_relateds/1
  def update
    @family_related = FamilyRelated.find(params[:id])
    @family_related.updated_once = true
    if @family_related.update(family_related_params)
      if can? :edit, @family_related
        flash[:notice] = {:class =>'success', :body => t('action.updated.successfully')}
        redirect_to edit_family_related_path
      else
        flash[:notice] = {:class =>'success', :body => t('action.updated.once_successfully')}
        redirect_to family_related_path
      end
    else
      render :edit
    end
  end

  # DELETE /family_relateds/1
  def destroy
    @family_related.destroy
    redirect_to family_relateds_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_related
      @family_related = FamilyRelated.find(params[:id])
      @archive = @family_related.archive
    end

    # Only allow a trusted parameter "white list" through.
    def family_related_params
      params.require(:family_related).permit(
                                             family_relations_attributes: [:id, :_destroy, :id_no, :realname, :relation_name]
      )
    end
end
