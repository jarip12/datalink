class IdNoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, I18n.t("validate.id_no.format.error") unless Util.id_no_valid?(value)
  end
end