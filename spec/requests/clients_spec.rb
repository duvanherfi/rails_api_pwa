require 'swagger_helper'

RSpec.describe 'clients', type: :request do

  path '/clients' do

    get('list clients') do
      consumes 'application/json'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create client') do
      consumes 'application/json'
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          active: { type: :boolean },
          identification: { type: :string },
          type_id: { type: :string }
        },
        required: ['name', 'email', 'phone', 'active', 'identification', 'type_id']
      }
      response(200, 'successful') do
        let(:client) {
          {
            name: "Client 1",
            email: "client1@gmail.com",
            phone: "1234567890",
            identification: "1151961999",
            type_id: "Id type"
          }
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/clients/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show client') do
      consumes 'application/json'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update client') do
      consumes 'application/json'
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          active: { type: :boolean },
          identification: { type: :string },
          type_id: { type: :string }
        },
        required: ['name', 'email', 'phone', 'active', 'identification', 'type_id']
      }
      response(200, 'successful') do
        let(:id) { '123' }
        let(:client) {
          {
            name: "Client 1",
            email: "client1@gmail.com",
            phone: "1234567890",
            identification: "1151961999",
            type_id: "Id type"
          }
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update client') do
      consumes 'application/json'
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          active: { type: :boolean },
          identification: { type: :string },
          type_id: { type: :string }
        },
        required: ['name', 'email', 'phone', 'active', 'identification', 'type_id']
      }
      response(200, 'successful') do
        let(:id) { '123' }
        let(:client) {
          {
            name: "Client 1",
            email: "client1@gmail.com",
            phone: "1234567890",
            identification: "1151961999",
            type_id: "Id type"
          }
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete client') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
