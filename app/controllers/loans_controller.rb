class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      redirect_to @loan, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      redirect_to @loan,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy
    redirect_to loans_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def loan_params
      params.require(:loan).permit(:start_day, :end_day, :loan_type, :description, :amount, :repay_on_time)
    end
end
