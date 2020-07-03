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

  it 'existing orders have received == amount, its status is received' do
    order = Order.create(:amount => 100)
    order.received = 100

    order.save

    expect(order.status).to eq('received')
  end

  it 'also handles potential irrational numbers' do
    order = Order.create(:amount => 0.33)
    order.received = 0.33

    order.save

    expect(order.status).to eq('received')
  end
end
