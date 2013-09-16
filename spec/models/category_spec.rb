require 'spec_helper'
describe Category do
  context 'its relations' do
    it {should have_many(:tags)}
    it {should have_many(:articles).through(:tags)}
  end
end
