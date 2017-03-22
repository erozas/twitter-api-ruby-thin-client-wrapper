require 'spec_helper'
require 'stringio'

describe TwitterAPI do
  it 'has a version number' do
    expect(TwitterAPI::VERSION).not_to be nil
  end
end

# mock
module Kernel
  def open(name, *rest, &block)
    # a dummy of JSON response
    io = StringIO.new('[{}]')
    OpenURI::Meta.init(io)
  end
end

describe TwitterAPI::Client do

  credential = {
    :consumer_key => 'YOUR_CONSUMER_KEY',
    :consumer_secret => 'YOUR_CONSUMER_SECRET',
    :token => 'YOUR_ACCESS_TOKEN',
    :token_secret => 'YOUR_ACCESS_SECRET'
  }
  t = TwitterAPI::Client.new(credential)

  it 'has a method get' do
    resource_url = 'https://api.twitter.com/1.1/statuses/user_timeline.json'
    params = {
      'screen_name' => 'YOUR_SCREEN_NAME',
      'count' => '1'
    }
    expect(t.get(resource_url, params)).not_to be nil
  end

  it 'has a method post' do
    resource_url = 'https://api.twitter.com/1.1/statuses/update.json'
    params = {
      'status' => 'The text of your status update, typically up to 140 characters.'
    }
    expect(t.post(resource_url, params)).not_to be nil
  end

  it 'has a method search_tweets' do
    params = {
      'q' => 'search query',
      'count' => '1'
    }
    expect(t.search_tweets(params)).not_to be nil
  end

  it 'has a method statuses_mentions_timeline' do
    params = {
      'count' => '1'
    }
    expect(t.statuses_mentions_timeline(params)).not_to be nil
  end

  it 'has a method statuses_update' do
    params = {
      'status' => 'The text of your status update, typically up to 140 characters.'
    }
    expect(t.statuses_update(params)).not_to be nil
  end

  it 'has a method statuses_user_timeline' do
    params = {
      'screen_name' => 'YOUR_SCREEN_NAME',
      'count' => '1'
    }
    expect(t.statuses_user_timeline(params)).not_to be nil
  end

end

