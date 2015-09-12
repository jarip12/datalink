class MobileValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, I18n.t("validate.mobile.format.error") + "#{value}" unless Util.mobile_valid?(value)
  end
end