require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'new orders are created with :open status' do
    order = Order.new

    order.save

    expect(order.status).to eq('open')
  end
end
