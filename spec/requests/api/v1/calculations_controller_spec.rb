require 'rails_helper'

RSpec.describe 'Api::V1::CalculationsController', type: :request do
  describe 'POST /api/v1/calculations' do
    let(:calculation)                  { {calculation: { first_value: 7, second_value: 3 }, commit: :sum} }
    let(:negative_calculation)         {{ calculation: { first_value: -7, second_value: 3 }, commit: :sum} }
    let(:greater_than_100_calculation) { {calculation: { first_value: 7, second_value: 103 }, commit: :sum} }

    context 'sucess' do
      before { post '/api/v1/calculations', params: calculation }

      it 'returns HTTP status 200' do
        expect(response).to have_http_status 200
      end

      it 'Create a new Calculation' do
        body = JSON.parse(response.body)
        expect(body['result']).to eq(10)
        expect(Calculation.last).to have_attributes(calculation[:calculation])
      end
    end

    context 'fail' do
      context 'empty data' do
        before { post '/api/v1/calculations' }

        it 'returns HTTP status 422' do
          expect(response).to have_http_status 422
        end

        it 'error message' do
          body = JSON.parse(response.body)
          expect(body['errors']).to eq('Error, invalid data provided.')
        end
      end

      context 'negative values' do
        before { post '/api/v1/calculations', params: negative_calculation }

        it 'returns HTTP status 422' do
          expect(response).to have_http_status 422
        end

        it 'error message' do
          body = JSON.parse(response.body)
          expect(body['errors']).to eq('first_value' => ['must be greater than or equal to 0'])
        end
      end

      context 'negative values' do
        before { post '/api/v1/calculations', params: greater_than_100_calculation }

        it 'returns HTTP status 422' do
          expect(response).to have_http_status 422
        end

        it 'error message' do
          body = JSON.parse(response.body)
          expect(body['errors']).to eq('second_value' => ['must be less than or equal to 100'])
        end
      end
    end
  end
end
