---
title: Release notes
weight: 200
---

# Release notes

### Unreleased

Changes to the data:

- Remove date from reject endpoint
- Rename the `org` attribute to `organisation_name` for the Work Experience resource
- Limit candidates to only 2 nationalities

Changes to functionality:

- Support an `order` parameter when [retrieving many applications](/retrieve-many-applications)

Additional changes:

- Clarify the endpoint for rejecting an application in usage scenarios
- Clarify the timestamp format for retrieving applications in usage scenarios
- Add description of the API versioning

### Release 0.3 - 16 September 2019

Changes to the data:

- Remove first and last name from Candidate in favour of full name
- Remove id from Candidate
- Remove disability information from Candidate, as this is not collected via the application form
- Remove functionality to amend an offer
- Rename the [rejection endpoint](/reject-an-application)
- Update Contact Details resource to split address into separate fields
- Remove description from course resource
- Add first name, last name and date of birth for Candidate

### Release 0.2 - 11 September 2019

Changes to functionality:

- Add documentation on the proposed way of authenticating users
- Limit the number of [offer conditions](/make-an-offer/#attributes) to 20
- Remove functionality to amend an offer (you can reuse the [make an offer](/make-an-offer/) endpoint)
- Remove functionality to confirm a placement for a candidate
- Remove functionality to schedule interviews for a candidate

Changes to the data:

- Remove first and last name from Candidate in favour of full name
- Remove id from Candidate
- Remove disability information from [Candidate](/resources-and-their-attributes/#candidate), as this is not collected via the application form
- Rename the [rejection endpoint](/reject-an-application)
- Update Contact Details resource to split address into separate fields
- Applications now have a [10 character identifier](/resources-and-their-attributes/#application)
- The [`course` attribute](/retrieve-a-single-application) of an application now refers to a single course instead of multiple
- References have a "content" attribute containing the referee's contribution
- Qualifications have an "equivalency_details" attribute for overseas awards
- Withdrawals and Rejections now have timestamps instead of dates
- Withdrawal reason has become optional

Additional changes:

- Clarify that strings have a [255 character limit](/resources-and-their-attributes/#strings), unless otherwise specified
- Clarify that only candidates can [withdraw an application](/resources-and-their-attributes/#withdrawal)
- Clarify that we're using [ISO 3166 for country codes](/#codes-and-reference-data), not ISO 3611
- Clarify how to [make an unconditional and conditional offer](/make-an-offer)
- Clarify that [offer conditions](/make-an-offer/#attributes) are optional

### Release 0.1 - 4 July 2019

Initial release of the API documentation.
