## Introduction

* Token based authentication with the `devise_jwt` gem.
* ActiveAdmin
* A namespaced API
* postgresql
* redis
* sidekiq


* Background jobs with Sidekiq and Redis

## Use

* Authorization flow
```
GET	/api/v1/login
POST	/api/v1/login
DELETE	/api/v1/logout
```

User Sign_up
```
POST	/api/v1/signup
```
JSON:
```
{
    "user": {
        "email": "user@example.com",
        "password": "password",
        "fcm_token": "*firebase_token*"
    }
}
```
User Log_in
```
POST /api/v1/login
```
JSON:
```{
    "user": {
        "email": "user@example.com",
        "password": "password"
    }
}
```
User Log_out
```
DELETE	/api/v1/logout
```


* Notes and Notification flow
```
POST	/api/v1/notes
PUT	/api/v1/notes/:id
DELETE	/api/v1/notes/:id
```
Create note by user
```
POST	/api/v1/notes
```
JSON:
```
{
    "content": "Hello_World",
    "alert_time": "2019-08-14T21:58:10+03:00"
}
```

* ActiveAdmin flow
```
admin/login
```