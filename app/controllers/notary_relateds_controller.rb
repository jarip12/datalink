class NotaryRelatedsController < ApplicationController
  before_action :set_notary_related, only: [:show, :edit, :update, :destroy]

  # GET /notary_relateds
  def index
    @notary_relateds = NotaryRelated.all
  end

  # GET /notary_relateds/1
  def show
  end

  # GET /notary_relateds/new
  def new
    @notary_related = NotaryRelated.new
  end

  # GET /notary_relateds/1/edit
  def edit
  end

  # POST /notary_relateds
  def create
    @notary_related = NotaryRelated.new(notary_related_params)

    if @notary_related.save
      redirect_to @notary_related, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /notary_relateds/1
  def update
    if @notary_related.update(notary_related_params)
      redirect_to @notary_related,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /notary_relateds/1
  def destroy
    @notary_related.destroy
    redirect_to notary_relateds_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notary_related
      @notary_related = Archive.find(params[:archive_id]).notary_related
    end

    # Only allow a trusted parameter "white list" through.
    def notary_related_params
      params.require(:notary_related).permit(:has_crime_record, :has_testament)
    end
end
