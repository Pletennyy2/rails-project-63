# frozen_string_literal: true

# lib/hexlet_code/inputs/sreing_input.rb

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def input
        name = @input[:name]
        value = @input[:value]
        attributes = @input[:attributes]

        Tag.build(:input, name: name, type: 'text', value: value, **attributes)
      end
    end
  end
end
