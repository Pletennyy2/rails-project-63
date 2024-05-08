# frozen_string_literal: true

# lib/hexlet_code/form_render.rb

module HexletCode
  class FormRender
    def self.render_html(form_body)
      form_options = form_body[:form_options]
      inputs = form_body[:inputs].map { |input| Tag.build('input', **input) }.join("\n")
      submit = Tag.build('input', **form_body[:submit])

      Tag.build('form', **form_options) { "#{inputs}\n#{submit}" }
    end
  end
end
