require 'spec_helper'

describe Gittr::HashConstructor do
  # Are there better ways of testing modules?
  class Klass
    include Gittr::HashConstructor
    attr_accessor :foo_bar, :baz
  end

  it 'sets variables from hash' do
    vars = {fooBar: 'asdf', Baz: 'fdsa'}
    klass = Klass.new(vars)

    expect(klass.foo_bar).to eq('asdf')
    expect(klass.baz).to eq('fdsa')
  end

  it 'turns string to snake case' do
    expect(Klass.new.to_snake_case('FooBar')).to eq('foo_bar')
    expect(Klass.new.to_snake_case('foo_bar')).to eq('foo_bar')
    expect(Klass.new.to_snake_case('fooBar')).to eq('foo_bar')
  end
end
