class NotaryRelatedsController < ApplicationController
  before_action :set_notary_related, only: [:show, :edit, :destroy]
  layout "with_left_sidebar"
  load_and_authorize_resource



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
    @notary_related = NotaryRelated.find(params[:id])
    if @notary_related.update(notary_related_params)
      flash[:notice] = {:class =>'success', :body => t('action.updated.successfully')}
      redirect_to edit_notary_related_url(@notary_related)
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
      @notary_related = NotaryRelated.find(params[:id])
      @archive = @notary_related.archive
    end

    # Only allow a trusted parameter "white list" through.
    def notary_related_params
      params.require(:notary_related).permit(:has_crime_record, :has_testament,
                                             educations_attributes: [:id, :_destroy, :education_type, :school_name, :degree, :enroll_day, :graduation_day],
                                             work_experiences_attributes: [:id, :_destroy, :start_day, :end_day, :company_name, :job_title, :graduation_day],
                                             notaries_attributes: [:id, :_destroy, :no, :notary_type],
                                             faker_materials_attributes: [:id, :_destroy, :faker_material_no, :faker_material_type],
      )
    end
end
