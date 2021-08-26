import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db

class AccountSettings(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('token', required=True)
        parser.add_argument('type', required=True)
        parser.add_argument('currentpw')
        parser.add_argument('newpw')
        parser.add_argument('confirmpw')
        parser.add_argument('currentun')
        parser.add_argument('newun')
        parser.add_argument('currentemail')
        parser.add_argument('newemail')
        args = parser.parse_args()

        #Validate token
        if not ac.validateToken(args['token']):
            return {'success': False, 'msg': 'token expired'}, 200
        
        rtype = args['type']
        username = ac.getTokenUsername(args['token'])
        userinfo =  db.read_user(username)
        dbpw = userinfo[1]
        dbemail = userinfo[2]
        if rtype == 'password':
            if not ac.does_password_match(str(args['currentpw']), dbpw):
                return {'success': False, 'msg': 'current password incorrect'}, 200

            if not args['newpw'] == args['confirmpw']:
                return {'success': False, 'msg': 'passwords do not match'}, 200
            
            hashedpass = ac.hash_new_password(args['newpw'])

            #Change password in database
            db.update_general(
                username, 
                hashedpass,
                dbemail
            )

            data = {
                'success': True,
                'msg': "Password Changed!"
            }

            return data, 200
        if rtype == 'username':
            if(username != args['currentun']):
                return {'success': False, 'msg': 'current username is incorrect'}, 200
            if(username == args['newun']):
                return {'success': False, 'msg': 'username should not be the same as the new username'}, 200
            if(db.read_user(args['newun'])):
                return {'success': False, 'msg': 'username already taken'}, 200

            db.update_username(
                username, 
                args['newun'], 
                dbpw, 
                dbemail
            )

            profile = db.get_profile(username)
            if(profile):
                #update profile with new username
                update_profile(args['newun'], username)

            data = {
                'success': True,
                'msg': "Username Changed!"
            }

            return data, 200
        if rtype == 'email':
            if(args['currentemail'] != dbemail):
                data = {
                    'success': False, 
                    'msg': 'current email incorrect'
                }
                return data, 200

            db.update_general(
                username, 
                dbpw,
                args['newemail']
            )

            data = {
                'success': True,
                'msg': "Email Changed!"
            }

            return data, 200

