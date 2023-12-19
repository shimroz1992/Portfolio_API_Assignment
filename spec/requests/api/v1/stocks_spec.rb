# frozen_string_literal: true

# spec/requests/api/v1/stocks_spec.rb

require 'swagger_helper'

# spec/requests/api/v1/stocks_spec.rb

# rubocop:disable  Metrics/BlockLength
RSpec.describe 'Api::V1::Stocks', type: :request do
  path '/api/v1/stocks' do
    get 'Retrieves all stocks' do
      tags 'Stocks'
      produces 'application/json'

      response '200', 'stocks found' do
        run_test!
      end
    end

    post 'Creates a stock' do
      tags 'Stocks'
      consumes 'application/json'
      parameter name: :stock, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'stock created' do
        let(:stock) { { name: 'New Stock' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:stock) { { name: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/stocks/{id}' do
    parameter name: :id, in: :path, type: :integer

    put 'Updates a stock' do
      tags 'Stocks'
      consumes 'application/json'
      parameter name: :stock, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        }
      }

      response '200', 'stock updated' do
        let(:id) { create(:stock).id }
        let(:stock) { { name: 'Updated Name' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { create(:stock).id }
        let(:stock) { { name: '' } }
        run_test!
      end

      response '404', 'stock not found' do
        let(:id) { 'invalid' }
        let(:stock) { { name: 'Updated Name' } }
        run_test!
      end
    end

    delete 'Deletes a stock' do
      tags 'Stocks'

      response '204', 'stock deleted' do
        let(:id) { create(:stock).id }
        run_test!
      end

      response '404', 'stock not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
# rubocop:enable  Metrics/BlockLength
