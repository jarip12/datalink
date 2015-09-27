class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource


  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def show
  end

  def create
    ap staff_params
    @staff = Staff.new(staff_params)
    ap @staff

    if @staff.save
      redirect_to staffs_url, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /staffs/1
  def update
    ap staff_params
    if @staff.update(staff_params)
      redirect_to staffs_url,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  def destroy
    @staff.destroy
    redirect_to staffs_url, notice: t('action.destroyed.successfully')
  end


  private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def staff_params
      params.require(:staff).permit(:street, :city, :province, :district, :mobile, :realname, :staffname, :email, :password, :password_confirmation)
    end
end
