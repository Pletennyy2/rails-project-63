# lib/hexlet_code.rb

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:FormRender, 'hexlet_code/form_render')
  autoload(:Tag, 'hexlet_code/tag')

  def self.form_for(entity, attributes = {})
    builded_form = FormBuilder.new(entity, **attributes)
    yield(builded_form) if block_given?
    FormRender.render_html(builded_form.form_body)
  end
end
