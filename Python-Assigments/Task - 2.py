def atm_transaction():
    # Step 1: User inputs current balance
    balance = float(input("Enter your current balance: "))

    # Step 2: Display ATM options
    print("\nATM Options:")
    print("1. Check Balance")
    print("2. Withdraw")
    print("3. Deposit")

    # Step 3: User chooses an option
    option = input("Choose an option (1, 2, or 3): ")

    # Step 4: Nested conditional logic for each transaction type
    if option == "1":
        # Check balance
        print(f"Your current balance is: ${balance:.2f}")

    elif option == "2":
        # Withdraw
        amount = float(input("Enter the amount to withdraw: "))
        if amount > balance:
            print("Insufficient balance.")
        elif amount % 100 != 0 and amount % 500 != 0:
            print("Withdrawal amount must be in multiples of 100 or 500.")
        else:
            balance -= amount
            print(f"Withdrawal successful! Your new balance is: ${balance:.2f}")

    elif option == "3":
        # Deposit
        amount = float(input("Enter the amount to deposit: "))
        balance += amount
        print(f"Deposit successful! Your new balance is: ${balance:.2f}")

    else:
        # Invalid option handling
        print("Invalid option selected. Please try again.")

    
atm_transaction()
