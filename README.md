# Library Management System

A simple Ruby on Rails application for managing a book lending library. The application allows users to track books, borrowers, and lending history without requiring authentication.

## Features

- Book Management (CRUD)
  - Add new books with title, author, and ISBN
  - View list of all books and their current status
  - Update book information
  - Remove books from the system
  
- Borrowing System
  - Track book borrowing and returns
  - Record borrower information
  - View borrowing history for each book
  - View borrower's lending history
  
- Status Tracking
  - Display book availability (available/borrowed)
  - Show current borrower for each book
  - List all active loans

## Requirements

- Ruby 3.2.0 or higher
- Rails 8.0.0
- PostgreSQL
- Node.js
- Yarn

## Installation

1. Clone the repository
```bash
git clone <repository-url>
cd library
```

2. Install dependencies
```bash
bundle install
yarn install
```

3. Database setup
```bash
# Update config/database.yml with your PostgreSQL credentials
rails db:create
rails db:migrate
```

4. Start the server
```bash
rails server
```

5. Visit http://localhost:3000 in your browser

## Running Tests

The application uses RSpec for testing. To run the test suite:

```bash
bundle exec rspec
```

## Database Schema

### Books
- title (string)
- author (string)
- isbn (string)
- status (string) - either 'available' or 'borrowed'

### Borrowers
- name (string)
- email (string)

### LendingRecords
- book_id (references)
- borrower_id (references)
- borrowed_at (datetime)
- returned_at (datetime)

## Usage Examples

### Adding a New Book
1. Click "Add New Book" on the main page
2. Fill in the book details
3. Click "Create Book"

### Borrowing a Book
1. Navigate to the book's details page
2. Click "Borrow Book"
3. Enter borrower information
4. Submit the form

### Returning a Book
1. Navigate to the book's details page
2. Click "Return Book"

### Viewing History
- Book History: Visit the book's details page
- Borrower History: Click on a borrower's name in any view

## Design Decisions

- No authentication required for simplicity
- Simple borrower management without separate registration
- Automatic status updates based on lending actions
- Comprehensive history tracking for both books and borrowers

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.