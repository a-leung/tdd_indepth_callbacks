class Order < ApplicationRecord
  before_save :modify_status

  private

  def modify_status
    self.status = 'open'
    self.status = 'pending' if attribute_changed?(:amount)
    self.status = 'received' if amount == received
  end
end
