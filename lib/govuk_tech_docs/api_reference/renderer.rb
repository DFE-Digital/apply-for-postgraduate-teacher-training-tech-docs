module GovukTechDocs
  module ApiReference
    class Renderer
      def initialize(app, document)
        @app = app
        @document = document

        # Load template files
        @template_api_full = get_renderer('api_reference_full.html.erb')
        @template_schema = get_renderer('schema.html.erb')
        @template_operation = get_renderer('operation.html.erb')
        @template_parameters = get_renderer('parameters.html.erb')
        @template_responses = get_renderer('responses.html.erb')
      end

      def render_api_reference
        @template_api_full.result(binding)
      end

    private

      def render_schema_block(schema_name, schema)
        properties = []

        if schema["allOf"]
          schema["allOf"].each do |schema_nested|
            schema_nested.properties.each do |property|
              properties << property
            end
          end
        end

        schema.properties.each do |property|
          properties << property
        end

        @template_schema.result(binding)
      end

      def render_operations_block(path_name, path)
        %w[get put post delete patch].map do |http_verb|
          operation = path.node_data[http_verb]
          next unless operation

          parameters_html = @template_parameters.result(binding)
          responses_html = @template_responses.result(binding)

          @template_operation.result(binding)
        end.join
      end

      def render_schema_example_as_json_block(schema)
        properties = SchemaExample.new(schema).as_json
        render_object_as_json_block(properties)
      end

      def render_object_as_json_block(data)
        JSON.pretty_generate(data)
      end

      def get_renderer(file)
        template_path = File.join("lib/govuk_tech_docs/api_reference/templates", file)
        template = File.read(template_path)
        ERB.new(template)
      end

      def get_schema_name(text)
        return unless text.is_a?(String)

        # Schema dictates that it's always components['schemas']
        text.gsub(/#\/components\/schemas\//, '')
      end

      def get_schema_link(schema)
        schema_name = get_schema_name(schema.node_context.source_location.to_s)
        return unless schema_name

        id = "#{schema_name.parameterize}"
        "<a href='\##{id}'>#{schema_name}</a>"
      end
    end
  end
end
