require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'new orders are created with :open status' do
    order = Order.new

    order.save

    expect(order.status).to eq('open')
  end

  it 'open orders that have an amount should become pending' do
    order = Order.create
    order.amount = 100.0

    order.save

    expect(order.status).to eq('pending')
  end
end
