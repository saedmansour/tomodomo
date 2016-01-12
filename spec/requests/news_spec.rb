describe "News JSON api" do
  it 'shows a list of the latest news' do
    FactoryGirl.create_list(:news, 10)

    get '/news'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json['news'].length).to eq(10)
  end
end