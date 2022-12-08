from validate import *
from getpass import getpass


def main():
    print("\n1.\tLogin as guest\n2.\tLogin as admin")
    user_type = input("Enter a number to choose option: ")

    if user_type == '1':
        pass

    elif user_type == '2':
        valid_credentials = False
        while not valid_credentials:
            user = input("Username: ")
            password = getpass("Password: ")
            valid_credentials = validateCredentials(user, password)
        validate_schema = False
        while not validate_schema:
            user_schema = input("Enter the name of the database to use: ")
            validate_schema = validateSchema(user, password, user_schema)
    else:
        print(f'Selection "{user_type}" is invalid.')

    # user = input("Username: ")
    # password = getpass("Password: ")
    # valid_credentials = validateCredentials(user, password)
    # while not valid_credentials:
    #     user = input("Username: ")
    #     password = getpass("Password: ")
    #     valid_credentials = validateCredentials(user, password)

    # main_menu = input("\n1.\tManage Art Objects\n2.\tUser Management")
    # valid_option = validateMenuOption(main_menu)
    # while not valid_option:
    #     print("Invalid input. Please select from the following options:")
    #     main_menu = input("\n1.\tManage Art Objects\n2.\tUser Management")
    #     valid_option = validateMenuOption(main_menu)

    # if main_menu == "1":
    #     sub_option = input(
    #         "\na.\tAdd art pieces to the database\nb.\tSearch art pieces and exhibitions")
    #     valid_sub_option = validateSubOption(sub_option)


if __name__ == '__main__':
    main()
