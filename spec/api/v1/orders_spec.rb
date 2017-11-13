require 'rails_helper'

describe 'Orders API' do
  describe 'GET /orders' do 
    context 'unauthorized' do 
      it 'return 401 status with no access_token' do 
        get '/api/v1/orders', params: { format: :json }
        expect(response.status).to eq 401
      end

      it 'return 401 status if access_token is invalid' do 
        get '/api/v1/orders', params: { format: :json, access_token: '456745673456' }
        expect(response.status).to eq 401
      end
    end

    context 'authorized' do 
      let(:user) { create(:user) }
      let(:access_token) { create(:access_token) }

      it 'returns 200 status' do 
        get '/api/v1/orders', params: { format: :json, access_token: access_token.token }
        expect(response).to be_success
      end

      it 'contains order' do 
        first_type = MealType.create!(kind: 1)
        main_type = MealType.create!(kind: 2)
        drink_type = MealType.create!(kind: 3)

        first = Menu.create!(name: 'soup', price: 4, meal_type: first_type)
        main = Menu.create!(name: 'meat', price: 2, meal_type: main_type)
        drink = Menu.create!(name: 'juice', price: 5, meal_type: drink_type)

        Order.create!(user: user, first_id: first.id, main_id: main.id, drink_id: drink.id)

        get '/api/v1/orders', params: { format: :json, access_token: access_token.token }

        expect(response.body).to be_json_eql(first.name.to_json).at_path('0/first/name')
        expect(response.body).to be_json_eql(main.name.to_json).at_path('0/main/name')
        expect(response.body).to be_json_eql(drink.name.to_json).at_path('0/drink/name')
        expect(response.body).to be_json_eql(user.username.to_json).at_path('0/user/username')
      end
    end
  end
end