# frozen_string_literal: true

# lib/hexlet_code/tag.rb

module HexletCode
  module Tag
    class << self
      def build(tag, **attributes, &block)
        if block_given?
          content = block.call
          "<#{tag}#{build_attributes(attributes)}>#{content}</#{tag}>"
        elsif single_tag?(tag)
          "<#{tag}#{build_attributes(attributes)}>"
        else
          "<#{tag}#{build_attributes(attributes)}></#{tag}>"
        end
      end

      def build_attributes(attributes)
        return '' if attributes.empty?

        ' ' + attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      end

      def single_tag?(tag)
        %w[br img input].include?(tag)
      end
    end
  end
end
