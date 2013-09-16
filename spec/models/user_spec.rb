require 'spec_helper'
describe User do
  context 'database relations' do
    it {should have_many(:articles)}
  end
end
