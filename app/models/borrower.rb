class Borrower < ApplicationRecord
  has_many :lending_records, dependent: :destroy
  has_many :books, through: :lending_records
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  def current_borrows
    lending_records.where(returned_at: nil)
  end
end