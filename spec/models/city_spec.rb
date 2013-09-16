require 'spec_helper'
describe City do
  context 'database relations' do
    it {should have_many(:itineraries)}
    it {should have_many(:articles).through(:itineraries)}
  end
end
