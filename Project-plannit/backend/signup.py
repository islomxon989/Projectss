import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db
import scuffedEscape

class SignUp(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('username', required=True)
        parser.add_argument('email', required=True)
        parser.add_argument('password', required=True)
        args = parser.parse_args()
        username=scuffedEscape.escape(args['username'])

        #Connnection established between frontend and backend
        print("Signup Request from " + username)

        #Check if username exists in database
        storeduser = db.read_user(username)

        if storeduser != None:
            return({
                'success': False,
                'msg': "Username already taken, try a different username"
            }, 200)

        #Get user profile
        

        #signup confirmation
        data = {
            'success': True,
            'msg': "Account Created!"
        }

        return data, 200




