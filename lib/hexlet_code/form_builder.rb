# lib/hexlet_code/form_builder.rb

require 'active_support/all'

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(entity, attributes = {})
      @entity = entity

      action = attributes.fetch(:url, '#')
      method = attributes.fetch(:method, 'post')

      @form_body = {
        inputs: [],
        submit: nil,
        attributes: { action:, method: }.merge(attributes.except(:url, :method))
      }
    end

    def input(name, attributes = {})
      @form_body[:inputs] << build_input(name, attributes)
    end

    def submit(value = 'Save', attributes = {})
      attributes = { value: }.merge(attributes)
      @form_body[:submit] = { attributes: }
    end

    def build_input(name, attributes)
      type = attributes.fetch(:as, :string)
      attributes = attributes.except(:as).sort.to_h

      value = @entity.public_send(name)

      label_value = attributes.fetch(:label, name.to_s.capitalize)

      {
        name:,
        value:,
        type:,
        attributes:,
        label: { for: name, value: label_value }
      }
    end
  end
end
