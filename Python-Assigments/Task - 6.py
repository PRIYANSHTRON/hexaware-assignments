def bank_transactions():
    # List to store transaction history
    transactions = []

    while True:
        # Prompt the user to enter a transaction
        transaction_type = input("Enter transaction type (deposit/withdrawal) or 'exit' to finish: ").lower()

        # Exit the loop if the user chooses to exit
        if transaction_type == 'exit':
            break

        # Validate transaction type
        if transaction_type not in ['deposit', 'withdrawal']:
            print("Invalid transaction type. Please enter 'deposit' or 'withdrawal'.")
            continue

        # Get the amount for the transaction
        amount = input("Enter the amount: ")

        # Validate if the amount is a positive number
        if not amount.replace('.', '', 1).isdigit() or float(amount) <= 0:
            print("Please enter a valid positive amount.")
            continue

        # Append the transaction to the list
        transactions.append((transaction_type, float(amount)))

        print(f"{transaction_type.capitalize()} of ${amount} added.")

    # Display transaction history upon exit
    print("\nTransaction History:")
    if not transactions:
        print("No transactions recorded.")
    else:
        for i, (trans_type, amount) in enumerate(transactions, start=1):
            print(f"{i}. {trans_type.capitalize()}: ${amount:.2f}")

# Run the bank transactions program
bank_transactions()
