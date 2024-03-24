require 'swagger_helper'

RSpec.describe 'images', type: :request do

  path '/projects/{project_id}/tasks/{task_id}/images/{id}/file' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'
    parameter name: 'task_id', in: :path, type: :string, description: 'task_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('file image') do
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
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

  path '/projects/{project_id}/tasks/{task_id}/images' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'
    parameter name: 'task_id', in: :path, type: :string, description: 'task_id'

    get('list images') do
      consumes 'application/json'
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }

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

    post('create image') do
      consumes 'application/json'
      parameter name: :image, in: :body, schema: {
        type: :object,
        properties: {
          file: { type: :string }
        },
        required: ['name']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
        let(:image) { {file: "url_image"} }

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

  path '/projects/{project_id}/tasks/{task_id}/images/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'
    parameter name: 'task_id', in: :path, type: :string, description: 'task_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show image') do
      consumes 'application/json'
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
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

    patch('update image') do
      consumes 'application/json'
      parameter name: :image, in: :body, schema: {
        type: :object,
        properties: {
          file: { type: :string }
        },
        required: ['name']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
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

    put('update image') do
      consumes 'application/json'
      parameter name: :image, in: :body, schema: {
        type: :object,
        properties: {
          file: { type: :string }
        },
        required: ['name']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
        let(:id) { '123' }
        let(:image) { {file: "path file"} }

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

    delete('delete image') do
      consumes 'application/json'
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
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
