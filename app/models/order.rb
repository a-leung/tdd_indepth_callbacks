class Order < ApplicationRecord
  before_save :modify_status

  private

  def modify_status
    self.status = 'open'
  end
end
