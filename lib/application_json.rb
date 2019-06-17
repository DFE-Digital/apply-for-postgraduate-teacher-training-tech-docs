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

  def json_data
    @json_data ||= JSON.parse(File.read('lib/application.json'))
  end
end
