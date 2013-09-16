require 'spec_helper'
describe Article do
  context 'for database relationships' do
    it { should have_many(:itineraries) }
    it { should have_many(:cities).through(:itineraries) }
    it {should have_many(:tags) }
    it { should have_many(:categories).through(:tags)}
    it { should belong_to(:user)}
  end
  describe '.filter' do
    before(:each) do
      @user1 = User.create!(username: "user1", status: 1)
      @user2 = User.create!(username: "user2", status: 0)
      @article1 = Article.create!(user_id: @user2.id,title: "blank")
      @article2 = Article.create!(user_id: @user2.id, title: "article")
      @article3 = Article.create!(user_id: @user1.id,title: "blank")
      @city = City.create!(name: 'city')
      Itinerary.create!(article_id: @article2.id, city_id: @city.id)
      Itinerary.create!(article_id: @article1.id, city_id: @city.id)
      @category = Category.create!(name:'name')
      Tag.create(article_id: @article2.id, category_id: @category.id)
      @city2 = City.create!(name: 'city2')
      Itinerary.create!(article_id: @article3.id, city_id: @city2.id)
      @category2 = Category.create!(name:'name2')
      Tag.create(article_id: @article3.id, category_id: @category2.id)
    end
    it 'filters by user' do
      Article.filter({writer: "user1"}).sort.should == [@article3].sort
      Article.filter({writer: "user2"}).sort.should == [@article2,@article1].sort
    end
    
    it 'filters by writer_type' do
      Article.filter({writer_type: 1}).sort.should == [@article3].sort
      Article.filter({writer_type: 0}).sort.should == [@article2,@article1].sort
    end

    it 'filters by city' do
      expect(Article.filter({city: "city"}).sort).to eq([@article2,@article1].sort)
      expect(Article.filter({city: "city2"})).to eq([@article3])
    end

    it 'filters by categories' do
      expect(Article.filter({category: 'name'})).to eq([@article2])
      expect(Article.filter({category: 'name2'})).to eq([@article3])
    end

    it 'filters by city and writer_type' do
      expect(Article.filter({writer_type: 1, city:'city2'}).sort).to eq([@article3])
    end
    it 'filters by category and writer_type' do
      expect(Article.filter({writer_type: 1, category: 'name2'}).sort).to eq([@article3])
    end
    it 'filters by city and category' do
      expect(Article.filter({category: 'name', city:'city'}).sort).to eq([@article2])
    end

  end

end
