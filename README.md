# CashierApp

CashierApp is a simple Elixir module that calculates the total cost of items scanned at a checkout, applying specific pricing rules and discounts based on item codes.

Applies "Buy One Get One Free" for certain products

Offers bulk pricing discounts

Rounds total to two decimal places for accuracy

Easily extendable for additional pricing rules

**How to use**

To use the module, call the CashierApp.total/1 function with a list of item codes (strings):

iex> CashierApp.total(["GR1", "SR1", "GR1", "GR1", "CF1"])
29.34


**total/1**


This is the main function. It takes a list of item codes (e.g. ["GR1", "SR1", "GR1"]) and:

*Groups the items by code using Enum.frequencies/1
*Applies relevant pricing rules per item group
*Returns the total price rounded to two decimal places

**apply_pricing_rule/2**

A private helper function that determines how to apply pricing based on item code and quantity:

"GR1": Buy-one-get-one-free offer. For example, 2 items are charged as 1 ((2 + 1) / 2 = 2).

"SR1": Bulk discount if 3 or more are bought. Price drops from €5.00 to €4.50 each.

"CF1": Three for the price of two offer. Adjusts unit price proportionally.

Any other unknown codes default to 0.0.


**Run test**

run **mix test** in the app directory to run the test cases

