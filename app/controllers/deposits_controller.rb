class DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :edit, :update, :destroy]

  # GET /deposits
  def index
    @deposits = Deposit.all
  end

  # GET /deposits/1
  def show
  end

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits
  def create
    @deposit = Deposit.new(deposit_params)

    if @deposit.save
      redirect_to @deposit, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /deposits/1
  def update
    if @deposit.update(deposit_params)
      redirect_to @deposit,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /deposits/1
  def destroy
    @deposit.destroy
    redirect_to deposits_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Deposit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deposit_params
      params.require(:deposit).permit(:deposit_day, :receive_day, :amount)
    end
end
