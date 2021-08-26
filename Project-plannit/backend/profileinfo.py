import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db
import scuffedEscape

class Profile(Resource):
    def get(self):
        parser = reqparse.RequestParser()
        parser.add_argument('username', required=True)
        args = parser.parse_args()

        username = scuffedEscape.escape(args['username'])

        #Check if username exists in database
        storeduser = db.read_user(username)

        profile = db.get_profile(username)

        if storeduser == None or profile == None:
            return({
                'success': False,
                'msg': "user profile private or doesn't exist."
            }, 200)

        data = {
            'success': True,
            'profile': profile
        }
        
        return data, 200
        
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('token', required=True)
        parser.add_argument("first")
        parser.add_argument("last")
        parser.add_argument("age")
        parser.add_argument("datetime")
        args = parser.parse_args()

        token=args['token']
        if not ac.validateToken(token):
            return {'success': False}, 200
        
        #check if fields exist
        first = scuffedEscape.escape(args['first'])
        last = scuffedEscape.escape(args['last'])
        age = scuffedEscape.escape(args['age'])
        birthday = args['datetime']

        if not first:
            first = ""
        
        if not last:
            last = ""
        
        if not age:
            age = 0
        
        if not birthday:
            birthday = db.get_current_epoch()
        
        username = ac.getTokenUsername(token)
        #Add  or update database
        if(db.get_profile(username)):
            db.update_profile(username, first, last, age, birthday)
        else:
            db.create_profile_username(username, first, last, age, birthday)

        data = {
            'success': True
        }

        headers={
            'Cache-Control': 'no-cache, max-age=0'
        }

        return data, 200, headers


