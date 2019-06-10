class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    msg = 'is not an upcoming date'
    record.errors[attribute] << (options[:message] || msg) if value < DateTime.now
  end
end