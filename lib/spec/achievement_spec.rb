# http://bfts.rubyforge.org/minitest/MiniTest/Expectations.html
require 'minitest/autorun'

require_relative '../achievement/achievements'

include Achievements

def getAchievement(data, path, from, to)
  Achievement.new(getInfo(data, path, from, to))
end

def getInfo(data, path, from, to)
  ValueInfo.new(data, path, from, to)
end

describe 'Achievement object' do
  it 'can be initialized' do
    achievement = Achievement.new(nil).wont_be_nil
  end

  it 'can take ValueInfo as parameter for initialization' do
    info = ValueInfo.new
    achievement = Achievement.new(info).wont_be_nil
  end

  it 'returns zero if target value is below range' do
    getAchievement({ val: 50 }, 'val', 100, 200).getPercentage.must_equal 0
  end

  it 'returns 100 if target value is above range' do
    getAchievement({ val: 250 }, 'val', 100, 200).getPercentage.must_equal 100
  end

  it 'data can be made of symbols' do
    data = { a: { b: { c: 50 } } }
    getAchievement(data, 'a/b/c', 0, 100).getPercentage.must_equal 50
  end

  it 'data can be made of literal symbols' do
    data = { :"a a" => { :"b b" => { :"cc" => 50 } } }
    getAchievement(data, 'a a/b b/cc', 0, 100).getPercentage.must_equal 50
  end

  it 'data can be made of strings' do
    data = { "a" => { "b" => { "c" => 50 } } }
    getAchievement(data, 'a/b/c', 0, 100).getPercentage.must_equal 50
  end

  it 'data can be made of strings with spaces' do
    data = { "a a" => { "b b b" => { " c " => 50 } } }
    getAchievement(data, 'a a/b b b/ c ', 0, 100).getPercentage.must_equal 50
  end

  it 'data can be made of symbols and strings' do
    data = { "a a" => { b: { " c " => 50 } } }
    getAchievement(data, 'a a/b/ c ', 0, 100).getPercentage.must_equal 50
  end

  it 'returns 99 if a very big number is close to maximum' do
    getAchievement({ val: 9999999 }, 'val', 0, 10000000).getPercentage.must_equal 99
  end

  it 'returns 1 if a very big number is close to minimum but not rangeFrom' do
    getAchievement({ val: 1 }, 'val', 0, 10000000).getPercentage.must_equal 1
  end

  it 'returns 0 if the target value is exact rangeFrom' do
    getAchievement({ val: 0 }, 'val', 0, 100).getPercentage.must_equal 0
  end

  it 'returns 100 if the target value is exact rangeTo' do
    getAchievement({ val: 100 }, 'val', 0, 100).getPercentage.must_equal 100
  end

  it 'can deal with float values in the data' do
    getAchievement({ val: 50.0 }, 'val', 0, 100).getPercentage.must_equal 50
  end

  it 'can deal with float values in the rangeFrom' do
    getAchievement({ val: 50 }, 'val', 0.0, 100).getPercentage.must_equal 50
  end

  it 'can deal with float values in the rangeTo' do
    getAchievement({ val: 50 }, 'val', 0, 100.0).getPercentage.must_equal 50
  end

  it 'can deal with string value in the target value' do
    getAchievement({ val: "50" }, 'val', 0, 100.0).getPercentage.must_equal 50
  end

  it 'can deal with an invalid string value in the target value' do
    getAchievement({ val: "abc" }, 'val', 0, 100.0).getPercentage.must_equal 0
  end
end