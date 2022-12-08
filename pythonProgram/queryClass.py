import mysql.connector


class QueryBuilder():
    def __init__(self, username, pword, db):
        try:
            self.data = mysql.connector.connect(
                host="127.0.0.1", port=3306, user=username, password=pword, database=db)
        except Exception as error:
            if f"Unknown database '{db}'" in str(error):
                raise ValueError("Must enter valid database")
            else:
                raise error

    def adminQuery(self, query):
        tmp = self.data.cursor(buffered=True)
        tmp.execute(query)
        self.data.commit()
