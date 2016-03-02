
require "yaml"

class ExchangeOperation
	
	attr_accessor :innerCurrencyValue, :outerCurrencyValue , :outputAmount
	
	def initialize(innerCurrency,outerCurrency,inputAmount)
	
		@config = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'assets/exchange-rates.yml'))
		@innerCurrency=innerCurrency
		@outerCurrency=outerCurrency
		@inputAmount=inputAmount

		@innerCurrencyValue=innerCurrencyValue
		@outerCurrencyValue=outerCurrencyValue
		@outputAmount=outputAmount

	end

	def getConvertedRate
		
		@innerCurrencyValue = @config[:"#{@innerCurrency}"][:value].to_f	
		@outerCurrencyValue = @config[:"#{@outerCurrency}"][:value].to_f	

		if @innerCurrencyValue > @outerCurrencyValue
			@outputAmount = @innerCurrencyValue * @outerCurrencyValue * @amount
		else
			@outputAmount = ( @innerCurrencyValue / @outerCurrencyValue ) * @amount
		end

		# @outputAmount

	end
end



