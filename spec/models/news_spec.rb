require 'rails_helper'

# TODO: this elasticsearch test isn't good enough
# based on: https://blog.pivotal.io/labs/labs/rspec-elasticsearchruby-elasticsearchmodel

describe News, elasticsearch: true do
  before do
    News.__elasticsearch__.create_index! index: "news"
    News.create(title: "hello", content: "content")
    News.import

    # Sleeping here to allow Elasticsearch test cluster
    # to index the objects we created
    sleep 1
  end

  after do
    News.__elasticsearch__.client.indices.delete index: News.index_name  
  end

  describe "News search existing data in database" do
    it "returns results of length 1 this exists in database" do
      result = News.search("hello")
      expect(result.size).to eq(1)
    end
  end
end