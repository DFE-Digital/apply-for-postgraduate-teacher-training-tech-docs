RSpec.describe "OpenAPI spec" do
  document = Openapi3Parser.load_file("source/openapi-spec.yml")

  it "is a valid OpenAPI spec" do
    expect(document).to be_valid, document.errors.to_a.inspect
  end
end
