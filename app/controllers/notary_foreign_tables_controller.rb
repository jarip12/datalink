class NotaryForeignTablesController < ApplicationController
  before_action :set_notary_foreign_table, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  layout "with_left_sidebar"

  # GET /notary_foreign_tables
  def index
    @notary_foreign_tables = NotaryForeignTable.all
  end

  # GET /notary_foreign_tables/1
  def show
    @archive = @notary_foreign_table
  end

  # GET /notary_foreign_tables/new
  def new
    @notary_foreign_table = NotaryForeignTable.new
  end

  # GET /notary_foreign_tables/1/edit
  def edit
  end

  # POST /notary_foreign_tables
  def create
    @notary_foreign_table = NotaryForeignTable.new(notary_foreign_table_params)
    if params["commit"] == "提交"
      @notary_foreign_table.sync_status = "pending"
    end
    @notary_foreign_table.user_id = current_user.id
    @notary_foreign_table.user_verified = current_user.verified
    @notary_foreign_table.id_no = current_user.id_no

    if @notary_foreign_table.save

      if @notary_foreign_table.sync_status == "wait_allow"
        flash[:notice] = {:class =>'success', :body => t('wait_submit')}
        redirect_to edit_notary_foreign_table_url(@notary_foreign_table)
      else
        flash[:notice] = {:class =>'success', :body => t('wait_audit')}
        redirect_to notary_foreign_table_url(@notary_foreign_table)
      end

    else
      render :new
    end
  end

  # PATCH/PUT /notary_foreign_tables/1
  def update
    if params["commit"] == "提交"
      @notary_foreign_table.sync_status = "pending"
    end
    @notary_foreign_table.user_id = current_user.id
    @notary_foreign_table.user_verified = current_user.verified
    @notary_foreign_table.id_no = current_user.id_no
    if @notary_foreign_table.update(notary_foreign_table_params)
      if @notary_foreign_table.sync_status == "wait_allow"
        flash[:notice] = {:class =>'success', :body => t('wait_submit')}
        redirect_to edit_notary_foreign_table_url(@notary_foreign_table)
      else
        flash[:notice] = {:class =>'success', :body => t('wait_audit')}
        redirect_to notary_foreign_table_url(@notary_foreign_table)
      end
    else
      render :edit
    end
  end

  # DELETE /notary_foreign_tables/1
  def destroy
    @notary_foreign_table.destroy
    redirect_to notary_foreign_tables_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notary_foreign_table
      @notary_foreign_table = NotaryForeignTable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notary_foreign_table_params
      params.require(:notary_foreign_table).permit(:realname, :id_no, :age, :birth_day, :company_location, :residence, :paperwork_name, :paperwork_no, :apply_context, :proxy_people_name, :apply_date, :reserve_at)
    end
end
