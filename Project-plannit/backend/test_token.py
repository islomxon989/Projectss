import pytest
import bcrypt
import account_creation as ac
import os.path
import jwt
import datetime
import configparser

def test_config_exists():
    assert os.path.isfile('backend/config/config.ini')

def test_config_session():
    config = configparser.ConfigParser()
    config.read('backend/config/config.ini')
    assert 'Session' in config
    

def test_config_secret():
    config = configparser.ConfigParser()
    config.read('backend/config/config.ini')
    assert 'key' in config['Session']

def test_config_secret_not_empty():
    config = configparser.ConfigParser()
    config.read('backend/config/config.ini')
    assert config['Session']['key'] != ''

def test_token_generation_valid():
    config = configparser.ConfigParser()
    config.read('backend/config/config.ini')
    testusername = 'testotest'
    token = ac.generate_token(testusername)
    assert jwt.decode(
        token, 
        config['Session']['key'],
        algorithms='HS256'
    )
    


