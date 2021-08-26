import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db
import scuffedEscape

class Login(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('username', required=True)
        parser.add_argument('password', required=True)
        args = parser.parse_args()

        username=scuffedEscape.escape(args['username'])
        #Connnection established between frontend and backend
        #print("Login Request from " + username)
             
        #Check if user exists
        storeduser = db.read_user(username)
        if storeduser == None:
            return ({
                'success': False,
                'msg': "Account credentials do not match our records."
            }, 200)

        #grab database password
        storedhash = storeduser[1]

        #compare hashes
        if not ac.does_password_match(args['password'], storedhash):
            #Optional: Add brute force defense, such as interval login
            return ({
                'success': False,
                'msg': "Account credentials do not match our records."
            }, 200)
        #generate session token
        token=ac.generate_token(username)

        data = {
            'success': True,
            'msg': "Login Success!",
            'token': token,
            'token-exp': ac.getTokenExpiry(token),
            'username': username
        }

        refresh=ac.generate_refresh(username)

        headers={
            'Set-Cookie': 'refresh='+refresh+'; HttpOnly; Path=/CSE442-542/2021-Spring/cse-442j/app.wsgi/refresh-token'
        }

        return data, 200, headers


