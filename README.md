POST REQUESTS

Create user:

https://scouter9000.herokuapp.com/users.json?user[email]=blah@example.com&user[password]=12345678&user[first_name]=danny&user[last_name]=poo

Sign In:

https://scouter9000.herokuapp.com/users/sign_in?user[email]=danny@example.com&user[password]=12345678

This will return an :AUTH_TOKEN

GET REQUESTS

Get All Users' Profiles

https://scouter9000.herokuapp.com/profile?user_email=[:EMAIL]&user_token=[:AUTH_TOKEN]

Ex:
https://scouter9000.herokuapp.com/profile?user_email=danny@example.com&user_token=aZS4UkXGntsqr3scL5i_

Get Specific User's Profile

https://scouter9000.herokuapp.com/profile/[:ID]?user_email=[:EMAIL]&user_token=[:AUTH_TOKEN]

Ex:
https://scouter9000.herokuapp.com/profile/1/?user_email=danny@example.com&user_token=aZS4UkXGntsqr3scL5i_


USING CURL:

Create user:

curl -H "Content-Type: application/json" -d '{"user":{"email":"danny@example.com","password":"12345678","first_name":"fanny","last_name":"Yu"}}' -X POST http://localhost:3000/users.json

Sign in:

curl -H 'Content-Type: application/json'   -H 'Accept: application/json' -X POST http://localhost:3000/users/sign_in   -d '{"user": {"email": "danny@example.com", "password": "12345678"}}'

It will return back an authenticity token, ie:s9xowPfjpzs7Yix6RdCe

curl -i -H "Accept: application/json" -H "Content-type: application/json"  -H "X-User-Email: danny@example.com" -H "X-User-Token: s9xowPfjpzs7Yix6RdCe" -X GET http://localhost:3000/profile

So this wouldn’t work:

curl -i -H "Accept: application/json" -H "Content-type: application/json"  -H "X-User-Email: danny@example.com" -H "X-User-Token: crapinvalidtoken" -X GET http://localhost:3000/profile