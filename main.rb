class Integer
	def factors
		square_root = self**0.5
		(1..square_root).map {|n| [n, self/n] if self/n*n == self }.compact.flatten.sort
	end

	def pred
		self-1
	end

	def prime?
		self.factors.size == 2 ? true : false
	end

	def halved
		self.to_f/2
	end

	def succ
		self+1
	end
end

require 'sinatra'
require 'json'

get '/' do
	@title = "Continuous Integration (CI) with Continuous Deployment(CD)"
	erb :home
end

get '/:number' do
	content_type :json
	number = params[:number].to_i
	{number: number, factors: number.factors, pred: number.pred, odd: number.odd?, succ: number.succ, even: number.even?, halved: number.halved, prime: number.prime? }.to_json
end