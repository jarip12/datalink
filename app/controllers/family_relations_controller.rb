class FamilyRelationsController < ApplicationController
  before_action :set_family_relation, only: [:show, :edit, :update, :destroy]

  # GET /family_relations
  def index
    @family_relations = FamilyRelation.all
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
    def set_family_relation
      @family_relation = FamilyRelation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def family_relation_params
      params.require(:family_relation).permit(:my_id, :relation_name, :relation_id_card)
    end
end
