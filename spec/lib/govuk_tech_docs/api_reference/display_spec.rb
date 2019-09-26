require "lib/govuk_tech_docs/api_reference/display"

RSpec.describe GovukTechDocs::ApiReference::Display do
  describe '#render' do
    it 'generates the correct HTML' do
      generated_html = GovukTechDocs::ApiReference::Display.new('spec/lib/govuk_tech_docs/api_reference/test_docs/pets.yml').render

      # Uncomment to regenerate the test data file
      # File.write('spec/lib/govuk_tech_docs/api_reference/test_docs/pets-output.html', generated_html)

      expected_html = File.read('spec/lib/govuk_tech_docs/api_reference/test_docs/pets-output.html')

      expect(generated_html).to eql(expected_html)
    end
  end
end
