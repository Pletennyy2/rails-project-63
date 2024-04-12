require 'minitest/autorun'
require_relative '../lib/hexlet_code'


class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new(name: 'Alice', job: 'Developer', gender: 'female')
  end

  def test_input_generates_correct_html_for_text_input
    expected_output = "<div><label for='name'>Name</label><input type='text' name='name' value='Alice'></div>"
    assert_equal expected_output, HexletCode.input(@user, :name)
  end

  def test_input_generates_correct_html_for_textarea
    expected_output = "<div><label for='job'>Job</label><textarea name='job' cols='20' rows='40'>Developer</textarea></div>"
    assert_equal expected_output, HexletCode.input(@user, :job, as: :textarea)
  end

  def test_form_for_generates_correct_html_form_with_fields
    expected_output = "<form action='#' method='post'><div><label for='name'>Name</label><input type='text' name='name' value='Alice'></div><div><label for='job'>Job</label><textarea name='job' cols='20' rows='40'>Developer</textarea></div><input type='submit' value='Save'></form>"

    generated_output = HexletCode.form_for(@user, url: '#') do |f|
      f.label :name
      f.input :name
      f.label :job
      f.input :job, as: :textarea
      f.submit
    end

    assert_equal expected_output, generated_output
  end
end
