class PropertyRelatedsController < ApplicationController
  before_action :set_property_related, only: [:show, :edit, :destroy]
  layout "with_left_sidebar"
  load_and_authorize_resource


  # GET /property_relateds
  def index
    @property_relateds = NotaryRelated.all
  end

  # GET /property_relateds/1
  def show
  end

  # GET /property_relateds/new
  def new
    @property_related = NotaryRelated.new
  end

  # GET /property_relateds/1/edit
  def edit
  end

  # POST /property_relateds
  def create
    @property_related = NotaryRelated.new(property_related_params)

    if @property_related.save
      redirect_to @property_related, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /property_relateds/1
  def update
    @property_related = NotaryRelated.find(params[:id])
    if @property_related.update(property_related_params)
      flash[:notice] = {:class =>'success', :body => t('action.updated.successfully')}
      redirect_to archive_property_related_edit_url(@property_related.archive_id)
    else
      render :edit
    end
  end

  # DELETE /property_relateds/1
  def destroy
    @property_related.destroy
    redirect_to property_relateds_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_related
      @archive = Archive.find(params[:archive_id])
      @property_related = @archive.property_related
    end

    # Only allow a trusted parameter "white list" through.
    def property_related_params
      params.require(:property_related).permit(:has_crime_record, :has_testament,
                                             loans_attributes: [:id, :_destroy, :start_day, :end_day, :notary_type, :description, :amount],
                                             house_purchases_attributes: [:id, :_destroy, :trade_day, :trade_type, :house_type, :house_address, :house_amount],
                                             deposits_attributes: [:id, :_destroy, :deposit_day, :receive_day, :amount]
      )
    end
end
