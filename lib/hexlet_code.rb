# frozen_string_literal: true

# lib/hexlet_code.rb
# require_relative 'hexlet_code/form_builder'
# require_relative 'hexlet_code/tag'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  def self.form_for(entity, url: '#', &block)
    form_attributes = { action: url, method: 'post' }
    form_attributes_str = form_attributes.map { |key, value| %(#{key}="#{value}") }.join(' ')

    form_tag = "<form #{form_attributes_str}>"

    form_builder = FormBuilder.new(entity, form_tag, self)
    form_builder.instance_eval(&block)

    fields_html = form_builder.fields.join("\n")

    form_tag + "\n#{fields_html}\n</form>"
  end

  def self.input(_entity, field_name, **attributes)
    form_builder.input(field_name, **attributes)
  end

  def self.textarea(field_name, **attributes)
    form_builder.textarea(field_name, **attributes)
  end

  def self.submit(value = 'Save')
    form_builder.submit(value)
  end

  def self.label(name)
    Tag.build('label', for: name) { name.to_s.capitalize }
  end
end
