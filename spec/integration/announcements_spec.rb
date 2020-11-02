require 'swagger_helper'

describe 'Announcements API' do

  path '/api/v1/announcements' do

    post 'Creates a user' do
      tags 'Announcements'
      consumes 'application/json', 'application/xml'

      parameter name: :announcement, in: :body, schema: {
        type: :object,
        properties: {
          message: { type: :string },
          username: { type: :string },
          date: { type: :string },
          role: { type: :string }
        },
        required: [ 'username', 'date', 'message' ]
      }

      response '201', 'announcement created' do
        let(:announcement) { { username: 'admin', password: '123456', date: Time.zone.now, message: 'test' } }

        run_test!
      end

      response '422', 'invalid request' do
        let(:announcement) { { username: 'admin' } }

        run_test!
      end
    end
  end

  path '/api/v1/announcements/{id}' do

    get 'Retrieves a user' do
      tags 'Announcements'
      produces 'application/json', 'application/xml'
      parameter username: :id, :in => :path, :type => :string

      response '200', 'Username found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            message: { type: :string },
            username: { type: :string },
            date: { type: :string },
            role: { type: :string }
          },
          required: [ 'id', 'username', 'date', 'message' ]

        let(:id) {
          Announcement.create(
            username: 'user1@cargo.vn',
            date: Time.zone.now,
            message: 'test'
          ).id 
        }

        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end