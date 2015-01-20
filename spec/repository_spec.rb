require 'spec_helper'

describe Gittr::Repository do

  subject(:repository){Gittr::Repository.new({"id"=>7411076, "name"=>"thoughtbot/hound", "description"=>"Review your Ruby code for style guide violations with a trusty hound.", "uri"=>"thoughtbot/hound", "private"=>false, "exists"=>false, "avatar_url"=>"https://avatars.githubusercontent.com/u/6183?v=3"})}

  it 'should instantiate from hash' do
    expect(repository).to_not be_nil
    expect(repository.name).to eq('thoughtbot/hound')
    expect(repository.uri).to eq('thoughtbot/hound')
    expect(repository.private).to eq(false)
  end
end
