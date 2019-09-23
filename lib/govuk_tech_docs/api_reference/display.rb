require_relative './renderer'
require_relative './schema_example'

module GovukTechDocs
  module ApiReference
    class Display
      attr_reader :url_or_path

      def initialize(url_or_path)
        @url_or_path = url_or_path
      end

      def render
        if uri?(url_or_path)
          document = Openapi3Parser.load_url(url_or_path)
        elsif File.exist?(url_or_path)
          document = Openapi3Parser.load_file(url_or_path)
        else
          raise "Unable to load #{url_or_path}"
        end

        render = Renderer.new(document)
        render.render_api_reference
      end

    private

      def uri?(string)
        uri = URI.parse(string)
        %w(http https).include?(uri.scheme)
      rescue URI::BadURIError
        false
      rescue URI::InvalidURIError
        false
      end
    end
  end
end
