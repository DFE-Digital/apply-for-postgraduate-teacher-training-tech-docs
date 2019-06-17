module ApplicationJson
  def single_application_json
    JSON.pretty_generate(
      json_data.merge(
        'withdrawal' => nil,
        'rejection' => nil
      )
    )
  end

  def json_data
    @json_data ||= JSON.parse(File.read('lib/application.json'))
  end
end
