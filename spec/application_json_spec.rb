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

  describe '.single_application_json' do
    subject(:parsed_json) do
      JSON.parse(including_class.single_application_json)
    end

    it 'returns the JSON for an application with all fields present' do
      expect(parsed_json).to be_a Hash
      expect(parsed_json.keys).to match_array(ALL_APPLICATION_FIELDS)
    end

    it 'has two interviews and an offer' do
      expect(parsed_json['interviews'].count).to eq 2
      expect(parsed_json['offer']).not_to be_nil
    end

    it 'does not have a withdrawal or rejection' do
      expect(parsed_json['withdrawal']).to be_nil
      expect(parsed_json['rejection']).to be_nil
    end
  end
end
