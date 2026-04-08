import csv
import matplotlib.pyplot as plt

file_name = "expenses.csv"


def add_expense():
    date = input("Enter date (YYYY-MM-DD): ")
    category = input("Enter category: ")
    amount = input("Enter amount: ")
    desc = input("Enter description: ")

    file = open(file_name, "a", newline="")
    writer = csv.writer(file)
    writer.writerow([date, category, amount, desc])
    file.close()

    print("Expense added")


def view_expenses():
    try:
        file = open(file_name, "r")
        reader = csv.reader(file)

        print("\nDate  Category  Amount  Description")
        print("------------------------------------")

        for row in reader:
            print(row[0], row[1], row[2], row[3])

        file.close()

    except:
        print("No records found")


def monthly_summary():
    month = input("Enter month (YYYY-MM): ")

    total = 0
    categories = {}

    try:
        file = open(file_name, "r")
        reader = csv.reader(file)

        for row in reader:
            date = row[0]
            cat = row[1]
            amt = float(row[2])

            if date.startswith(month):
                total = total + amt

                if cat in categories:
                    categories[cat] = categories[cat] + amt
                else:
                    categories[cat] = amt

        file.close()

        print("\nTotal Expense:", total)

        print("\nCategory Wise:")
        for c in categories:
            print(c, ":", categories[c])

        if len(categories) > 0:
            highest = max(categories, key=categories.get)
            print("\nHighest Spending:", highest)

            # pie chart
            labels = list(categories.keys())
            values = list(categories.values())

            plt.figure()
            plt.pie(values, labels=labels, autopct='%1.1f%%')
            plt.title("Expense Distribution")
            plt.show()

    except:
        print("No data available")


while True:
    print("\n1 Add Expense")
    print("2 View Expenses")
    print("3 Monthly Summary")
    print("4 Exit")

    choice = input("Enter choice: ")

    if choice == "1":
        add_expense()

    elif choice == "2":
        view_expenses()

    elif choice == "3":
        monthly_summary()

    elif choice == "4":
        break

    else:
        print("Invalid choice")
