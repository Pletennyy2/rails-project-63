# lib/hexlet_code/inputs.rb

module HexletCode
  module Inputs
    class String
      def self.build(name, attributes)
        label_text = name.to_s.capitalize
        { type: "string", name: name, label: { value: label_text }, **attributes }
      end
    end

    class Text
      def self.build(name, attributes)
        label_text = name.to_s.capitalize
        { type: "text", name: name, label: { value: label_text }, **attributes }
      end
    end

    class Textarea
      def self.build(name, attributes)
        label_text = name.to_s.capitalize
        { type: "textarea", name: name, label: { value: label_text }, **attributes }
      end
    end
  end
end
