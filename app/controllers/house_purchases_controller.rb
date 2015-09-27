class HousePurchasesController < ApplicationController
  before_action :set_house_purchase, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /house_purchases
  def index
    @house_purchases = HousePurchase.all
  end

  # GET /house_purchases/1
  def show
  end

  # GET /house_purchases/new
  def new
    @house_purchase = HousePurchase.new
  end

  # GET /house_purchases/1/edit
  def edit
  end

  # POST /house_purchases
  def create
    @house_purchase = HousePurchase.new(house_purchase_params)

    if @house_purchase.save
      redirect_to @house_purchase, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /house_purchases/1
  def update
    if @house_purchase.update(house_purchase_params)
      redirect_to @house_purchase,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /house_purchases/1
  def destroy
    @house_purchase.destroy
    redirect_to house_purchases_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_purchase
      @house_purchase = HousePurchase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def house_purchase_params
      params.require(:house_purchase).permit(:trade_day, :trade_type, :house_type, :house_address, :house_amount)
    end
end
