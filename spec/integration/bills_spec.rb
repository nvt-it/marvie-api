require 'swagger_helper'

describe 'Bills API' do

  path '/api/v1/bills' do

    post 'Creates a bill' do
      tags 'Bills'
      consumes 'application/json', 'application/xml'
      parameter name: :bill, in: :body, schema: {
        type: :object,
        properties: {
          customer_id: { type: :integer },
          product_id: { type: :integer },
          product_name: { type: :string },
          link:{ type: :string },
          phone:{ type: :string },
          account_ya: { type: :string },
          date_order: { type: :string },
          username: { type: :string },
          full_name:{ type: :string },
          amount: { type: :float },
          price: { type: :float },
          price_transport_jp: { type: :float },
          tax_jp: { type: :float },
          rate: { type: :float },
          price_buy: { type: :float },
          weight: { type: :float },
          price_transport_vn: { type: :float },
          status: { type: :string }, # (waiting, confirmed, prepared, transported, checked, informed, ready_delivery, success) 
          sub_fee: { type: :float },
          number_tracking: { type: :integer },
          term: { type: :integer },
          delivery_time:{ type: :string },
          paid_money: { type: :float },
          type_paid: { type: :string } # (banking, ship_cod)
        },
        required: [
          'customer_id', 'product_id', 'product_name', 'account_ya', 'date_order', 'username', 'amount',
          'price', 'price_transport_jp', 'tax_jp', 'price_buy', 'weight', 'price_transport_vn', 'status', 'sub_fee', 'paid_money', 'type_paid'
        ]
      }

      response '201', 'user created' do
        let(:user) { { name: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/bills/{id}' do

    get 'Retrieves a user' do
      tags 'Bills'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            customer_id: { type: :integer },
            product_id: { type: :integer },
            product_name: { type: :string },
            link:{ type: :string },
            phone:{ type: :string },
            account_ya: { type: :string },
            date_order: { type: :string },
            username: { type: :string },
            full_name:{ type: :string },
            amount: { type: :float },
            price: { type: :float },
            price_transport_jp: { type: :float },
            tax_jp: { type: :float },
            rate: { type: :float },
            price_buy: { type: :float },
            weight: { type: :float },
            price_transport_vn: { type: :float },
            status: { type: :string }, # (waiting, confirmed, prepared, transported, checked, informed, ready_delivery, success) 
            sub_fee: { type: :float },
            number_tracking: { type: :integer },
            term: { type: :integer },
            delivery_time:{ type: :string },
            paid_money: { type: :float },
            type_paid: { type: :string } # (banking, ship_cod)
          },
          required: [
          'id', 'customer_id', 'product_id', 'product_name', 'account_ya', 'date_order', 'username', 'amount',
          'price', 'price_transport_jp', 'tax_jp', 'price_buy', 'weight', 'price_transport_vn', 'status', 'sub_fee', 'paid_money', 'type_paid'
        ]

        let(:id) {
          Bill.create(
            name: 'User 1',
            username: 'user1@cargo.vn',
            password: '123456'
          ).id 
        }

        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Update a bill' do
      tags 'Bills'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      parameter name: :bill, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          customer_id: { type: :integer },
          product_id: { type: :integer },
          product_name: { type: :string },
          link:{ type: :string },
          phone:{ type: :string },
          account_ya: { type: :string },
          date_order: { type: :string },
          username: { type: :string },
          full_name:{ type: :string },
          amount: { type: :float },
          price: { type: :float },
          price_transport_jp: { type: :float },
          tax_jp: { type: :float },
          rate: { type: :float },
          price_buy: { type: :float },
          weight: { type: :float },
          price_transport_vn: { type: :float },
          status: { type: :string }, # (waiting, confirmed, prepared, transported, checked, informed, ready_delivery, success) 
          sub_fee: { type: :float },
          number_tracking: { type: :integer },
          term: { type: :integer },
          delivery_time:{ type: :string },
          paid_money: { type: :float },
          type_paid: { type: :string } # (banking, ship_cod)
        }
      }

      response '200', 'bill updated' do
        let(:bill) { { username: 'Dodo', status: 'waiting' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:bill) { { username: 'foo' } }
        run_test!
      end
    end
  end
end