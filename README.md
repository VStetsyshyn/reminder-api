## Tools

* Token based authentication with the `devise_jwt` gem.
* ActiveAdmin
* A namespaced API
* postgresql
* dotenv-rails
* Background jobs with Sidekiq and Redis

## Authentication

The REST API uses a token based authentication with the `devise_jwt` gem. Revocation strategy BlackList.
The only exception to this is the registration end-point and admin end-point, where used Cookies.

For `POST`, `PATCH`, `PUT`, and `DELETE` requests, parameters not included in the URL should be in the body of the request, encoded as JSON with a Content-Type of application/json:

## Registration

*Sign_up*
```
POST	/api/v1/signup
```
**example:**
```
{
    "user": {
        "email": "user@example.com",
        "password": "password",
        "fcm_token": "*firebase_token*"
    }
}
```
*Log_in*
```
POST /api/v1/login
```
**example:**
```{
    "user": {
        "email": "user@example.com",
        "password": "password"
    }
}
```
## Unregister
*Log_out*
```
DELETE	/api/v1/logout
```
# Admin panel with Active Admin
You need run in CLI to generate admin credentials
```
rake db:seed
```
then
```
admin/login
```
*show users and CRUD*
```
admin/users
```

## Create Note with remind time and Send Notification
*Implemented all CRUD functionality*
```
GET  /api/v1/notes
POST  /api/v1/notes
PUT	 /api/v1/notes/:id
DELETE  /api/v1/notes/:id
```
*Create Note*
```
POST	/api/v1/notes
```
All timestamps return in ISO 8601 format, but you need specified time-zone:
for example GMT +3
```
YYYY-MM-DDTHH:MM:SS+03:00
```

**example:**
```
{
    "content": "Hello_World",
    "alert_time": "2019-08-14T21:58:10+03:00"
}
```
**response**
```
200 Created
{
    "id": 15,
    "content": "Hello_World",
    "alert_time": "2019-08-14T21:58:10+03:00",
    "user_id": 4,
    "created_at": "2019-08-14T22:34:58.825Z",
    "updated_at": "2019-08-14T22:34:58.825Z"
}
```
## Client errors
Sending invalid JSON or paremeters will result in a 400 Bad Request response.

Sending invalid fields will result in a 422 Unprocessable Entity response.

422 Unprocessable Entity
