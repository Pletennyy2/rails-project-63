# frozen_string_literal: true

# lib/hexlet_code/form_builder.rb

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(_entity, **attributes)
      @form_body = {
        inputs: [],
        submit: nil,
        attributes: {
          action: attributes[:action] || attributes[:url],
          method: attributes[:method]
        }.merge(attributes.except(:url, :method)),
        form_options: {} # Добавляем пустой хэш с ключом :form_options
      }
    end

    def input(field_name, **attributes)
      as = attributes.delete(:as) || :text
      label_text = field_name.to_s.capitalize
      @form_body[:inputs] << { type: as.to_s, name: field_name, label: { value: label_text }, **attributes, class: attributes[:class] }
    end

    def submit(value = 'Save')
      @form_body[:submit] = { value: value, type: 'submit' }
    end

    def method_missing(method_name, *args, &)
      raise NoMethodError, "undefined method `#{method_name}` for #{entity.inspect}" if method_name.to_s.start_with?('input')

      super
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?('input') || super
    end
  end
end
