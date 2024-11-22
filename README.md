# README

### Assessment Instructions

- The Coffee Shop Assessment
- A day at a coffee shop! A simplified POS system for American-style coffee-shops like Starbucks or Caribou Coffee.
- A customer visits a coffee shop that sells a bunch of items (e.g. beverages, sandwiches, coffee mugs, etc.).
- Items can have varying taxes and tax rates, and some are free or offered at a discount when ordered in combination with another item or items.
- The customer is made aware of the order total and once he pays for it, he can wait until he is notified of the order completion.

- You are required to create a program with a set of interfaces that models the above problem at hand. You need to design the DB and backend architecture and implement it. Front-end is not mandatory but your endpoints should be reachable through Postman (please attach postman collection) in such a case, and you should include your API documentation.

- Users should be able to see the list of available items, User should be able to order them and should get a notification after a fixed amount of time that their order is ready.

- Unit test cases are not mandatory but will be considered if tendered.  
  Tech Stack - Current stable Ruby and Ruby on Rails with SQLITE as the database. The default Rails front-end is acceptable or, if you prefer, you can also show us your front-end skills in some JS technologies (React/Angular, etc) or Bootstrap, or plain Html/JS but the whole must be executable as part of a single stack.

- Delivery: You may deliver on a public Github repo (preferred) or via a tar.gz or zip ball (you will lose points). Your delivery must include instructions on how to successfully run your solution locally. Docker and Docker Compose are preferred, easy start up and testing of your solution will be considered positive. Be sure your solution is complete. Make sure your README contains all necessary information. It is possible to fail if we have difficulty verifying your solution, so please make sure that it is easy to run and verify.

- We will begin with an approximately 30-minute live coding session that demonstrates how you will begin solving this problem. This should be thought of as a code pairing session where you share your thoughts as you work, and the interviewer may ask questions or make suggestions.
  The timeline for the submission of your full solution is within 48 hours of the completion of the L1 Technical Interview.

## Project Setup

- `git clone https://github.com/safi-96/coffee_shop.git`
- `cd coffee_shop/`
- `bundle install`
- `rails db:setup`
- `rails s`
- Run Unit Test cases with rspecs
- `bundle exec rspec`

## Endpoints

- GET /items: Fetch all items
- POST /orders: Place an order.
- GET /orders/:id: Fetch order details.
- GET /orders: Fetch all the orders
- PATCH /orders/:id: Update Order status (for payment)

## Explanation

- Customer can see all the items from GET /items endpoint
- Customer can place order by providing the necessary information
- Customer can view his list of orders
- Customer can view his last order for payment purposes
- Customer will be notified over email once he/she pays for the order after 5 minutes

## Postman Collection

To test the API endpoints, you can use the provided Postman collection.

- [Download the Postman Collection](./docs/my-collection.json)

### Importing the Collection in Postman

1. Download the `.json` file from the link above.
2. Open Postman and go to **File > Import**.
3. Select the downloaded `.json` file.
4. The collection will appear in your Postman workspace.
