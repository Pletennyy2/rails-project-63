# frozen_string_literal: true

# lib/hexlet_code/form_render.rb

module HexletCode
  class FormRender
    def self.render_html(form_body)
      form_attributes = form_body[:attributes] # обновляем это
      inputs = form_body[:inputs].map { |input| Tag.build('input', **input) }.join("\n")
      submit = Tag.build('input', **form_body[:submit])

      Tag.build('form', **form_attributes) { "#{inputs}\n#{submit}" } # обновляем это
    end
  end
end
