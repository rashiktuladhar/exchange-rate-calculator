
require_relative 'exchange-operation.rb';


class UserInterface
	
	attr_accessor :fromCurrency , :toCurrency , :amount
	
	def initialize
		@fromCurrency=""
		@toCurrency=""
		@amount=""
		askCurrencyFormats
	end


	def askCurrencyFormats
		
		puts "\nPlease Enter The Your Currency Conversion From And To In The Format (NRS,INR)\n"

		convertCurrency=gets.chomp.split(/\s*,\s*/)
		
		if convertCurrency.count > 2
          puts "\nInvalid Input Format\n"
          initialize
        else
          @fromCurrency, @toCurrency= convertCurrency
          askAmount
        end

	end


	def askAmount
		
		puts "\nPlease Enter The Amount You Want To Convert\n"
    	@amount=gets.chomp  
      	getConversionResult
	end




	def getConversionResult
		obj=ExchangeOperation.new(@fromCurrency,@toCurrency,@amount)
		puts "\n#{obj.getConvertedRate}\n\n"
		confirmationMsg
	end




	def confirmationMsg

	    puts "\nDo You Wish To Continue The Exchange Rate Calculation? If Yes Please Press Y Else Just Press Any Other Key\n"
	    againCalc=gets.chomp.upcase
	    if againCalc == "Y"
	      initialize
	    else
	      puts "\nThank You For Using The Exchange Rate Calculation Program.\n"
	    end

	end


end


UserInterface.new
