# frozen_string_literal: true

# lib/hexlet_code/inputs.rb

module HexletCode
  module Inputs
    class BaseInput
      def initialize(input)
        @input = input.except(:label)
        @label = input[:label]
      end

      def render(attributes = {})
        separator = attributes.fetch(:input_label_separator, '')

        [label, input].join(separator)
      end

      def label
        Tag.build(:label, **@label.except(:value)) { @label[:value] }
      end
    end

    class StringInput < BaseInput
      def input
        name = @input[:name]
        value = @input[:value]
        attributes = @input[:attributes]

        Tag.build(:input, name: name, type: 'text', value: value, **attributes)
      end
    end

    class TextInput < BaseInput
      def input
        name = @input[:name]
        value = @input[:value]
        attributes = @input[:attributes]

        Tag.build(:textarea, name: name, cols: 20, rows: 40, **attributes) { value }
      end
    end
  end
end
