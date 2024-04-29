# frozen_string_literal: true

# lib/hexlet_code/form_builder.rb

module HexletCode
  class FormBuilder
    attr_reader :fields

    def initialize(entity, form_tag, form_builder)
      @entity = entity
      @fields = []
      @form_builder = form_builder
      @form_tag = form_tag
    end

    def input(field_name, **attributes)
      @fields << Tag.build('input', type: 'text', name: field_name, value: @entity.public_send(field_name),
                                    **attributes)
    end

    def textarea(field_name, **attributes)
      @fields << Tag.build('textarea', name: field_name, **attributes) { @entity.public_send(field_name) }
    end

    def submit(value = 'Save')
      @fields << Tag.build('input', type: 'submit', value:)
    end

    def method_missing(method_name, *, &)
      if HexletCode.respond_to?(method_name)
        HexletCode.send(method_name, *, &)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      HexletCode.respond_to?(method_name) || super
    end
  end
end
