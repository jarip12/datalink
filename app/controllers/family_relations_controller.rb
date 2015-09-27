class FamilyRelationsController < ApplicationController
  before_action :set_archive, only: [:index, :show, :edit, :update, :destroy]

  load_and_authorize_resource
  layout "with_left_sidebar"


  # GET /family_relations
  def index
    @family_relations = @archive.family_relations
  end

  # GET /family_relations/1
  def show
  end

  # GET /family_relations/new
  def new
    @family_relation = FamilyRelation.new
  end

  # GET /family_relations/1/edit
  def edit
  end

  # POST /family_relations
  def create
    @family_relation = FamilyRelation.new(family_relation_params)

    if @family_relation.save
      redirect_to @family_relation, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /family_relations/1
  def update
    if @family_relation.update(family_relation_params)
      redirect_to @family_relation,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /family_relations/1
  def destroy
    @family_relation.destroy
    redirect_to family_relations_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:archive_id])
    end

    # Only allow a trusted parameter "white list" through.
    def family_relation_params
      params.require(:family_relation).permit(:id_no, :realname, :relation, :owner_archive_id)
    end
end
