# Simulating a bank with multiple customer accounts

# Dictionary to store account numbers and their respective balances
accounts = {
    "123456": 1500.00,
    "654321": 2500.50,
    "111222": 750.75,
    "333444": 1000.00,
}

def check_balance():
    while True:
        # Prompt the user for their account number
        account_number = input("Please enter your account number (or 'exit' to quit): ")
        
        # Allow user to exit the program
        if account_number.lower() == 'exit':
            print("Exiting the program.")
            break
        
        # Validate the account number
        if account_number in accounts:
            # Display the account balance
            balance = accounts[account_number]
            print(f"Your account balance is: ${balance:.2f}")
            break  # Exit the loop after successful balance check
        else:
            # Prompt the user to try again
            print("Invalid account number. Please try again.")

# Run the balance check program
check_balance()
