from validate import *
from getpass import getpass

def main():

    user = input("Username: ")
    password = getpass("Password: ")
    valid_credentials = validateCredentials(user, password)
    while not valid_credentials:
        user = input("Username: ")
        password = getpass("Password: ")
        valid_credentials = validateCredentials(user, password)

    main_menu = input("\n1.\tManage Art Objects\n2.\tUser Management")
    valid_option = validateMenuOption(main_menu)
    while not valid_option:
        print("Invalid input. Please select from the following options:")
        main_menu = input("\n1.\tManage Art Objects\n2.\tUser Management")
        valid_option = validateMenuOption(main_menu)

    