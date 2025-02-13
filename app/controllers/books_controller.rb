class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :borrow, :return]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.status = 'available'

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully deleted.'
  end

  def borrow
    borrower = Borrower.find_or_create_by!(borrower_params)
    
    if @book.available?
      lending_record = @book.lending_records.create!(
        borrower: borrower,
        borrowed_at: Time.current
      )
      @book.update!(status: 'borrowed')
      redirect_to @book, notice: 'Book was successfully borrowed.'
    else
      redirect_to @book, alert: 'Book is already borrowed.'
    end
  end

  def return
    if lending_record = @book.current_lending_record
      lending_record.update!(returned_at: Time.current)
      @book.update!(status: 'available')
      redirect_to @book, notice: 'Book was successfully returned.'
    else
      redirect_to @book, alert: 'Book is not currently borrowed.'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end

  def borrower_params
    params.require(:borrower).permit(:name, :email)
  end
end
