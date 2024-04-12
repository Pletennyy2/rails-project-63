# frozen_string_literal: true

require_relative 'hexlet_code/version'


module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  def self.form_for(model, options = {})
    @model = model
    @options = options
    result = "<form action='#{@options[:url]}' method='post'>"
    yield(self) if block_given?
    result += "</form>"
    result
  end

  def self.input(attribute, options = {})
    value = @model.send(attribute)
    input_type = options[:as] || :text
    input_attrs = { name: attribute, value: value }
    input_attrs[:type] = input_type unless input_type == :text

    input_attrs.merge!(options.except(:as))

    label = "<label for='#{attribute}'>#{attribute.capitalize}</label>"
    input = if input_type == :text
              "<textarea #{build_attributes(input_attrs)}>#{value}</textarea>"
            else
              "<input #{build_attributes(input_attrs)}>"
            end

    label + input
  end

  def self.submit(text = 'Save')
    "<input type='submit' value='#{text}'>"
  end

  private

  def self.build_attributes(attrs)
    attrs.map { |key, value| "#{key}='#{value}'" }.join(' ')
  end
end
