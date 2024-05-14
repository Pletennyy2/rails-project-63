# frozen_string_literal: true

# lib/hexlet_code/form_render.rb

module HexletCode
  module FormRender
    def self.render_html(form_body)
      Tag.build(:form, form_body[:attributes]) do
        form_parts = form_body[:inputs].map { |input| render_input(input) }

        form_parts << Tag.build(:input, type: 'submit', **form_body[:submit][:attributes]) \
        unless form_body[:submit].nil?

        form_parts.any? ? "\n#{join_with_tabs(form_parts)}\n" : ''
      end
    end

    def self.render_input(input)
      input_class = "HexletCode::Inputs::#{input[:type].capitalize}Input"
      type_input = Object.const_get(input_class)
      next_input = type_input.new(input.except(:type))
      next_input.render({ input_label_separator: "\n    " })
    end

    def self.join_with_tabs(items)
      items.map { |i| "    #{i}" }.join("\n")
    end

    private_class_method :render_input, :join_with_tabs
  end
end
