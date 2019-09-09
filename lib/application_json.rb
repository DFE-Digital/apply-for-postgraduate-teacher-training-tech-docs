module ApplicationJson
  DUMMY_OBJECT = '{ ... }'.freeze
  DUMMY_ARRAY_OF_OBJECTS = '[ { ... } ]'.freeze

  def single_application_json
    JSON.pretty_generate(
      json_data.merge(
        'withdrawal' => nil,
        'rejection' => nil,
        'offer' => nil,
        'placement' => nil,
        'candidate' => DUMMY_OBJECT,
        'contact_details' => DUMMY_OBJECT,
        'course' => DUMMY_ARRAY_OF_OBJECTS,
        'work_experiences' => DUMMY_ARRAY_OF_OBJECTS,
        'references' => DUMMY_ARRAY_OF_OBJECTS,
        'qualifications' => DUMMY_ARRAY_OF_OBJECTS
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
        name: 'personal_statement',
        type: 'string',
        description: 'The candidate’s personal statement - this can be up to 500 characters'
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
        name: 'placement',
        type: link_to_resource_definition('Placement'),
        description: 'Placement details, if applicable'
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
        description: 'Course details'
      },
      {
        name: 'work_experiences',
        type: link_to_resource_definition('Work experience'),
        description: 'A list of work experiences'
      },
      {
        name: 'references',
        type: link_to_resource_definition('Reference'),
        description: 'Reference details'
      },
      {
        name: 'qualifications',
        type: link_to_resource_definition('Qualification'),
        description: 'A list of qualifications'
      },
      {
        name: 'submitted_at',
        type: 'string',
        description: 'ISO 8601 date of submission, with time and timezone'
      },
      {
        name: 'updated_at',
        type: 'string',
        description: 'ISO 8601 date of last change, with time and timezone'
      }
    ]
  end

  def applications_params
    [
      {
        name: 'since',
        type: 'string',
        description: 'Optional. Include only applications changed or created on
        or since a date and time. Times should be in ISO 8601 format.'
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
        name: 'first_name',
        type: 'string',
        description: 'The candidate’s first name - this can be up to 60 characters'
      },
      {
        name: 'last_name',
        type: 'string',
        description: 'The candidate’s last name - this can be up to 60 characters'
      },
      {
        name: 'date_of_birth',
        type: 'string',
        description: 'The candidate’s date of birth in YYYY-MM-DD format'
      },
      {
        name: 'nationality',
        type: 'string',
        description: 'The candidate’s nationality as an ISO 3166 country code'
      },
      {
        name: 'uk_residency_status',
        type: 'string',
        description: 'The candidate’s UK residency status, e.g. Citizen'
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
        name: 'email',
        type: 'string',
        description: 'The candidate’s email address'
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
        description: 'A plain text description of the course, composed of
          English translations of the provider UCAS code, the course UCAS code,
          the location UCAS code, and the start date'
      },
      {
        name: 'start_date',
        type: 'string',
        description: 'The course’s start date in YYYY-MM-DD format'
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
        name: 'result',
        type: 'string',
        description: 'The grade awarded'
      },
      {
        name: 'award_year',
        type: 'string',
        description: 'The year the award was made'
      },
      {
        name: 'place_of_study',
        type: 'string',
        description: 'The place of study'
      },
      {
        name: 'awarding_body_name',
        type: 'string',
        description: 'Optional. The awarding body’s name, e.g. AQA'
      },
      {
        name: 'awarding_body_country',
        type: 'string',
        description: 'The awarding body’s country as an ISO 3166 country code'
      }
    ]
  end

  def work_experience_json
    JSON.pretty_generate(json_data['work_experiences'].first)
  end

  def work_experience_attributes
    [
      {
        name: 'org',
        type: 'string',
        description: 'The name of the employer (company or individual)'
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
        name: 'role',
        type: 'string',
        description: 'The position held by the candidate'
      },
      {
        name: 'description',
        type: 'string',
        description: 'A brief written description of the work involved'
      }
    ]
  end

  def reference_json
    JSON.pretty_generate(json_data['references'].first)
  end

  def reference_attributes
    [
      {
        name: 'type',
        type: 'string',
        description: 'The type of the reference, which will always be one of "academic", "professional", "school_senior_leadership" or "character"'
      },
      {
        name: 'reason_for_character_reference',
        type: 'string',
        description: 'If this is a character reference, this field will contain the reason the candidate gave for not providing one of the other types'
      },
      {
        name: 'email',
        type: 'string',
        description: 'The referee’s email'
      },
      {
        name: 'name',
        type: 'string',
        description: 'The referee’s name'
      },
      {
        name: 'relationship',
        type: 'string',
        description: 'The referee’s relationship to the candidate'
      }
    ]
  end

  def offer_json
    JSON.pretty_generate(json_data['offer'])
  end

  def offer_creation_json
    course_details = json_data['offer']['course'].dup # we are going to mutate this :/
    course_details.delete('description')
    JSON.pretty_generate(
      json_data['offer'].merge('course' => course_details)
    )
  end

  def offer_attributes
    [
      {
        name: 'course',
        type: link_to_resource_definition('Course'),
        description: 'Course details'
      },
      {
        name: 'date',
        type: 'string',
        description: 'The offered entry date in YYYY-MM-DD format'
      },
      {
        name: 'conditions',
        type: 'array of strings',
        description: 'The conditions of the offer'
      }
    ]
  end

  def withdrawal_json
    JSON.pretty_generate(json_data['withdrawal'])
  end

  def withdrawal_attributes
    [
      {
        name: 'reason',
        type: 'string',
        description: 'The candidate’s reason for withdrawing'
      },
      {
        name: 'date',
        type: 'string',
        description: 'The date on which the withdrawal was received in YYYY-MM-DD format'
      }
    ]
  end

  def rejection_json
    JSON.pretty_generate(json_data['rejection'])
  end

  def rejection_attributes
    [
      {
        name: 'reason',
        type: 'string',
        description: 'The reason for rejection'
      },
      {
        name: 'date',
        type: 'string',
        description: 'The date on which the rejection was issued in YYYY-MM-DD format'
      }
    ]
  end

  def placement_json
    JSON.pretty_generate(json_data['placement'])
  end

  def placement_attributes
    [
      {
        name: 'date',
        type: 'string',
        description: 'The date on which the placement was made in YYYY-MM-DD format'
      }
    ]
  end

  def link_to_resource_definition(resource_name)
    slug = resource_name.downcase.gsub(' ', '-')
    link = "/resources-and-their-attributes##{slug}"
    "<a href='#{link}'>#{resource_name}</a>"
  end

  def json_data
    @json_data ||= JSON.parse(File.read('lib/application.json'))
  end
end
