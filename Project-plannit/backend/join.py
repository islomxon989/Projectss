import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db
import json

class Join(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('token', required=True)
        parser.add_argument('id', required=True)
        args = parser.parse_args()

        token=args['token']
        if not ac.validateToken(token):
            return {'success': False, 'msg':'invalid authentication'}, 200
            
        #Valid token, therefore get username
        username = ac.getTokenUsername(token)

        #Check if post exists and get that post
        post = db.read_post(args['id'])

        if not post:
            return {'success':False, 'msg':'post does not exist.'}, 200

        #Check if they are a part of the group
        maxp = post[6]
        participants = json.loads(post[7])['participants']

        if username in participants:
            return {'success':False, 'msg':'event already joined'}, 200

        #If not, check if the post is full
        if len(participants) >= maxp:
            return {'success':False, 'msg':'event is full'}, 200

        #Add them to the group and return true

        participants.append(username)

        db.update_participants(args['id'], participants)
        
        data = {
            'success': True,
            'msg': "Event Joined!", 
            'id': args['id']
        }

        headers={
            'Cache-Control': 'no-cache, max-age=0'
        }

        return data, 200, headers