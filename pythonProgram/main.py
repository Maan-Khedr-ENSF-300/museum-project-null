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

    if main_menu == "1":
        sub_option =  input("\na.\tAdd art pieces to the database\nb.\tSearch art pieces and exhibitions")
        valid_sub_option = validateSubOption(sub_option)