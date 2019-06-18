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

  ALL_CONTACT_DETAILS_FIELDS = %w[
    phone_number address
  ].freeze

  ALL_COURSE_FIELDS = %w[
    description provider_ucas_code course_ucas_code location_ucas_code
  ].freeze

  ALL_QUALIFICATION_FIELDS = %w[
    type subject grade award_date institution_name international
  ].freeze

  ALL_WORK_EXPERIENCE_FIELDS = %w[
    employer_name start_date end_date job_title job_description
  ].freeze

  ALL_INTERVIEW_FIELDS = %w[
    booked_at date instructions address
  ].freeze

  ALL_OFFER_FIELDS = %w[
    course date conditions
  ].freeze

  ALL_WITHDRAWAL_FIELDS = %w[
    reason date
  ].freeze
  
  ALL_REJECTION_FIELDS = %w[
    reason date
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
      fields = including_class.contact_details_attributes.map { |desc| desc[:name] }
      expect(fields).to match_array(ALL_CONTACT_DETAILS_FIELDS)
    end
  end

  describe '#course_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.course_json)
    end

    it 'returns the JSON for a course with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_COURSE_FIELDS)
    end
  end

  describe '#course_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.course_attributes.map { |desc| desc[:name] }
      expect(fields).to match_array(ALL_COURSE_FIELDS)
    end
  end

  describe '#qualification_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.qualification_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_QUALIFICATION_FIELDS)
    end
  end

  describe '#qualification_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.qualification_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(ALL_QUALIFICATION_FIELDS)
    end
  end

  describe '#work_experience_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.work_experience_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#work_experience_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.work_experience_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(ALL_WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#work_experience_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.work_experience_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#work_experience_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.work_experience_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(ALL_WORK_EXPERIENCE_FIELDS)
    end
  end

  describe '#interview_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.interview_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_INTERVIEW_FIELDS)
    end
  end

  describe '#interview_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.interview_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(ALL_INTERVIEW_FIELDS)
    end
  end

  describe '#offer_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.offer_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_OFFER_FIELDS)
    end
  end

  describe '#offer_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.offer_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(ALL_OFFER_FIELDS)
    end
  end

  describe '#withdrawal_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.withdrawal_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_WITHDRAWAL_FIELDS)
    end
  end

  describe '#withdrawal_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.withdrawal_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(ALL_WITHDRAWAL_FIELDS)
    end
  end

  describe '#rejection_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.rejection_json)
    end

    it 'returns the JSON for a qualification with all the fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_REJECTION_FIELDS)
    end
  end

  describe '#rejection_attributes' do
    it 'contains an entry for all the relevant fields' do
      fields = including_class.rejection_attributes.map do |desc|
        desc[:name]
      end
      expect(fields).to match_array(ALL_REJECTION_FIELDS)
    end
  end
end
