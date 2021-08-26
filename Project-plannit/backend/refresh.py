import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse

class Refresh(Resource):
    def get(self):
        parser = reqparse.RequestParser()
        parser.add_argument('refresh', location='cookies', required=True)
        args = parser.parse_args()

        refresh=args['refresh']

        #Check if refresh token valid
        if not ac.validateToken(refresh):
            return {'success': False}, 200
        
        #generate session token
        token=ac.generate_token(ac.getTokenUsername(refresh))

        data = {
            'success': True,
            'msg': "Login Success!",
            'token': token,
            'token-exp': ac.getTokenExpiry(token)
        }

        return data, 200