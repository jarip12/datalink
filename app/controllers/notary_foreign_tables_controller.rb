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
    respond_to do |format|
      format.pdf do
        Prawn::Document.new do |pdf|
          pdf.font_families["chinese"] = {
              :normal => { :file => "chinese.ttf" },
          }
          pdf.fallback_fonts ["chinese"]

          pdf.table([["往 #{@notary_foreign_table.use_country} 国家/地区使用          申请公证用途: 定居/探亲/工作/学习/结婚/其它"]], :width => 540)

          abroad_info = "申请人已于#{@notary_foreign_table.abroad_day}出境，出境前住址：\n#{@notary_foreign_table.before_abroad_address}"

          person_info = pdf.make_table([["姓名", @notary_foreign_table.realname, "性别", @notary_foreign_table.sex_text, "出生日期", @notary_foreign_table.birth_day, "邮箱", @notary_foreign_table.email],
                                        ["现住址", @notary_foreign_table.now_address, "电话", @notary_foreign_table.mobile], [abroad_info]], :width => 500)
          pdf.table([["申请人", person_info]], :width => 540)

          pdf.table([["工作单位名称、地址、电话（已出境的填写原工作单位）\n#{@notary_foreign_table.work_unit}"], ["请在下列需要办理公证事项"]], :width => 540)
          pdf.table([["申办何种公证", "地址"]], :width => 540)
          pdf.table([['如办出生、结婚、亲属关系分别填写（如办出生请在"备注"栏内写明本人出生地及父母结婚时间）']], :width => 540)

          #relation_first_column = { content: "父母配偶", rowspan: 5, width: 20 }

          relation_details = @notary_foreign_table.notary_relations.map do |notary_relation|
            [notary_relation.relation, notary_relation.realname, notary_relation.english_name, notary_relation.sex_text, notary_relation.birth_day,
              notary_relation.now_address, notary_relation.before_abroad_address]
          end
          relation = [["称谓", "姓名", "外文名", "性别", "出生日期", "先居住地", "未离境者现居地址或已离境者在上海的最后住址"]] + relation_details
          relation_table = pdf.make_table(relation, :width => 500)
          pdf.table([["父母、配偶、亲属关系另一方情况", relation_table]])
          pdf.table([["翻译成何语种( #{@notary_foreign_table.translate_lang} )       公证书份数( #{@notary_foreign_table.file_num} )份"]], :width => 540)
          pdf.table([["是否要求认证( #{@notary_foreign_table.require_notary} )       申请人提交照片( #{@notary_foreign_table.photo_num} )张"]], :width => 540)

          proxy = [["代办人姓名", "与申请人关系", "电话", "联系地址"]] + [[@notary_foreign_table.agent_name, @notary_foreign_table.agent_relation,
                                                         @notary_foreign_table.agent_mobile, @notary_foreign_table.agent_address ]]
          pdf.table(proxy, :width => 540)

          pdf.table([["其它需要说明的有关情况备注:\n#{@notary_foreign_table.comment}"]], :width => 540)
          pdf.table([["申请日期:          申请人/代办人签名(盖章):    "]], :width => 540)
          send_data pdf.render, :filename => "x.pdf", :type => "application/pdf", :disposition => 'inline'
        end
      end
      format.html
    end
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
      params.require(:notary_foreign_table).permit(:realname, :id_no, :age, :birth_day, :use_country, :sex, :email, :now_address, :mobile, :abroad_day, :before_abroad_address,
                                                   :work_unit, :notary_type, :translate_lang, :file_num, :require_notary, :photo_num, :agent_name, :agent_relation,
                                                   :agent_mobile, :agent_address, :comment, :reserve_at,
                                                   notary_relations_attributes: [:id, :_destroy, :relation, :realname, :sex, :english_name, :birth_day, :now_address, :before_abroad_address]
      )
    end
end
