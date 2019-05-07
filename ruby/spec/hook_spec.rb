require 'awesome_print'

RSpec.describe 'example metadata' do
  it 'contains meany interesting things' do |example|
    ap example.metadata
  end
end

RSpec.describe 'before and after hooks' do
  before(:each) do
    puts 'first before each'
  end

  after(:each) do
    puts 'first after each'
  end

  before(:all) do
    puts 'outer before all'
  end

  ## notice that this wraps
  ## any before/after hooks
  around(:each) do |example|
    puts 'first around each - before'
    example.run
    puts 'first around each - after'
  end

  context 'some nested context' do
    it 'does some testing' do
      puts 'first test'
    end

    it 'does some more testing' do
      puts 'second test'
    end

    before(:all) do
      puts 'nested before all'
    end
  end

  ## notice that this runs
  ## in order, even though
  ## it is defined much later
  around(:each) do |example|
    puts 'second around each - before'
    example.run
    puts 'second around each - after'
  end

  ## notice that these run
  ## in order, even though
  ## they are defined much later
  before(:each) do
    puts 'second before each'
  end

  after(:each) do
    puts 'second after each'
  end
end

