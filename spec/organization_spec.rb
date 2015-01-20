require 'spec_helper'

describe Gittr::Organization do
  subject(:organization){Gittr::Organization.new({"id" => 13542,"name" => "secondrotation","avatar_url" => "https://avatars.githubusercontent.com/u/13542?v=3","room" => nil,"premium" => false})}

  it 'should instantiate from hash' do
    expect(organization).to_not be_nil
    expect(organization.name).to eq('secondrotation')
    expect(organization.premium).to eq(false)
  end
end
