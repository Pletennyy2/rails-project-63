module HexletCode
  module Tag
    class << self
      def build(tag, **attributes, &block)
        if block_given?
          content = block.call
          "<#{tag}#{build_attributes(attributes)}>#{content}</#{tag}>"
        else
          "<#{tag}#{build_attributes(attributes)}>"
        end
      end

      def build_attributes(attributes)
        attributes.map { |key, value| " #{key}='#{value}'" }.join
      end
    end
  end
end
