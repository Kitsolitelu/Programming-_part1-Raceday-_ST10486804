# RaceDay API Endpoint Plan

| HTTP Method | Route | Description | Role Required | Request Body | Expected Response |
|---|---|---|---|---|---|
--Add auth and profile endpoints to plan
| POST | /api/auth/register | Creates a new user account as either an Organiser or a Participant. | None | { fullName, email, password, role } | 201 Created – new user id / 400 Bad Request – invalid or duplicate email |
| POST | /api/auth/login | Logs a user in and returns an auth token. | None | { email, password } | 200 OK – token / 401 Unauthorized – wrong credentials |
| GET | /api/users/me | Returns the logged-in user's own profile. | Any (logged in) | None | 200 OK – user details |
| PUT | /api/users/me | Updates the logged-in user's own profile. | Any (logged in) | { fullName, email } | 200 OK – updated user / 400 Bad Request |
Add event endpoints to plan
| GET | /api/events | Lists all upcoming events. | None | None | 200 OK – list of events |
| GET | /api/events/{id} | Returns the details of one event. | None | None | 200 OK – event / 404 Not Found |
| POST | /api/events | Creates a new event. | Organiser | { name, description, eventDate, location } | 201 Created – new event id |
| PUT | /api/events/{id} | Updates an event the Organiser owns. | Organiser | { name, description, eventDate, location } | 200 OK / 404 Not Found |
| DELETE | /api/events/{id} | Deletes an event the Organiser owns. | Organiser | None | 204 No Content / 404 Not Found |
| GET | /api/events/{id}/categories | Lists the categories for one event. | None | None | 200 OK – list of categories |
| POST | /api/events/{id}/categories | Adds a new category to an event. | Organiser | { name, price, maxParticipants } | 201 Created – new category id |
| POST | /api/categories/{id}/enrol | Enrols the logged-in participant into a category. | Participant | None | 201 Created / 409 Conflict – already enrolled |
| GET | /api/users/me/enrolments | Lists the logged-in participant's own enrolments. | Participant | None | 200 OK – list of enrolments |
| GET | /api/events/{id}/results | Lists the captured results for an event. | None | None | 200 OK – list of results |
| POST | /api/enrolments/{id}/results | Captures a result for one enrolment. | Organiser | { finishTime, position } | 201 Created – new result id
