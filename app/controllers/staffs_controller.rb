class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource


  def index
    @staffs = Staff.all.page params[:page]
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def show
  end

  def create
    raise AuthorizationError unless current_staff.admin?
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
    raise AuthorizationError unless current_staff.admin?
    ap staff_params
    if @staff.update(staff_params)
      redirect_to staffs_url,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  def destroy
    raise AuthorizationError unless current_staff.admin?
    @staff.destroy
    redirect_to staffs_url, notice: t('action.destroyed.successfully')
  end


  private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def staff_params
      params.require(:staff).permit(:role, :street, :city, :province, :district, :mobile, :realname, :staffname, :email, :password, :password_confirmation)
    end
end
