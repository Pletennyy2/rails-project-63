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

  def self.method_missing(method_name, *args, &)
    raise NoMethodError, "undefined method `#{method_name}` for #{args.first}" if block_given? && method_name.to_s.start_with?('input')

    super
  end

  def self.respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('form_for') || super
  end
end
