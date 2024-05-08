# frozen_string_literal: true

# lib/hexlet_code/form_render.rb

module HexletCode
  class FormRender
    def self.render_html(form_body)
      form_attributes = form_body[:attributes]
      inputs = form_body[:inputs].map { |input| render_input(input) }.join("\n")
      submit = Tag.build('input', **form_body[:submit])

      Tag.build('form', **form_attributes) { "#{inputs}\n#{submit}" }
    end

    def self.render_input(input)
      label = Tag.build('label', for: input[:name]) { input[:label][:value] }
      input_tag = if input[:type] == 'textarea'
                    Tag.build('textarea', **input.except(:label)) { '' }
                  else
                    Tag.build('input', **input.except(:label))
                  end

      "#{label}\n#{input_tag}"
    end
  end
end
