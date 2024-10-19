def calculate_future_balance():
    # Step 1: Get the number of customers
    num_customers = int(input("Enter the number of customers: "))

    # Step 2: Loop through each customer
    for i in range(1, num_customers + 1):
        print(f"\nCustomer {i}:")
        # Step 3: Collect input for each customer
        initial_balance = float(input("Enter the initial balance: "))
        annual_interest_rate = float(input("Enter the annual interest rate (in %): "))
        years = int(input("Enter the number of years: "))

        # Step 4: Calculate future balance
        future_balance = initial_balance * (1 + annual_interest_rate / 100) ** years

        # Step 5: Display the result
        print(f"Future balance after {years} years: ${future_balance:.2f}")

# Call the function to execute the program
calculate_future_balance()
