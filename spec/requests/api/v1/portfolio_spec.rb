# frozen_string_literal: true

require 'swagger_helper'

# rubocop:disable  Metrics/BlockLength
RSpec.describe 'Api::V1::PortfolioController', type: :request do
  path '/api/v1/portfolio' do
    get 'Retrieves all portfolios' do
      tags 'Portfolios'
      produces 'application/json'

      response '200', 'Portfolios found' do
      end
    end
  end

  path '/api/v1/portfolio/{id}' do
    parameter name: :id, in: :path, type: :integer, description: 'Portfolio ID'

    get 'Retrieves a portfolio' do
      tags 'Portfolios'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Portfolio found' do
        schema type: :object,
               properties: {
                 id: { type: :integer }
               },
               required: ['id']
      end

      response '404', 'Portfolio not found' do
        run_test!
      end
    end
  end
  path '/api/v1/holdings/{id}' do
    parameter name: :id, in: :path, type: :integer, description: 'Portfolio ID'

    get 'Retrieves portfolio holdings' do
      tags 'Portfolios'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Holdings found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   stock_name: { type: :string },
                   stock_count: { type: :integer },
                   average_price: { type: :number }
                 },
                 required: %w[stock_name stock_count average_price]
               }
      end

      response '404', 'Portfolio or stocks not found' do
        run_test!
      end
    end
  end
  path '/api/v1/returns/{id}' do
    let(:portfolio) { create(:portfolio) }

    get 'Retrieves returns for a portfolio' do
      tags 'Portfolios'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Returns found' do
        schema type: :object,
               properties: {
                 example: { type: :string }
               }

        run_test! do
          allow(PortfolioService).to receive(:returns).and_return({ example: 'data' })

          expect(response).to have_http_status(:success)
          expect(response.content_type).to eq('application/json')
        end
      end
    end
  end
end
# rubocop:enable  Metrics/BlockLength
