# frozen_string_literal: true

# lib/hexlet_code/inputs/base_input.rb

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
  end
end
