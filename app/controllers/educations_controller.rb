class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /educations
  def index
    @educations = Education.all
  end

  # GET /educations/1
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  def create
    @education = Education.new(education_params)

    if @education.save
      redirect_to @education, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /educations/1
  def update
    if @education.update(education_params)
      redirect_to @education,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /educations/1
  def destroy
    @education.destroy
    redirect_to educations_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def education_params
      params.require(:education).permit(:education_type, :school_name, :degree, :enroll_day, :graduation_day)
    end
end
