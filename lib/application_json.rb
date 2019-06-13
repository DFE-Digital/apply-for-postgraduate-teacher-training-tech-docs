module ApplicationJson
  def single_application_json
    File.read('lib/application.json')
  end
end
