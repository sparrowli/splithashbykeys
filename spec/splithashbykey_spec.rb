# require 'rspec'
require_relative '../lib/splithash'

describe Splithash, '#split_hash_by_keys' do
  before() do
    @splithash = Splithash.new
  end

  it 'should return two sub hash according to input hash divided by one key' do
    h = { :a=>1, :b=>2, :c=>3}
    key = :b

    left, right = @splithash.split_hash_by_key(h, key)
    expect(left).to eq({:a=>1})
    expect(right).to eq({:b=>2, :c=>3})
  end


  it 'should return hash array by the keys' do
    hash = { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }
    key1 = :c

    hashArray = @splithash.split_hash_by_keys(hash, key1)
    expect(hashArray).to eq([ {:a=>1, :b=>2}, {:c=>3, :d=>4, :e=>5, :f=>6} ])
  end

  it 'should return hash array by the keys' do
    hash = { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }
    key1 = :c
    key2 = :e

    hashArray = @splithash.split_hash_by_keys(hash, key1, key2)
    expect(hashArray).to eq([ {:a=>1, :b=>2}, {:c=>3, :d=>4}, {:e=>5, :f=>6} ])
  end

  it 'should return the array of original hash when key is first' do
    hash = {:a => 1, :b => 2}
    key = :a

    hashArray = @splithash.split_hash_by_keys(hash, key)
    expect(hashArray).to eq([{:a => 1, :b => 2} ])
  end

  it 'should raise exception when key is invalid in hash' do
    hash = { :a=>1, :b=>2 }
    key = 'b'

    lambda { @splithash.split_hash_by_keys(hash, key) }.should raise_error(ArgumentError, 'Key is invalid in Hash')
  end


end