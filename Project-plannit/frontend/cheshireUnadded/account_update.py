import configparser
import bcrypt
import account_creation as ac
import database as db

config = configparser.ConfigParser()
config.read('backend/config/config.ini')

def update_password(username, PW, newPW, confirmPW, email, dbpass):
    if ((ac.does_password_match(PW, dbpass)) and (confirmPW.encode != newPW.encode)):
	    sql = "INSERT INTO User_account_information (username, password, email) VALUES (%s, %s, %s)"
        db, cursor = db.getDB()
	    val = (username, newPW, email)
	    cursor.execute(sql, val)
    

def update_username(username, newUsername, password, email, db):
    """
    Given an username and a new input username, update user to have the new username in the database.
    
    :param username: string username
    :param newUsername: string of new username input
    :param db: database
    """
    if (username.encode == newUsername.encode):
	    sql = "INSERT INTO User_account_information (username, password, email) VALUES (%s, %s, %s)"
	    val = (newUsername, password, email)
	    cursor.execute(sql, val)
	    db.commit()
    

def update_email(email, newEmail, password, username, db):
    """
    Given an email and a new Email, update the user to have the new Email in the database.
    
    :param email: string email
    :param newEmail: string of new email input
    :param db: database
    """

    if (email.encode == newEmail.encode):
	    sql = "INSERT INTO User_account_information (username, password, email) VALUES (%s, %s, %s)"
	    val = (username, password, newEmail)
	    cursor.execute(sql, val)
	    db.commit()



# __if __name__ == '__main__':
#     update_email("")
#     import sys
#     args = sys.argv[1:]
#     process(args)
#     setup_logging()
#     sys.exit(main(args))
#     