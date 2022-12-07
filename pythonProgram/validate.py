import mysql.connector

def validateCredentials(username, pword) -> bool:
    try:
        mysql.connector.connect(
            host="127.0.0.1", port=3306, user=username, password=pword)
    except Exception as error:
        if "Access denied for user" in str(error):
            print("Invalid Login Credentials")
            return False
        else:
            raise error
    return True

def validateMenuOption(main_menu):
    options = ["1","2"]
    if main_menu in options:
        return True
    return False

def validateSubOption(sub_option):
    options = ["a","b"]
    if sub_option.lower() in options:
        return True
    return False