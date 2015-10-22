class RealnameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, I18n.t("validate.realname.format.error") unless Util.realname_valid?(value)
  end
end