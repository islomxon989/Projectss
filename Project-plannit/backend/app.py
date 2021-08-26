from flask import Flask 
from flask_restful import Resource, Api
from signup import SignUp
from login import Login
from accountSettings import AccountSettings
from refresh import Refresh
from home import Home
from postCreation import NewPost
from datetimesorting import Datetimesorting
from locationSorting import LocationSorting
from onlineSorting import OnlineSorting
from profileinfo import Profile
from join import Join
import configparser

config = configparser.ConfigParser()
config.read('backend/config/config.ini')

app = Flask(__name__)
api = Api(app)

#Signup endpoint
api.add_resource(SignUp, '/signup')
#Login endpoint
api.add_resource(Login, '/login')
#Account Settings endpoint
api.add_resource(AccountSettings, '/settings')
#Refresh Token
api.add_resource(Refresh, '/refresh-token')
#Home endpoint
api.add_resource(Home, '/home')
#New Post endpoint
api.add_resource(NewPost, '/newpost')
#Datetime Endpoint
api.add_resource(Datetimesorting, '/datetimesorting')
#Location Sorting Endpoint
api.add_resource(LocationSorting, '/locationsorting')
#Online/In-Person Sorting Endpoint
api.add_resource(OnlineSorting, '/onlinesorting')
#Join Post endpoint
api.add_resource(Join, '/join')
#Profile Information endpoint
api.add_resource(Profile, '/profile')

#This will have to change for server hosting, as it is http based.
if __name__ == '__main__':
    app.run(host=config['General']['host'], port=config['General']['port'])