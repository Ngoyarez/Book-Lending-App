class BorrowersController < ApplicationController
  def index
    @borrowers = Borrower.all
  end

  def show
    @borrower = Borrower.find(params[:id])
    @lending_records = @borrower.lending_records.includes(:book)
  end
end