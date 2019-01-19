class Order < ApplicationRecord
  before_save :modify_status
  after_rollback :mark_failure

  private

  def modify_status
    self.status = 'open'
    self.status = 'pending' if attribute_changed?(:amount)
    self.status = 'received' if !amount.nil? && (amount == received)
  end

  def mark_failure
    ActionMailer::Base.mail(from: 'from@domain.com',
                            to: 'to@domain.com',
                            subject: 'System Error',
                            body: "Error with Save: \n Details: #{details}."
                           ).deliver

    self.update_column(:status, 'failed')
  end
end
