require 'json'
require 'application_json'

RSpec.describe ApplicationJson do
  let(:including_class) do
    Class.new do
      include ApplicationJson
    end.new
  end

  APPLICATION_FIELDS = %w[
    id candidate contact_details course qualifications
    work_experiences status status_ucas_code personal_statement
    withdrawal rejection offer interviews placement created_at updated_at
  ].freeze

  APPLICATION_SUBRESOURCES = %w[
    candidate contact_details course qualifications
    work_experiences withdrawal rejection offer interviews
  ].freeze

  CANDIDATE_FIELDS = %w[
    id email first_name last_name date_of_birth nationality
    uk_residency_status disability disability_hesa_code
  ].freeze

  CONTACT_DETAILS_FIELDS = %w[
    phone_number address
  ].freeze

  COURSE_FIELDS = %w[
    description provider_ucas_code course_ucas_code location_ucas_code
    start_date
  ].freeze

  QUALIFICATION_FIELDS = %w[
    type subject grade award_date institution_name international
  ].freeze

  WORK_EXPERIENCE_FIELDS = %w[
    employer_name start_date end_date job_title job_description
  ].freeze

  INTERVIEW_FIELDS = %w[
    booked_at date instructions address
  ].freeze

  OFFER_FIELDS = %w[
    course date conditions
  ].freeze

  WITHDRAWAL_FIELDS = %w[
    reason date
  ].freeze

  REJECTION_FIELDS = %w[
    reason date
  ].freeze

  PLACEMENT_FIELDS = %w[
    date
  ].freeze

  describe '#single_application_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.single_application_json)
    end

    it 'returns the JSON for an application with all fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(APPLICATION_FIELDS)
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
      expect(fields).to match_array(APPLICATION_FIELDS)
    end
  end

  describe '#candidate_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.candidate_json)
    end

    it 'returns the JSON for a candidate with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(CANDIDATE_FIELDS)
    end
  end

  describe '#candidate_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.candidate_attributes.map { |desc| desc[:name] }
      expect(fields).to match_array(CANDIDATE_FIELDS)
    end
  end

  describe '#contact_details_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.contact_details_json)
    end

    it 'returns the JSON for a candidate with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(CONTACT_DETAILS_FIELDS)
    end
  end

  describe '#candidate_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.contact_details_attributes.map { |desc| desc[:name] }
      expect(fields).to match_array(CONTACT_DETAILS_FIELDS)
    end
  end

  describe '#course_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.course_json)
    end

    it 'returns the JSON for a course with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(COURSE_FIELDS)
    end
  end

  describe '#course_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.course_attributes.map { |desc| desc[:name] }
      expect(fields).to match_array(COURSE_FIELDS)
    end
  end

  describe '#qualification_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.qualification_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(QUALIFICATION_FIELDS)
    end
  end

  describe '#qualification_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.qualification_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(QUALIFICATION_FIELDS)
    end
  end

  describe '#work_experience_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.work_experience_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#work_experience_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.work_experience_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#work_experience_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.work_experience_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#work_experience_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.work_experience_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#interview_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.interview_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(INTERVIEW_FIELDS)
    end
  end

  describe '#interview_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.interview_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(INTERVIEW_FIELDS)
    end
  end

  describe '#offer_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.offer_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(OFFER_FIELDS)
    end
  end

  describe '#offer_creation_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.offer_creation_json)
    end

    it 'returns the JSON with the course description removed' do
      expect(parsed_json['course']).not_to include('description')
    end
  end

  describe '#offer_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.offer_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(OFFER_FIELDS)
    end
  end

  describe '#withdrawal_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.withdrawal_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(WITHDRAWAL_FIELDS)
    end
  end

  describe '#withdrawal_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.withdrawal_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(WITHDRAWAL_FIELDS)
    end
  end

  describe '#rejection_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.rejection_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(REJECTION_FIELDS)
    end
  end

  describe '#rejection_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.rejection_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(REJECTION_FIELDS)
    end
  end

  describe '#placement_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.placement_json)
    end

    it 'returns placement JSON with all fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(PLACEMENT_FIELDS)
    end
  end

  describe '#placement_attributes' do
    it 'contains an entry for all the relevant fields' do
     fields = including_class.placement_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(PLACEMENT_FIELDS)
    end
  end

  describe '#link_to_resource_definition' do
    it 'links to the correct page' do
      result = including_class.link_to_resource_definition('Arbitrary field name')
      link = '/resources-and-their-attributes#arbitrary-field-name'
      expected = "<a href='#{link}'>Arbitrary field name</a>"
      expect(result).to eq(expected)
    end
  end
end
