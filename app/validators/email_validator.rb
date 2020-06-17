# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attr, value)
    return if value.blank?

    record.errors.add(attr, 'は正しい形式で入力してください') \
      unless value =~ /^\w+[\-+\w]*([.'][\-+\w]+)*@\w+([\-.]\w+)*\.\w+([\-.]\w+)*$/
  end
end
