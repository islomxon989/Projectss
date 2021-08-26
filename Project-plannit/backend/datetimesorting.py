import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db

class Datetimesorting(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('token', required=True)
        parser.add_argument('start', required=True)
        parser.add_argument('end', required=True)
        args = parser.parse_args()

        token=args['token']
        if not ac.validateToken(token):
            return {'success': False}, 200
        
        #Valid token, therefore return list of posts

        posts = db.get_posts_sorted_by_datetime(args['start'], args['end'])

        data = {
            'success': True,
            'posts': posts
        }

        headers={
            'Cache-Control': 'no-cache, max-age=0'
        }

        return data, 200, headers