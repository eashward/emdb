# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesController do
  describe '#index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end

    describe '#new' do
      it 'renders new template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    describe '#create' do
      it 'creates a movie' do
        category = create(:category)
        post :create, params: { movie: { title: Faker::Name.name,
                                         category_id: category.id,
                                         description: Faker::Name.name,
                                         rating: 4}}, as: :json
        expect(response.content_type).to eq "application/json"
      end
    end
  end
end
