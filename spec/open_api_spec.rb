RSpec.describe "OpenAPI spec" do
  document = Openapi3Parser.load_file("source/openapi-spec.yml")

  it "is a valid OpenAPI spec" do
    expect(document).to be_valid, document.errors.to_a.inspect
  end

  document.components.schemas.each do |schema_name, schema|
    it "requires all of the keys to be present for schema #{schema_name}" do
      required_properties = schema.required.to_a
      actual_properties = schema.properties.map { |property_name, _| property_name }

      expect(required_properties).to match_array(actual_properties)
    end
  end
end
