# lib/hexlet_code/tag.rb

module HexletCode
  module Tag
    SINGLE_TAGS = %w[input img br].freeze
    class << self
      def build(tag, **attributes, &block)
        build_attributes = build_attributes(attributes)
        if single_tag?(tag)
          return "<#{tag} #{build_attributes}>"
        else
          content =
            if tag == 'form' # если это form, то в него нужно добавить переданные атрибуты
              build_attributes = build_attributes(attributes)
              "<form #{build_attributes}>\n#{block_given? ? yield : attributes[:content] || ''}\n</form>"
            elsif tag == 'textarea' # если это textarea, то нужно добавить атрибут type="textarea"
              build_attributes = build_attributes(attributes.merge(type: 'textarea'))
              "<#{tag} #{build_attributes}>#{block_given? ? yield : attributes[:content] || ''}</#{tag}>"
            else # в остальных случаях
              content = block_given? ? yield : attributes[:content] || ''
              indented_content = content.gsub("\n", "\n    ")  # добавляем отступ в 4 пробела между тегами
              return "<#{tag} #{build_attributes}> #{indented_content}</#{tag}>"
            end
        end
      end

      def build_attributes(attributes)
        return '' if attributes.empty?

        attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      end

      def single_tag?(tag)
        SINGLE_TAGS.include?(tag)
      end
    end
  end
end
