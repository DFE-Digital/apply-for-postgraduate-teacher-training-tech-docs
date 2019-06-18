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
        name: 'status',
        type: 'string',
        description: 'The status of this application'
      },
      {
        name: 'status_ucas_code',
        type: 'string',
        description: 'The status of this application in legacy UCAS code format'
      },
      {
        name: 'personal_statement',
        type: 'string',
        description: 'The candidate’s personal statement'
      },
      {
        name: 'offer',
        type: link_to_resource_definition('Offer'),
        description: 'The offer on this application, if there is one'
      },
      {
        name: 'rejection',
        type: link_to_resource_definition('Rejection'),
        description: 'Rejection details, if applicable'
      },
      {
        name: 'withdrawal',
        type: link_to_resource_definition('Withdrawal'),
        description: 'Application withdrawal details, if applicable'
      },
      {
        name: 'candidate',
        type: link_to_resource_definition('Candidate'),
        description: 'Candidate details'
      },
      {
        name: 'contact_details',
        type: link_to_resource_definition('Contact details'),
        description: 'Contact details'
      },
      {
        name: 'course',
        type: link_to_resource_definition('Course'),
        description: 'Contact details'
      },
      {
        name: 'work_experiences',
        type: link_to_resource_definition('Work experience'),
        description: 'A list of work experiences'
      },
      {
        name: 'qualifications',
        type: link_to_resource_definition('Qualification'),
        description: 'A list of qualifications'
      },
      {
        name: 'interviews',
        type: link_to_resource_definition('Interview'),
        description: 'A list of interviews'
      },
      {
        name: 'created_at',
        type: 'string',
        description: 'ISO8601 date with time and timezone'
      },
      {
        name: 'updated_at',
        type: 'string',
        description: 'ISO8601 date with time and timezone'
      }
    ]
  end

  def candidate_json
    JSON.pretty_generate(json_data['candidate'])
  end

  def candidate_attributes
    [
      {
        name: 'id',
        type: 'uuid',
        description: 'The unique ID of this candidate'
      },
      {
        name: 'email',
        type: 'string',
        description: 'The candidate’s email address'
      },
      {
        name: 'first_name',
        type: 'string',
        description: ''
      },
      {
        name: 'last_name',
        type: 'string',
        description: ''
      },
      {
        name: 'date_of_birth',
        type: 'string',
        description: 'The candidate’s date of birth in YYYY-MM-DD format'
      },
      {
        name: 'nationality',
        type: 'string',
        description: 'The applicant’s nationality'
      },
      {
        name: 'residency_status',
        type: 'string',
        description: 'The applicant’s residency_status'
      },
      {
        name: 'disability',
        type: 'string',
        description: 'The candidate’s disabilities in a sentence'
      },
      {
        name: 'disability_hesa_code',
        type: 'string',
        description: 'The candidate’s disabilities expressed as a HESA code'
      }
    ]
  end

  def contact_details_json
    JSON.pretty_generate(json_data['contact_details'])
  end

  def contact_details_attributes
    [
      {
        name: 'address',
        type: 'string',
        description: 'The candidate’s address'
      },
      {
        name: 'phone_number',
        type: 'string',
        description: 'The candidate’s phone number'
      }
    ]
  end

  def course_json
    JSON.pretty_generate(json_data['course'])
  end

  def course_attributes
    [
      {
        name: 'description',
        type: 'string',
        description: 'The plain text description of the course'
      },
      {
        name: 'provider_ucas_code',
        type: 'string',
        description: 'The provider’s UCAS code'
      },
      {
        name: 'course_ucas_code',
        type: 'string',
        description: 'The course’s UCAS code'
      },
      {
        name: 'location_ucas_code',
        type: 'string',
        description: 'The location’s UCAS code'
      }
    ]
  end

  def qualification_json
    JSON.pretty_generate(json_data['qualifications'].first)
  end

  def qualification_attributes
    [
      {
        name: 'type',
        type: 'string',
        description: 'The qualification awarded'
      },
      {
        name: 'subject',
        type: 'string',
        description: 'The subject studied'
      },
      {
        name: 'grade',
        type: 'string',
        description: 'The grade awarded'
      },
      {
        name: 'award_date',
        type: 'string',
        description: 'The date awarded, in YYYY-MM-DD format'
      },
      {
        name: 'institution_name',
        type: 'string',
        description: 'The awarding institution'
      },
      {
        name: 'international',
        type: 'boolean',
        description: 'Was this qualification awarded by a non-UK body'
      }
    ]
  end

  def work_experience_json
    JSON.pretty_generate(json_data['work_experiences'].first)
  end

  def work_experience_attributes
    [
      {
        name: 'employer_name',
        type: 'string',
        description: ''
      },
      {
        name: 'start_date',
        type: 'string',
        description: 'The date employment began in YYYY-MM-DD format'
      },
      {
        name: 'end_date',
        type: 'string',
        description: 'The date employment finished in YYYY-MM-DD format, if appropriate'
      },
      {
        name: 'job_title',
        type: 'string',
        description: ''
      },
      {
        name: 'job_description',
        type: 'string',
        description: ''
      }
    ]
  end

  def link_to_resource_definition(resource_name)
    slug = resource_name.downcase.gsub(' ', '_')
    "<a href='/resources-and-their-attributes##{slug}'>
      #{resource_name}
    </a>"
  end

  def json_data
    @json_data ||= JSON.parse(File.read('lib/application.json'))
  end
end
