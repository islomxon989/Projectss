import configparser
import mysql.connector
import account_creation as ac
import json
from datetime import date, datetime
import time

config = configparser.ConfigParser()
config.read('backend/config/config.ini')

#Number of posts to fetch when calling fetchMany()
fetch_num = 50

def datetime_to_epoch(date_time):
    epoch = time.mktime(time.strptime(date_time, "%m-%d-%Y %H:%M"))
    return epoch

def get_current_epoch():
    date_today = date.today().strftime("%m-%d-%Y")
    time_now = datetime.now().time().strftime("%H:%M")
    date_time = date_today + ' ' + time_now
    # print('Current date and time: ' + date_time)
    return datetime_to_epoch(str(date_time))

def epoch_to_datetime(epoch):
    date_time = datetime.fromtimestamp(epoch).strftime('%m-%d-%Y %H:%M')
    return date_time

# current_epoch = get_current_epoch()
# print('\nCurrent epoch: ' + str(current_epoch))
# current_datetime = epoch_to_datetime(946702800)
# print('\nDatetime from epoch: ' + str(current_datetime))
# back_to_epoch = datetime_to_epoch('01-01-2000 00:00')
# print('\nEpoch from datetime: ' + str(back_to_epoch))


def getDB():
    db = mysql.connector.connect(
        host=config['Database']['host'],
        user=config['Database']['user'],
        password=config['Database']['password'], # This is the new line
        database=config['Database']['database']
    )

    cursor = db.cursor(prepared=True)
    return db, cursor

def create_new_user(username, hashedpass, email):
    sql = 'INSERT INTO User_account_information (username, password, email) VALUES (%s, %s, %s)'
    val = (username, hashedpass, email)
    db, cursor = getDB()
    cursor.execute(sql, val)
    cursor.close()
    db.close()
    

def read_user(username):
    sql = 'SELECT * FROM User_account_information WHERE username=%s'
    val = username
    db, cursor = getDB()
    cursor.execute(sql, (username,))
    ret = cursor.fetchone()
    cursor.close()
    db.close()
    return ret

def read_posts():
    sql = 'SELECT * FROM posts'
    db, cursor = getDB()
    cursor.execute(sql)
    ret = cursor.fetchmany(fetch_num)
    cursor.close()
    db.close()
    return ret

def get_posts_sorted_by_upcoming():
    epoch = get_current_epoch()
    sql = 'SELECT * FROM posts WHERE datetime>' + str(epoch) + ' ORDER BY datetime ASC'
    db, cursor = getDB()
    cursor.execute(sql)
    ret = cursor.fetchmany(fetch_num)
    cursor.close()
    db.close()
    return ret

# :param tags: A list of the tags that the user would like to filter by
def get_posts_sorted_by_tags(tags):
    epoch = get_current_epoch()
    sql = 'SELECT * FROM posts WHERE '
    for idx in range(0, len(tags)):
        concat = "tags LIKE '%" + str(tags[idx]) + "%' AND "
        sql+=concat
    sql+='datetime>' + str(epoch) + ' ORDER BY datetime ASC'
    db, cursor = getDB()
    cursor.execute(sql)
    ret = cursor.fetchmany(fetch_num)
    cursor.close()
    db.close()
    return ret

def get_posts_sorted_by_datetime(start, end):
    current_epoch = get_current_epoch()
    sql = 'SELECT * FROM posts WHERE datetime>' + str(start) + ' AND datetime<' + str(end) + ' ORDER BY datetime ASC'
    db, cursor = getDB()
    cursor.execute(sql)
    ret = cursor.fetchmany(fetch_num)
    cursor.close()
    db.close()
    return ret

def get_posts_sorted_by_location(location):
    current_epoch = get_current_epoch()
    sql = 'SELECT * FROM posts WHERE location=' + str(location) + ' ORDER BY datetime ASC'
    db, cursor = getDB()
    cursor.execute(sql)
    ret = cursor.fetchmany(fetch_num)
    cursor.close()
    db.close()
    return ret

def get_posts_sorted_by_online(online):
    current_epoch = get_current_epoch()
    sql = 'SELECT * FROM posts WHERE online=' + str(online) + ' ORDER BY datetime ASC'
    db, cursor = getDB()
    cursor.execute(sql)
    ret = cursor.fetchmany(fetch_num)
    cursor.close()
    db.close()
    return ret

def update_username(username, newUsername, password, email):
    sql = "UPDATE User_account_information SET username=%s WHERE username=%s"
    val = (newUsername, username)
    db, cursor = getDB()
    cursor.execute(sql, val)
    cursor.fetchall()
    cursor.close()
    db.close()

def update_general(username, hashedpass, email):
    sql = "UPDATE User_account_information SET password=%s, email=%s WHERE username=%s"
    val = (hashedpass, email, username)
    db, cursor = getDB()
    cursor.execute(sql, val)
    cursor.fetchall()
    cursor.close()
    db.close()

def new_post(title, description, tags, location, online, max_participants, participants, datetime, contact_info):
    sql = 'INSERT INTO posts (title, description, tags, location, online, max_participants, participants, datetime, contact_info) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)'
    tagList = tags.split(",")
    tagJson = str(json.dumps({'tags': tagList}))
    val = (title, description, tagJson, location, online, max_participants, participants, datetime, contact_info)
    db, cursor = getDB()
    cursor.execute(sql, val)
    db.commit()
    cursor.close()
    db.close()

def read_post(id):
    sql = 'SELECT * FROM posts WHERE id=%s'
    db, cursor = getDB()
    cursor.execute(sql, (id,))
    ret = cursor.fetchone()
    cursor.close()
    db.close()
    return ret

def update_participants(id, participants):
    sql = 'UPDATE posts SET participants=%s WHERE id=%s'
    val = (str(json.dumps({'participants': participants})), id)
    db, cursor = getDB()
    cursor.execute(sql, val)
    db.commit()
    cursor.close()
    db.close()

def get_profile(username):
    sql = "SELECT * FROM profile WHERE username=%s"
    db, cursor = getDB()
    cursor.execute(sql, (username,))
    ret = cursor.fetchone()
    cursor.close()
    db.close()
    return ret 

def create_profile(username, first, last, age, birthday):
    sql = 'INSERT INTO profile (username, first, last, age, birthday) VALUES (%s, %s, %s, %s, %s)'
    val = (username, first, last, age, birthday)
    db, cursor = getDB()
    cursor.execute(sql, val)
    db.commit()
    cursor.close()
    db.close()

def update_profile(username, first, last, age, birthday):
    sql = 'UPDATE profile SET first=%s, last=%s, age=%s, birthday=%s WHERE username=%s'
    val = (first, last, age, birthday, username)
    db, cursor = getDB()
    cursor.execute(sql, val)
    db.commit()
    cursor.close()
    db.close()

def update_profile_username(newun, username):
    sql = 'UPDATE profile SET username=%s WHERE username=%s'
    val = (newun, usernamed)
    db, cursor = getDB()
    cursor.execute(sql, val)
    db.commit()
    cursor.close()
    db.close()
