import sys

sys.path.append('/web/CSE442-542/2021-Spring/cse-442j/venv/lib/python2.7/site-packages')
sys.path.append('/web/CSE442-542/2021-Spring/cse-442j/')

from flask import Flask, request 
from flask_restful import Resource, Api
from signup import SignUp
from login import Login
from refresh import Refresh
from accountSettings import AccountSettings
from home import Home
from postCreation import NewPost
from upcoming import Upcoming
from tags import Tags 
from datetimesorting import Datetimesorting
from locationSorting import LocationSorting 
from onlineSorting import OnlineSorting 
from join import Join 
from profileinfo import Profile
import configparser

config = configparser.ConfigParser()
config.read('/web/CSE442-542/2021-Spring/cse-442j/config/config.ini')

application = Flask("__name__")
api = Api(application)

#Signup endpoint
api.add_resource(SignUp, '/plannitsignup')
#Login endpoint
api.add_resource(Login, '/plannitlogin')
#Refresh Token
api.add_resource(Refresh, '/refresh-token')
#Home endpoint
api.add_resource(Home, '/home')
#Account Settings endpoint
api.add_resource(AccountSettings, '/settings')
#New Post Endpoint
api.add_resource(NewPost, '/newpost')
#Upcoming Endpoint
api.add_resource(Upcoming, '/upcoming')
#Tags Endpoint
api.add_resource(Tags, '/tags')
#Datetime Endpoint
api.add_resource(Datetimesorting, '/datetimesorting')
#Join Post endpoint
api.add_resource(Join, '/join')
#Location Endpoint
api.add_resource(LocationSorting, '/locationsorting')
#Online Endpoint
api.add_resource(OnlineSorting, '/onlinesorting')

#profile endpoint
api.add_resource(Profile, '/profile')

if __name__ == "__main__":
	application.run()
