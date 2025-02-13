class LendingRecord < ApplicationRecord
  belongs_to :book
  belongs_to :borrower
  
  validates :borrowed_at, presence: true
  validate :return_date_after_borrow_date
  
  private
  
  def return_date_after_borrow_date
    return unless returned_at.present? && borrowed_at.present?
    
    if returned_at < borrowed_at
      errors.add(:returned_at, "must be after borrowed date")
    end
  end
end