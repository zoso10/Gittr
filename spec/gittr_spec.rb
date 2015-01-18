require 'spec_helper'

describe Gittr do
  it "should return an enum when no block" do
    expect(Gittr.configure).to be_instance_of(Enumerator)
  end

  it "should set token with block" do
    Gittr.configure{ |config| config.token = 'asdf' }
    expect(Gittr.token).to eq('asdf')
  end
end
