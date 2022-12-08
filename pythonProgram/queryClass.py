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

    def query(self, table, columns, condition=None, order_by=None, return_query_flag=False):
        tmp = self.data.cursor(buffered=True)
        select_str = f"SELECT {columns} FROM {table}"
        if condition != None:
            select_str += f" WHERE {condition}"
        if order_by != None:
            select_str += f" ORDER BY {order_by}"

        tmp.execute(select_str)
        if return_query_flag:
            return select_str
        else:
            select_str += ';'
            return tmp.fetchall()

    def columnInfo(self, table):
        tmp = self.data.cursor(buffered=True)
        tmp.execute(f"SELECT * FROM {table}")
        column_info = [[i[0], i[1], i[6]] for i in tmp.description]

        return column_info

    def getTableNames(self):
        tmp = self.data.cursor(buffered=True)
        tmp.execute("SHOW TABLES")
        return [x[0] for x in tmp]
