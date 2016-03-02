
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
		
		puts "\nPlease Enter Your Required Conversion In The Format (From Currency,To Currency ) Without The Braces. eg. US,NPR\n\n
				For Now We Have Selected List of The Conversions Available \n
				NPR -> Nepal\n
				US -> US Dollars\n
				YEN -> Japanese YEN\n
				EURO -> Euro Pound\n
		"

		convertCurrency=gets.chomp.split(/\s*,\s*/)
		
		if convertCurrency.count != 2 
          puts "\nInvalid Input Format\n"
          initialize
        else
          @fromCurrency, @toCurrency= convertCurrency
          puts "#{@fromCurrency.to_s.upcase} To #{@toCurrency.to_s.upcase}"
          askAmount
        end

	end



	def askAmount
		puts "\nPlease Enter The Amount You Want To Convert\n"
    	@amount=gets.chomp 
    	if @amount.to_s==""
    		 puts "\nYou Forgot To Insert The Amount. Please Enter The Amount For The Calculation.\n"
    		 askAmount	
    	else
    		puts "Amount : " + @amount
      		getConversionResult
    	end 
	end




	def getConversionResult
		obj=ExchangeOperation.new(@fromCurrency,@toCurrency,@amount)
		puts "\n\nConversion From \n#{@fromCurrency.to_s.upcase} To #{@toCurrency.to_s.upcase}\nAmount : #{@amount}\nConverted Amount: #{@toCurrency.to_s.upcase} #{obj.getConvertedRate.round(2)}"
		# puts "\n\nWith The Exchange Rate We Have You Will Get #{@fromCurrency}. #{obj.getConvertedRate} Amount When You Are Exchainging The Currency From #{@fromCurrency.to_s.upcase} to #{@toCurrency.to_s.upcase}.\n\n"
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
