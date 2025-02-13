require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      book = Book.new(
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        isbn: '978-0743273565',
        status: 'available'
      )
      expect(book).to be_valid
    end

    it 'is not valid without a title' do
      book = Book.new(
        author: 'F. Scott Fitzgerald',
        isbn: '978-0743273565',
        status: 'available'
      )
      expect(book).not_to be_valid
    end

    it 'is not valid with a duplicate_book = Book.new(
        title: 'Another Book',
        author: 'Another Author',
        isbn: '978-0743273565',
        status: 'available'
      )
      expect(duplicate_book).not_to be_valid
    end
  end

  describe '#available?' do
    it 'returns true when status is available' do
      book = Book.new(status: 'available')
      expect(book.available?).to be true
    end

    it 'returns false when status is borrowed' do
      book = Book.new(status: 'borrowed')
      expect(book.available?).to be false
    end
  end
end