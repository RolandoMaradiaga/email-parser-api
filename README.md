# README

The Email Parser API is a Ruby on Rails-based application that parses .eml email files to extract JSON data. The JSON content can either be:

Attached as a file in the email.
Linked as a URL in the email body.
This API provides a clean and robust way to process email data, making it ideal for integration with email workflows or automated systems.


Tech Stack
Ruby on Rails 7.2.1
Mail Gem (Email parsing)
JSON (Data extraction)
RSpec (Testing)
Postman (API Testing)

1. Clone the Repository
bash
Copy code
git clone https://github.com/your-username/email-parser-api.git
cd email-parser-api
2. Install Dependencies
bash
Copy code
bundle install
3. Configure Database
bash
Copy code
rails db:create
rails db:migrate
4. Start the Server
bash
Copy code
rails server
The API will run on http://localhost:3000.

🧪 Running Tests
RSpec is used for testing.

Run the tests with:

bash
Copy code
bundle exec rspec
Test coverage includes:

Valid .eml file parsing
Handling of missing email_path
Error scenarios during parsing

📂 Sample Email File
A sample .eml file is provided in the tmp/ directory:

File: tmp/sample_email.eml
Contains:
JSON attachment (data.json)
A URL linking to external JSON data


