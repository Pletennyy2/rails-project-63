# frozen_string_literal: true

# lib/hexlet_code/form_builder.rb

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(_entity, **attributes)
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: { action: attributes[:url], method: 'post' }.merge(attributes.except(:url, :method))
      }
    end

    def input(field_name, **attributes)
      as = attributes.delete(:as) || :text
      label_text = field_name.to_s.capitalize # Генерация текста метки на основе названия поля
      @form_body[:inputs] << { type: as.to_s, name: field_name, label: label_text, **attributes }
    end

    def submit(value = 'Save')
      @form_body[:submit] = { value: value }
    end
  end
end
