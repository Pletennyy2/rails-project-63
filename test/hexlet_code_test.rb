# # frozen_string_literal: true

# # hexlet_code/test/hexlet_code_test.rb
# require_relative 'test_helper'
# require 'ostruct'

# class HexletCodeTest < Minitest::Test
#   User = Struct.new(:name, :email)

#   def test_form_for_generates_correct_html
#     @user = User.new
#     expected_output = '<form action="/users" method="post"><input type="text" name="name" placeholder="Enter your name">
# <input type="email" name="email" placeholder="Enter your email">
# <input type="submit" value="Submit"></form>'
#     generated_output = HexletCode.form_for(@user, url: '/users') do |f|
#       f.input :name, placeholder: 'Enter your name'
#       f.input :email, type: 'email', placeholder: 'Enter your email'
#       f.submit 'Submit'
#     end

#     assert_equal expected_output, generated_output
#   end
# end
