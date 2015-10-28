class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, I18n.t("validate.email.format.error") unless Util.email_valid?(value)
  end
end