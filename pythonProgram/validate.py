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


def validateSchema(username, pword, db):
    try:
        mysql.connector.connect(
            host="127.0.0.1", port=3306, user=username, password=pword, database=db)

    except Exception as error:
        if f"Unknown database '{db}'" in str(error):
            print(f'Database "{db}" does not exist')
            return False
        else:
            raise error
    return True


def validateSqlInput(user_inp):
    if len(user_inp.split(' ')) <= 1:
        try:
            open(user_inp, 'r')
        except Exception as e:
            if "No such file or directory:" in str(e):
                print("Invalid directory.\n")
                return False
            else:
                raise e
    return True
