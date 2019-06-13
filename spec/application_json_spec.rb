require 'json'
require 'application_json'

RSpec.describe ApplicationJson do
  subject do
    Class.new do
      include ApplicationJson
    end.new
  end

  ALL_APPLICATION_FIELDS = %w[
    id candidate contact_details course qualifications
    work_experiences status status_ucas_code personal_statement
    withdrawal rejection offer interviews created_at updated_at
  ].freeze

  describe '.single_application_json' do
    it 'returns the JSON for an application with all fields present' do
      parsed_json = JSON.parse(subject.single_application_json)

      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_APPLICATION_FIELDS)
    end
  end
end
