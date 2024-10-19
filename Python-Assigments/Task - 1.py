def check_loan_eligibility(credit_score, annual_income):
    if credit_score > 700 and annual_income >= 50000:
        return "Congratulations! You are eligible for a loan."
    else:
        return "Sorry, you are not eligible for a loan."

# Input: Credit Score and Annual Income
credit_score = int(input("Enter your credit score: "))
annual_income = float(input("Enter your annual income: "))

# Display the eligibility message
message = check_loan_eligibility(credit_score, annual_income)
print(message)
