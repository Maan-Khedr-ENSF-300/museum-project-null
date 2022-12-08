from validate import *
from getpass import getpass
from queryClass import *
from displayData import *


def main():
    print("\n1.\tLogin as admin\n2.\tLogin as guest")
    user_type = input("Enter a number to choose option: ")
    print('')

    if user_type == '1':
        valid_credentials = False
        while not valid_credentials:
            user = input("Username: ")
            password = getpass("Password: ")
            valid_credentials = validateCredentials(user, password)
        validate_schema = False
        while not validate_schema:
            user_schema = input("Enter the name of the database to use: ")
            validate_schema = validateSchema(user, password, user_schema)
        user_query = input(
            "Enter your SQL in the terminal or the file directory where your SQL is located:\n")
        while not validateSqlInput(user_query):
            user_query = input(
                "Enter your SQL in the terminal or the file directory where your SQL is located:\n")
        sql_file = user_query
        if len(user_query.split(' ')) <= 1:
            file_p = open(user_query, 'r')

            sql_file = file_p.read()
            file_p.close()
        obj = QueryBuilder(user, password, user_schema)
        obj.adminQuery(sql_file)

    elif user_type == '2':
        obj = QueryBuilder('guest', None, 'artsmuseum')
        tables = obj.getTableNames()
        table_options = {}
        for i in range(len(tables)):
            table_options[str(i+1)] = tables[i]
            print(f'{i+1}.\t{table_options[str(i+1)]}')
        table_name = input(
            "Enter the number of the table you would like to query: ")
        if table_name in table_options:
            table_name = table_options[table_name]
            column_info = obj.columnInfo(table_name)
            cols = [x[0] for x in column_info]
            print(
                f"\nList of columns in {table_name}: {cols}")
            sel_columns = input(
                'Enter * to select all columns or specify each column separated by spaces: ')
            sel_columns = sel_columns.split(" ")
            if sel_columns[0] == '*':
                sel_columns = cols
            act_list = []
            for i in sel_columns:
                if i in cols:
                    act_list.append(i)
            if len(act_list) == len(sel_columns):
                where_dec = input(
                    'Enter "Y" to add a WHERE condition, enter anything else to skip: ')
                condition = None
                if where_dec.lower() == 'y':
                    condition = input(
                        "Enter a WHERE condition in the form: ColumnName = 'Column Value'\n")

                if (condition == None) or ((condition.split(' '))[0] in cols):
                    order_dec = input(
                        'Enter "Y" to ORDER BY a particular column, enter anything else to skip: ')
                    order_col = None
                    not_in = []
                    if order_dec.lower() == 'y':
                        order_col = input(
                            "Enter an individual column or list of columns separated by spaces for which you want to order your table by: ")
                        order_col = order_col.split(' ')
                        for i in order_col:
                            if not (i in cols):
                                not_in.append(i)
                    if len(not_in) == 0:
                        sel_columns = ", ".join(sel_columns)
                        if order_col != None:
                            order_col = ", ".join(order_col)
                        rows = obj.query(table_name, sel_columns,
                                         condition, order_col)
                        displayTable(act_list, rows)

                    else:
                        print(
                            f"Columns {not_in} are not in {table_name}. Goodbye!")

                else:
                    print(
                        f"{condition.split(' ')[0]} is not a valid column in {table_name}. Goodbye!")

            else:
                print(
                    f"Column(s) {[x for x in sel_columns if not(x in act_list)]} are not in table {table_name}. Goodbye!")

        else:
            print("Invalid table. Goodbye!")

    else:
        print(f'Selection "{user_type}" is invalid. Goodbye!')

if __name__ == '__main__':
    main()
