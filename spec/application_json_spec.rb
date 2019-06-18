require 'json'
require 'application_json'

RSpec.describe ApplicationJson do
  let(:including_class) do
    Class.new do
      include ApplicationJson
    end.new
  end

  ALL_APPLICATION_FIELDS = %w[
    id candidate contact_details course qualifications
    work_experiences status status_ucas_code personal_statement
    withdrawal rejection offer interviews created_at updated_at
  ].freeze

  APPLICATION_SUBRESOURCES = %w[
    candidate contact_details course qualifications
    work_experiences withdrawal rejection offer interviews
  ]

  ALL_CANDIDATE_FIELDS = %w[
    id email first_name last_name date_of_birth nationality
    residency_status disability disability_hesa_code
  ].freeze

  describe '#single_application_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.single_application_json)
    end

    it 'returns the JSON for an application with all fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_APPLICATION_FIELDS)
    end

    it 'does not have a withdrawal or rejection' do
      expect(parsed_json['withdrawal']).to be_nil
      expect(parsed_json['rejection']).to be_nil
    end

    it 'does not include subresources' do
      expect(parsed_json.values_at(*APPLICATION_SUBRESOURCES))
        .to all(satisfy do |v|
          v.nil? ||
          v == ApplicationJson::DUMMY_OBJECT ||
          v == ApplicationJson::DUMMY_ARRAY_OF_OBJECTS
      end)
    end
  end

  describe '#application_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.application_attributes.map { |desc| desc[:name] }
      expect(fields).to match_array(ALL_APPLICATION_FIELDS)
    end
  end

  describe '#candidate_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.candidate_json)
    end

    it 'returns the JSON for a candidate with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_CANDIDATE_FIELDS)
    end
  end

  describe '#candidate_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.candidate_attributes.map { |desc| desc[:name] }
      expect(fields).to match_array(ALL_CANDIDATE_FIELDS)
    end
  end

  describe '#contact_details_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.contact_details_json)
    end

    it 'returns the JSON for a candidate with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_CONTACT_DETAILS_FIELDS)
    end
  end

  describe '#candidate_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.contact_details_json.map { |desc| desc[:name] }
      expect(fields).to match_array(ALL_CONTACT_DETAILS_FIELDS)
    end
  end
end
