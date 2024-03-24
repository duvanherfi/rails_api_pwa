require 'swagger_helper'

RSpec.describe 'audios', type: :request do

  path '/projects/{project_id}/tasks/{task_id}/audios/{id}/file' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'
    parameter name: 'task_id', in: :path, type: :string, description: 'task_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('file audio') do
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

  path '/projects/{project_id}/tasks/{task_id}/audios' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'
    parameter name: 'task_id', in: :path, type: :string, description: 'task_id'

    get('list audios') do
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

    post('create audio') do
      consumes 'application/json'
      parameter name: :audio, in: :body, schema: {
        type: :object,
        properties: {
          file: { type: :string }
        },
        required: ['file']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
        let(:audio) { {file: "path/file"} }

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

  path '/projects/{project_id}/tasks/{task_id}/audios/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'
    parameter name: 'task_id', in: :path, type: :string, description: 'task_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show audio') do
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

    patch('update audio') do
      consumes 'application/json'
      parameter name: :audio, in: :body, schema: {
        type: :object,
        properties: {
          file: { type: :string }
        },
        required: ['file']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
        let(:id) { '123' }
        let(:audio) { {file: "path/file"} }

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

    put('update audio') do
      consumes 'application/json'
      parameter name: :audio, in: :body, schema: {
        type: :object,
        properties: {
          file: { type: :string }
        },
        required: ['file']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task_id) { '123' }
        let(:id) { '123' }
        let(:audio) { {file: "path/file"} }

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

    delete('delete audio') do
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
