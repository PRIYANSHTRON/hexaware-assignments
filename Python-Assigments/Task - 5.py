def password_validation():
    # Prompt user to create a password
    password = input("Create a password for your bank account: ")

    # Initialize validation flags
    is_valid = True
    messages = []

    # Check the length of the password
    if len(password) < 8:
        is_valid = False
        messages.append("Password must be at least 8 characters long.")

    # Check for at least one uppercase letter
    if not any(char.isupper() for char in password):
        is_valid = False
        messages.append("Password must contain at least one uppercase letter.")

    # Check for at least one digit
    if not any(char.isdigit() for char in password):
        is_valid = False
        messages.append("Password must contain at least one digit.")

    # Display validation result
    if is_valid:
        print("Your password is valid.")
    else:
        print("Your password is invalid.")
        for message in messages:
            print(message)

# Run the password validation program
password_validation()
