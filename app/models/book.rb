class Book < ApplicationRecord
  has_many :lending_records, dependent: :destroy
  has_many :borrowers, through: :lending_records
  
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: ['available', 'borrowed'] }
  
  def current_lending_record
    lending_records.where(returned_at: nil).first
  end
  
  def available?
    status == 'available'
  end
  
  def current_borrower
    current_lending_record&.borrower
  end
end
