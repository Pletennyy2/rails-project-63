# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require 'active_support/inflector'

# module HexletCode
#   def self.input(entity, field_name, **attributes)
#     field_value = entity.public_send(field_name) if field_name

#     if attributes[:as] == :textarea
#       cols = attributes[:cols] || 20
#       rows = attributes[:rows] || 40
#       "<textarea name='#{field_name}' cols='#{cols}' rows='#{rows}'>#{field_value}</textarea>"
#     else
#       "<input type='text' name='#{field_name}' value='#{field_value}'>"
#     end
#   end

#   def self.form_for(entity, url: '#', &block)
#     form_attributes = { action: url, method: 'post' }
#     form_attributes_str = form_attributes.map { |key, value| %(#{key}="#{value}") }.join(' ')

#     form_tag = "<form #{form_attributes_str}></form>"

#     yield FormBuilder.new(entity, form_tag, self) if block_given?

#     form_tag + "</form>"
#   end

#   class FormBuilder
#     attr_reader :entity, :fields, :context

#     def initialize(entity, form_tag, context)
#       @entity = entity
#       @fields = []
#       @context = context
#     end

#     def input(field_name, **attributes)
#       fields << context.input(entity, field_name, **attributes)
#     end
#   end
# end

module HexletCode
  def self.label(name)
    formatted_name = name.to_s.capitalize
    "<label for='#{name}'>#{formatted_name}</label>"
  end

  def self.input(entity, field_name, **attributes)
    field_value = entity.public_send(field_name) if field_name

    label_html = label(field_name)

    if attributes[:as] == :textarea
      cols = attributes[:cols] || 20
      rows = attributes[:rows] || 40
      "<div>#{label_html}<textarea name='#{field_name}' cols='#{cols}' rows='#{rows}'>#{field_value}</textarea></div>"
    else
      "<div>#{label_html}<input type='text' name='#{field_name}' value='#{field_value}'></div>"
    end
  end

  def self.submit(value='Save')
    "<input type='submit' value='#{value}'>"
  end

  def self.form_for(entity, url: '#', &block)
    form_attributes = { action: url, method: 'post' }
    form_attributes_str = form_attributes.map { |key, value| %(#{key}="#{value}") }.join(' ')

    form_tag = "<form #{form_attributes_str}>"

    yield FormBuilder.new(entity, form_tag, self) if block_given?

    form_tag + "</form>"
  end

  class FormBuilder
    attr_reader :entity, :fields, :context

    def initialize(entity, form_tag, context)
      @entity = entity
      @fields = []
      @context = context
    end

    def label(name)
      @fields << @context.label(name)
    end

    def input(field_name, **attributes)
      @fields << @context.input(entity, field_name, **attributes)
    end

    def submit(value='Save')
      @fields << @context.submit(value)
    end
  end
end
