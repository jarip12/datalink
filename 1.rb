require "prawn"
require "prawn/table"


Prawn::Document.generate("hello.pdf") do

  font_families["chinese"] = {
    :normal => { :file => "chinese.ttf" },
  }
  fallback_fonts ["chinese"]

  person_info = make_table([["姓名", "    ", "性别", "  ", "出生日期", "      ", "邮箱", "   "], ["现住址", "  ", "电话", "    "]])
  person = make_table([["申请人"], [person_info]])

  table([["往           国家/地区使用          申请公证用途: 定居/探亲/工作/学习/结婚/其它"], [person]])
  #table [["xxeee", "gex"], ["apply", person_table]]
end

system("open hello.pdf")

