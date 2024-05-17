# frozen_string_literal: true

# lib/hexlet_code/inputs/text_input.rb

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def input
        name = @input[:name]
        value = @input[:value]
        attributes = @input[:attributes]

        Tag.build(:textarea, name:, cols: 20, rows: 40, **attributes) { value }
      end
    end
  end
end
