
require "yaml"

class ExchangeOperation
	
	attr_accessor :innerCurrencyValue, :outerCurrencyValue , :outputAmount 
	
	def initialize(innerCurrency,outerCurrency,inputAmount)
		@config = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'assets/exchange-rates.yml'))
		@innerCurrency=innerCurrency.upcase
		@outerCurrency=outerCurrency.upcase
		@inputAmount=inputAmount.to_f

		@innerCurrencyValue=innerCurrencyValue
		@outerCurrencyValue=outerCurrencyValue
		@outputAmount=outputAmount

	end

	def getConvertedRate
		@innerCurrencyValue = @config[:"#{@innerCurrency}"][:value].to_f	
		@outerCurrencyValue = @config[:"#{@outerCurrency}"][:value].to_f	

		if @innerCurrencyValue > @outerCurrencyValue
			@outputAmount = @innerCurrencyValue * @inputAmount
		else
			@outputAmount =  @innerCurrencyValue *  @inputAmount / @outerCurrencyValue 
		end
	end


	def checkCurrency

		if @config[:"#{@innerCurrency}"][:value].nil?
			return false
		else
			return true
		end
	end

end



