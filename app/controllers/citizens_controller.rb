class CitizensController < ApplicationController
  before_action :set_citizen, only: [:show, :edit, :update, :destroy]

  def search
    ap params
    q = params[:q]
    @citizens = Citizen.where("realname LIKE '#{q}%'")
  end

  # GET /citizens
  def index
    @citizens = Citizen.all
  end

  # GET /citizens/1
  def show
  end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
  end

  # GET /citizens/1/edit
  def edit
  end

  # POST /citizens
  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      redirect_to @citizen, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /citizens/1
  def update
    if @citizen.update(citizen_params)
      redirect_to @citizen,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /citizens/1
  def destroy
    @citizen.destroy
    redirect_to citizens_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizen
      @citizen = Citizen.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def citizen_params
      params.require(:citizen).permit(:id_no, :realname)
    end
end
