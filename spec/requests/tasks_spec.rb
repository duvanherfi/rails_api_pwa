require 'swagger_helper'

RSpec.describe 'tasks', type: :request do

  path '/projects/{project_id}/tasks' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'

    get('list tasks') do
      consumes 'application/json'
      response(200, 'successful') do
        let(:project_id) { '123' }

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

    post('create task') do
      consumes 'application/json'
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string} ,
          completed: { type: :string},
          add_task_dialog: { type: :boolean}
        },
        required: ['name', 'description', 'completed', 'add_task_dialog']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:task) {
          {
            name: "task 1",
            description: "description",
            completed: false,
            add_task_dialog: false
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

  path '/projects/{project_id}/tasks/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'project_id', in: :path, type: :string, description: 'project_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show task') do
      consumes 'application/json'
      response(200, 'successful') do
        let(:project_id) { '123' }
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

    patch('update task') do
      consumes 'application/json'
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string} ,
          completed: { type: :string},
          add_task_dialog: { type: :boolean}
        },
        required: ['name', 'description', 'completed', 'add_task_dialog']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:id) { '123' }
        let(:task) {
          {
            name: "task 1",
            description: "description",
            completed: false,
            add_task_dialog: false
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

    put('update task') do
      consumes 'application/json'
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string} ,
          completed: { type: :string},
          add_task_dialog: { type: :boolean}
        },
        required: ['name', 'description', 'completed', 'add_task_dialog']
      }
      response(200, 'successful') do
        let(:project_id) { '123' }
        let(:id) { '123' }
        let(:task) {
          {
            name: "task 1",
            description: "description",
            completed: false,
            add_task_dialog: false
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

    delete('delete task') do
      consumes 'application/json'
      response(200, 'successful') do
        let(:project_id) { '123' }
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
