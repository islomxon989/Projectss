import bcrypt
import jwt
import datetime
import configparser

config = configparser.ConfigParser()
config.read('backend/config/config.ini')

def hash_new_password(password):
    """
    Creates a new hashed password given  a plaintext password.

    :param password: The submitted password
    :return: the hashed password
    """
    password=password.encode()
    hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())
    return hashed_password

def does_password_match(userpass, dbpass):
    """
    Checks if the submitted password matches what is stored in the database.
    :param userpass: The submitted plaintext password
    :param dbpass: The stored hashed password
    :return: True if passwords match; Otherwise, False
    """
    #print(bcrypt.hashpw(userpass.encode(), dbpass.encode()))
    #print(dbpass)
    return bcrypt.hashpw(userpass.encode(), dbpass.encode()) == dbpass.encode()


def does_password_match_AS(userpass, dbpass):
    """
    Checks if the submitted password matches what is stored in the database.

    :param userpass: The submitted plaintext password
    :param dbpass: The stored hashed password
    :return: True if passwords match; Otherwise, False
    """
    # print(bcrypt.hashpw(userpass.encode(), dbpass.encode()))
    # print(dbpass)
    encodeddbp = dbpass
    encodedup = userpass.encode()
    return bcrypt.hashpw(
        encodedup, 
        encodeddbp
    ) == encodeddbp

def generate_token(username):
    """
    Given a username, generates a session token.

    :param username: string given username
    :return: string session token
    """
    try:
        jwtclaims = {
            'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=15),
            'iat': datetime.datetime.utcnow(),
            'sub': username
        }
        return jwt.encode(
            jwtclaims,
            config['Session']['key'],
            algorithm='HS256'
        )
    except Exception as e:
        return e

def generate_refresh(username):
    """
    Given a username, generates a refresh token.

    :param username: string given username
    :return: string session token
    """
    try:
        jwtclaims = {
            'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1),
            'iat': datetime.datetime.utcnow(),
            'sub': username
        }
        return jwt.encode(
            jwtclaims,
            config['Session']['key'],
            algorithm='HS256'
        )
    except Exception as e:
        return e

def getTokenUsername(token):
    """
    Given a valid jwt token, retrieve the username

    :param token: jwt token
    :return: string username
    """
    decoded = jwt.decode(
        token, 
        config['Session']['key'],
        algorithms='HS256'
    )
    return decoded['sub']

def getTokenExpiry(token):
    """
    Given a valid jwt token, retrieve the expiry date

    :param token: jwt token
    :return: datetime expiry date
    """
    decoded = jwt.decode(
        token, 
        config['Session']['key'],
        algorithms='HS256'
    )
    return decoded['exp']

def validateToken(token):
    """
    Given a token, check if it is a valid token

    :param token: jwt token
    :return: boolean
    """
    try:
        jwt.decode(
            token, 
            config['Session']['key'],
            algorithms='HS256'
        )
        return True
    except Exception as e:
        return False
