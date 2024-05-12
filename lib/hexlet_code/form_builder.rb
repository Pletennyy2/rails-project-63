# frozen_string_literal: true

# lib/hexlet_code/form_builder.rb
module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(_entity, **attributes)
      action = attributes.fetch(:url, '#')
      method = attributes.fetch(:method, 'post')
      @form_body = {
        inputs: [],
        submit: nil,
        attributes: { action:, method: }.merge(attributes.except(:url, :method))
      }
    end

    def input(name, attributes = {})
      input_type = attributes.delete(:as) || :text
      input_class = HexletCode::Inputs.const_get(input_type.to_s.capitalize)
      @form_body[:inputs] << input_class.build(name, attributes)
    end

    def submit(value = 'Save')
      @form_body[:submit] = { type: 'submit',  value: value }
    end

    def call(user)
      method_name = @form_body[:submit][:type]
      send(method_name, user)
    end
  end
end

 # def input(field_name, **attributes)
    #   as = attributes.delete(:as) || :text
    #   label_text = field_name.to_s.capitalize
    #   @form_body[:inputs] << { type: as.to_s, name: field_name, label: { value: label_text }, **attributes, class: attributes[:class] }
    # end
