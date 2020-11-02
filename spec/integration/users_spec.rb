require 'swagger_helper'

describe 'Users API' do

  path '/api/v1/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
          status: { type: :string },
          full_name: { type: :string },
          password_digest: { type: :string },
          phone: { type: :string },
          email: { type: :string },
          dob: { type: :string },
          salary: { type: :string },
          bonus: { type: :string },
          identify: { type: :string },
          role: { type: :string },
          login_time: { type: :string },
          permission: { type: :string },
        },
        required: [ 'username', 'password' ]
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

  path '/api/v1/users/{id}' do

    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            full_name: { type: :string },
            username: { type: :string },
            password: { type: :string },
            status: { type: :string },
            full_name: { type: :string },
            password_digest: { type: :string },
            phone: { type: :string },
            email: { type: :string },
            dib: { type: :string },
            salary: { type: :string },
            bonus: { type: :string },
            identify: { type: :string },
            role: { type: :string },
            login_time: { type: :string },
            permission: { type: :string },
          },
          required: [ 'id' ]

        let(:id) {
          User.create(
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

    put 'Update a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          username: { type: :string },
          password: { type: :string },
          status: { type: :string },
          full_name: { type: :string },
          password_digest: { type: :string },
          phone: { type: :string },
          email: { type: :string },
          dob: { type: :string },
          salary: { type: :string },
          bonus: { type: :string },
          identify: { type: :string },
          role: { type: :string },
          login_time: { type: :string },
          permission: { type: :string },
        },
        required: [ 'id' ]
      }

      response '200', 'user updated' do
        let(:user) { { name: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end

    delete 'Destroy a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer
        
      response '200', 'user deleted' do
        let(:user) { { name: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end
end