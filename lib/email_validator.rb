# encoding: UTF-8
# email validator gem

class EmailValidator < ActiveModel::EachValidator
  @@default_options = { strict_mode: true }

  def self.regexp(options = {})
    options = default_options.merge(options)

    name_validation = options[:strict_mode] ? "-\\p{L}\\d+._" : "^@\\s"

    /\A\s*([#{name_validation}]{1,64})@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/i
  end

  def self.valid?(value, options = {})
    !!(value =~ regexp(options))
  end

  def self.default_options
    @@default_options
  end

  def validate_each(record, attribute, value)
    options = @@default_options.merge(self.options)

    unless self.class.valid?(value, self.options)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end