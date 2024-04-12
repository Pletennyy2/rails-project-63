require 'minitest/autorun'
require_relative '../lib/hexlet_code'


User = Struct.new(:name, :job, keyword_init: true)

class HexletCodeTest < Minitest::Test
  def test_form_for_without_url
    user = User.new(name: 'rob', job: 'developer')
    form_html = HexletCode.form_for(user) { |f| }
    expected_html = '<form action=\'\' method=\'post\'></form>'
    assert_equal expected_html, form_html
  end

  def test_form_for_with_url
    user = User.new(name: 'rob', job: 'developer')
    form_html = HexletCode.form_for(user, url: '/users') { |f| }
    expected_html = '<form action=\'/users\' method=\'post\'></form>'
    assert_equal expected_html, form_html
  end

  def test_form_for_with_specific_fields_generation
    user = User.new(name: 'rob', job: 'hexlet')

    expected_output = '<form action=\'\' method=\'post\'></form>'

    assert_equal expected_output, HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
    end
  end

  def test_form_for_with_additional_attributes
    user = User.new(name: 'rob', job: 'hexlet')

    expected_output = '<form action=\'#\' method=\'post\'></form>'

    assert_equal expected_output, HexletCode.form_for(user, url: '#') do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
  end

  def test_form_for_with_default_values
    user = User.new(name: 'rob', job: 'hexlet')

    expected_output = '<form action=\'\' method=\'post\'></form>'

    assert_equal expected_output, HexletCode.form_for(user) do |f|
      f.input :job, as: :text
    end
  end

  def test_form_for_with_overridden_default_values
    user = User.new(name: 'rob', job: 'hexlet')

    expected_output = '<form action=\'#\' method=\'post\'></form>'

    assert_equal expected_output, HexletCode.form_for(user, url: '#') do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
  end

  def test_form_for_with_non_existent_field_in_object
    user = User.new(name: 'rob', job: 'hexlet')

    assert_raises(NoMethodError) do
      HexletCode.form_for(user, url: '/users') do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
