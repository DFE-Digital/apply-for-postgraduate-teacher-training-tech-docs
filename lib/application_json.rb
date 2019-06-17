module ApplicationJson
  DUMMY_OBJECT = '{ ... }'.freeze
  DUMMY_ARRAY_OF_OBJECTS = '[ { ... } ]'.freeze

  def single_application_json
    JSON.pretty_generate(
      json_data.merge(
        'withdrawal' => nil,
        'rejection' => nil,
        'offer' => nil,
        'candidate' => DUMMY_OBJECT,
        'contact_details' => DUMMY_OBJECT,
        'course' => DUMMY_ARRAY_OF_OBJECTS,
        'work_experiences' => DUMMY_ARRAY_OF_OBJECTS,
        'qualifications' => DUMMY_ARRAY_OF_OBJECTS,
        'interviews' => DUMMY_ARRAY_OF_OBJECTS
      )
    )
  end

  def application_attributes
    [
      {
        name: 'id',
        type: 'uuid',
        description: 'The unique ID of this application'
      },
      {
        name: 'created_at',
        type: 'string',
        description: 'ISO8601 date with time'
      },
      {
        name: 'candidate',
        type: link_to_resource_definition('Candidate'),
        description: 'Candidate details'
      }
    ]
  end

  def candidate_attributes
    [
      {
        name: 'id',
        type: 'uuid',
        description: 'The unique ID of this candidate'
      }
    ]
  end

  def link_to_resource_definition(resource_name)
    slug = resource_name.downcase.gsub(' ', '_')
    "<a href='/resources_and_their_attributes.html##{slug}'>
      #{resource_name}
    </a>"
  end

  def json_data
    @json_data ||= JSON.parse(File.read('lib/application.json'))
  end
end
