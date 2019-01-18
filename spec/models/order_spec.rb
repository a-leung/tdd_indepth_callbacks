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

  it 'any orders with save failures are marked :failed' do
    order = Order.create
    allow_any_instance_of(Order).to receive(:create_or_update).and_return(false)
    order.amount = 100.00

    order.save

    expect(order.reload.status).to eq('failed')
  end
end
