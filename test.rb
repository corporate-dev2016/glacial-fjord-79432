ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'main.rb'

include Rack::Test::Methods

def app 
	Sinatra::Application
end

describe "Main" do 
	it "should return the factors of 3" do
		3.factors.must_equal [1,3]
	end

	it "should return half of 8" do
		8.halved.must_equal 4
	end

	it "should say that 7 is prime" do
		assert 7.prime?
	end

	it "should return the predeccesor of 12" do
		assert 12.pred.must_equal 11
	end

	it "should say that 4 is not prime" do
		refute 4.prime?
	end

	it "should return the successor of 20" do
		assert 20.succ.must_equal 21
	end

	it "should return json" do
		get '/3'
		last_response.headers['Content-Type'].must_equal 'application/json'
	end
	
	it "should return the correct info about 3 as json" do
		get '/3'
		three_info = { number: 3, factors: 3.factors, pred: 3.pred, odd: 3.odd?, succ: 3.succ, even: 3.even?, halved: 3.halved, prime: 3.prime?  }
		three_info.to_json.must_equal last_response.body
	end
end