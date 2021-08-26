import account_creation as ac
from flask import Flask 
from flask_restful import Resource, Api, reqparse
import database as db

class Tags(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('token', required=True)
        parser.add_argument('sort_type')
        parser.add_argument('tagsList')
        args = parser.parse_args()

        token=args['token']
        if not ac.validateToken(token):
            return {'success': False}, 200
            
        #Valid token, therefore return list of posts
        
        sort_type = args['sort_type']
        tagsList = args['tagsList']
        
        posts = db.get_posts_sorted_by_tags(tagsList)

        data = {
            'success': True,
            'posts': posts
        }

        headers={
            'Cache-Control': 'no-cache, max-age=0'
        }

        return data, 200, headers


