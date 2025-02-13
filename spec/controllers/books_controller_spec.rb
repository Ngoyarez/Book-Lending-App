require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all books to @books' do
      book1 = Book.create!(title: 'Book 1', author: 'Author 1', isbn: '123', status: 'available')
      book2 = Book.create!(title: 'Book 2', author: 'Author 2', isbn: '456', status: 'available')
      
      get :index
      
      expect(assigns(:books)).to match_array([book1, book2])
    end
  end

  describe 'POST #borrow' do
    let(:book) { Book.create!(title: 'Test Book', author: 'Test Author', isbn: '789', status: 'available') }
    let(:valid_borrower_params) { { borrower: { name: 'John Doe', email: 'john@example.com' } } }

    it 'creates a new lending record and updates book status' do
      expect {
        post :borrow, params: { id: book.id }.merge(valid_borrower_params)
      }.to change(LendingRecord, :count).by(1)

      book.reload
      expect(book.status).to eq('borrowed')
      expect(response).to redirect_to(book_path(book))
    end
  end
end