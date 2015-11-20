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
    next_days = (0..6).to_a.map {|index| (Date.today + index)}
    infos = next_days.select {|day| [1, 2, 3, 4, 5].include?(day.wday)}
    @reserve_days = infos.map {|info| info.to_s}
    @notary_foreign_table.reserve_day = @reserve_days[0]

    respond_to do |format|
      format.pdf do
        Prawn::Font::AFM.hide_m17n_warning= true
        Prawn::Document.new do |pdf|

          pdf.font_families["chinese"] = {
              :normal => { :file => "app/assets/fonts/chinese.ttf" },
          }
          pdf.fallback_fonts ["chinese"]

          pdf.font_size = 11

          pdf.font_size(20) {
            pdf.text "公 证 申 请 表", :align => :center
          }
          pdf.move_down 15

          pdf.bounding_box [0, pdf.cursor], :width => 540, :height => 20 do

            pdf.move_down 4

            pdf.text_box "往   #{@notary_foreign_table.use_country}   国家/地区使用", :at => [0, pdf.cursor]

            pdf.text_box "申请公证用途：", :at => [260, pdf.cursor]
            x = 340

            NotaryForeignTable.notary_use.options.each do |option|
              checked = (option[1] == @notary_foreign_table.notary_use)
              checked_label = (checked)? "\u2611":  "\u2610"
              if checked
                pdf.font "app/assets/fonts/DejaVuSans.ttf" do
                  pdf.text_box checked_label, :at => [x, pdf.cursor]
                end
                x += 10
              end
              pdf.text_box option[0], :at => [x, pdf.cursor]
              x += 25

            end

            pdf.stroke_bounds

          end

          abroad_info = "申请人已于#{@notary_foreign_table.abroad_day}出境，出境前住址：\n#{@notary_foreign_table.before_abroad_address}"

          pdf.bounding_box [0, pdf.cursor], :width => 540, :height => 90 do
            y = pdf.cursor
            pdf.text_box "申请人", :width => 20, :valign => :center, :at => [3, pdf.cursor]
            pdf.bounding_box [20, y], :width => 520, :height => 90 do
              pdf.table [["姓名", @notary_foreign_table.realname, "性别", @notary_foreign_table.sex_text, "出生日期", @notary_foreign_table.birth_day, "邮箱", @notary_foreign_table.email]], :width => 520, :column_widths => [50, 70, 40, 40, 60, 80] do
                row(0).style :align => :center
              end
              pdf.table [["现住址", @notary_foreign_table.now_address, "电话", @notary_foreign_table.mobile, "身份证号码", @notary_foreign_table.id_no]], :width => 520, :column_widths => [50, 110, 40, 100, 80, 140] do
                row(0).style :align => :center
              end
              pdf.table [[abroad_info]], :width => 500, :cell_style => {:borders => []}

              pdf.stroke_bounds
            end
            pdf.stroke_bounds
          end

          pdf.bounding_box [0, pdf.cursor], :width => 540, :height => 20 do
            pdf.move_down 5
            pdf.text_box '请在下列需要办理公证事项', :at => [0, pdf.cursor]
            pdf.font "app/assets/fonts/DejaVuSans.ttf" do
              pdf.text_box "\u2610", :at => [143, pdf.cursor]
            end
            pdf.text_box '处打', :at => [160, pdf.cursor]
            pdf.font "app/assets/fonts/DejaVuSans.ttf" do
              pdf.text_box "\u2713", :at => [185, pdf.cursor]
            end
            pdf.text_box '标记', :at => [200, pdf.cursor]
            pdf.stroke_bounds
          end


          pdf.bounding_box [0, pdf.cursor], :width => 540, :height => 120 do
            y = pdf.cursor
            pdf.move_down 20
            pdf.text_box "申办何种公证", :width => 20
            pdf.bounding_box [20, y], :width => 520, :height => 120 do
              ap "hello from chuck"
              pdf.move_down 8
              NotaryType.type_name.options.each_slice(5) do |slice|
                ap pdf.cursor
                x = 5
                slice.each_with_index do |option, index|
                  checked = (option[1] == @notary_foreign_table.notary_type)
                  checked_label = (checked)? "\u2611":  "\u2610"
                  pdf.font "app/assets/fonts/DejaVuSans.ttf" do
                    pdf.text_box checked_label, :at => [x, pdf.cursor]
                  end
                  x += 15
                  if checked and NotaryForeignTable.has_notary_type_info?(option[1])
                    pdf.text_box option[0] + " (  " + @notary_foreign_table.notary_type_info.to_s + "  )" , :at => [x, pdf.cursor]
                    x += 60
                  else
                    pdf.text_box option[0], :at => [x, pdf.cursor]
                  end
                  x += 80
                  ap pdf.cursor
                end

                pdf.move_down 20

              end
              pdf.stroke_bounds
            end
            pdf.stroke_bounds
          end

          pdf.table([["工作单位名称、地址、电话（已出境的填写原工作单位）\n#{@notary_foreign_table.work_unit}"]], :width => 540, :cell_style => {height: 50})

          pdf.table([['如办出生、结婚、亲属关系分别填写（如办出生请在"备注"栏内写明本人出生地及父母结婚时间）']], :width => 540, :cell_style => {:padding => [5, 0, 5, 20]})

          #relation_first_column = { content: "父母配偶", rowspan: 5, width: 20 }

          relation_details = @notary_foreign_table.notary_relations.map do |notary_relation|
            [notary_relation.relation, notary_relation.realname, notary_relation.english_name, notary_relation.sex_text, notary_relation.birth_day,
              notary_relation.now_address, notary_relation.before_abroad_address]
          end

          if relation_details.count < 4
            relation_details += [[" "] * 7] * (4 - relation_details.count)
          end
          relation = [["称谓", "姓名", "外文名", "性别", "出生日期", "现居住地", "未离境者现居地址或已离境者在上海的最后住址"]] + relation_details
          relation_table = pdf.make_table(relation, :width => 500, :column_widths => {0 => 40, 1 => 60, 2 => 60, 3 => 35, 4 => 55, 5 => 120}   ) do
            row(0..relation.count).style :align => :center
          end
          pdf.table [["父母、配偶、亲属关系另一方情况", relation_table]] do
            row(0).style :align => :center
          end

          pdf.table([["翻译成何语种 (     #{@notary_foreign_table.translate_lang}     )", "公证书份数 (     #{@notary_foreign_table.file_num}     )份"]], :width => 540) do
            column(0).borders = [:top, :bottom, :left]
            column(1).borders = [:top, :bottom, :right]
          end

          pdf.table([["是否要求认证 (     #{@notary_foreign_table.require_notary_text}     )", "申请人提交照片 (     #{@notary_foreign_table.photo_num}     )张"]], :width => 540) do
            column(0).borders = [:top, :bottom, :left]
            column(1).borders = [:top, :bottom, :right]
          end

          proxy = [["代办人姓名", "与申请人关系", "电话", "联系地址"]] + [[@notary_foreign_table.agent_name, @notary_foreign_table.agent_relation,
                                                         @notary_foreign_table.agent_mobile, @notary_foreign_table.agent_address ]]
          pdf.table(proxy, :width => 540, :column_widths => [80, 120, 90, 250], :cell_style => {:height => 30, :align => :center})

          pdf.table([["其它需要说明的有关情况备注:\n#{@notary_foreign_table.comment}"]], :width => 540, :cell_style => {height: 60})
          pdf.table([["申请日期:", "申请人/代办人签名 ( 盖章 ):    #{@notary_foreign_table.realname}"]], :width => 540) do
            column(0).borders = [:top, :bottom, :left]
            column(1).borders = [:top, :bottom, :right]
          end
          pdf.move_down 5
          pdf.text "接 待 人:"
          send_data pdf.render, :filename => "x.pdf", :type => "application/pdf", :disposition => 'inline'
        end
      end
      format.html
    end
  end

  # GET /notary_foreign_tables/new
  def new
    @notary_foreign_table = NotaryForeignTable.new
    @notary_foreign_table.notary_relations << NotaryRelation.new

    next_days = (0..6).to_a.map {|index| (Date.today + index)}
    infos = next_days.select {|day| [1, 2, 3, 4, 5].include?(day.wday)}
    @reserve_days = infos.map {|info| info.to_s}
    @notary_foreign_table.reserve_day = @reserve_days[0]
  end

  def edit

    @archive = @notary_foreign_table.reservation.archive

    next_days = (0..6).to_a.map {|index| (Date.today + index)}
    infos = next_days.select {|day| [1, 2, 3, 4, 5].include?(day.wday)}
    @reserve_days = infos.map {|info| info.to_s}
    ap @reserve_days
  end

  def already_being_book(notary_foreign_table)
    ReserveDate.where(reserve_day: notary_foreign_table.reserve_day, reserve_hour: notary_foreign_table.reserve_hour).count > 0
  end

  # POST /notary_foreign_tables
  def create
    @notary_foreign_table = NotaryForeignTable.new(notary_foreign_table_params)

    if already_being_book(@notary_foreign_table)
      flash[:notice] = {:class =>'danger', :body => t('already_booked')}
      next_days = (0..6).to_a.map {|index| (Date.today + index)}
      infos = next_days.select {|day| [1, 2, 3, 4, 5].include?(day.wday)}
      @reserve_days = infos.map {|info| info.to_s}
      render :new
      return
    end


    if params["commit"] == "提交"
      @notary_foreign_table.sync_status = "pending"
      ReserveDate.create!(reserve_day: @notary_foreign_table.reserve_day, reserve_hour: @notary_foreign_table.reserve_hour)
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
    if @notary_foreign_table.update(notary_foreign_table_params)
      flash[:notice] = {:class =>'success', :body => t('action.updated.successfully')}
      redirect_to edit_notary_foreign_table_url(@notary_foreign_table)
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
      params.require(:notary_foreign_table).permit(:reserve_day, :reserve_hour, :notary_type_info, :notary_use, :realname, :id_no, :age, :birth_day, :use_country, :sex, :email, :now_address, :mobile, :abroad_day, :before_abroad_address,
                                                   :work_unit, :notary_type, :translate_lang, :file_num, :require_notary, :photo_num, :agent_name, :agent_relation,
                                                   :agent_mobile, :agent_address, :comment,
                                                   notary_types_attributes: [:id, :_destroy, :type_name, :type_info],
                                                   notary_relations_attributes: [:id, :_destroy, :relation, :realname, :sex, :english_name, :birth_day, :now_address, :before_abroad_address]
      )
    end
end
