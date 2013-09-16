require 'spec_helper'
describe MainController do
  describe '#index' do
    it 'renders home page' do
      get :index
      expect(response.code).to eq '200'
    end
  end
  describe '#filter' do
   it 'renders results template' do
      post :filter, params: {city: 'Chicago'}
      response.should be_successful
      response.should render_template('results') 
   end
  end
end
