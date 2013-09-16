require 'spec_helper'
describe Tag do
  context 'database relations' do
    it {should belong_to(:category)}
    it {should belong_to(:article)}
  end
end
