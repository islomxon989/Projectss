import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db
import json
import scuffedEscape

class NewPost(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('token', required=True)
        parser.add_argument('title', required=True)
        parser.add_argument('description', required=True)
        parser.add_argument('tags', required=True)
        parser.add_argument('location', required=True)
        parser.add_argument('online', required=True)
        parser.add_argument('max_participants', required=True)
        parser.add_argument('datetime', required=True)
        parser.add_argument('contact_info', required=True)
        args = parser.parse_args()

        token = args['token']

        #Validate token
        if not ac.validateToken(args['token']):
            return {'success': False, 'msg': 'token expired'}, 200


        username = ac.getTokenUsername(token)

        online = 0
        if (args['online']=='true'):
            online = 1
  
        db.new_post(
            scuffedEscape.escape(args['title']), 
            scuffedEscape.escape(args['description']), 
            scuffedEscape.escape(args['tags']), 
            scuffedEscape.escape(args['location']), 
            online, 
            scuffedEscape.escape(args['max_participants']), 
            str(json.dumps({'participants': [username]})),
            scuffedEscape.escape(args['datetime']), 
            scuffedEscape.escape(args['contact_info']), 
        )

        data = {
            'success': True,
            'msg': "New post created!"
        }

        return data, 200

