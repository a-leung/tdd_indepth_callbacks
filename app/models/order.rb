class Order < ApplicationRecord
  before_save :modify_status

  private

  def modify_status
    self.status = 'open'
    self.status = 'pending' if amount && amount > 0
  end
end
