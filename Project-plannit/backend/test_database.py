import database
import configparser
import os.path
import mysql.connector
import pytest

def test_config_exists():
    assert os.path.isfile('backend/config/config.ini')

def test_config_database():
    config = configparser.ConfigParser()
    config.read('backend/config/config.ini')
    assert 'Database' in config

def test_db_exists():
    db = database.getDB()

    #Are you on the UB network? If not, switch to the Cisco AnyConnect VPN
    assert type(db) == mysql.connector.connection.MySQLConnection


