# frozen_string_literal: true

# lib/hexlet_code/tag.rb

module HexletCode
  module Tag
    SINGLE_TAGS = %w[input img br].freeze
    class << self
      def build(tag, **attributes, &block)
        build_attributes = build_attributes(attributes)
        return "<#{tag}#{build_attributes}>\n" if single_tag?(tag)

        content = block_given? ? yield : attributes.fetch(:content, '')
        "<#{tag}#{build_attributes}>#{content}</#{tag}>\n"
      end

      def build_attributes(attributes)
        return '' if attributes.empty?

        ' ' + attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      end

      def single_tag?(tag)
        SINGLE_TAGS.include?(tag)
      end
    end
  end
end
