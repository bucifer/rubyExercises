@lowerAlphabet = ("a".."z").to_a
@upperAlphabet = ("A".."Z").to_a
@punctuation = ("!?.,@#$&*'\"").split(//)

def jumpOne(str,jump)
#this helper function will decode ONE STRING to numbers, jump the numbers, and then translate that word
	translated_str = ""
	str.split(//).each do |char|
			if @lowerAlphabet.include? (char)
				jumped_index = @lowerAlphabet.index(char) + jump
				translated_str << @lowerAlphabet[loopAround(jumped_index)]
			elsif @upperAlphabet.include? (char)
				jumped_index = @upperAlphabet.index(char) + jump
				translated_str << @upperAlphabet[loopAround(jumped_index)]
			elsif @punctuation.include? (char)
				translated_str << char
			end	
		end	
	return translated_str
end

def loopAround (jumped_index)
	#this helper function will help you loop around whenever the jumps get really huge Ex) jump 50 

	if jumped_index >= @lowerAlphabet.size
		jumped_index = jumped_index % @lowerAlphabet.size
		return jumped_index
	else
		return jumped_index
	end
end

def cipher(sentence, jump)
	array = sentence.split()
	result = []
	for word in array
		result << jumpOne(word, jump)
	end
	result.join(" ")
end

#testing
puts loopAround(26)
puts jumpOne("zzz", 2)
puts cipher("I love eating steaks at Molly's steakhouse in Queens!!", 5)
puts cipher("JUMP JUMP JUMP JUMP WOOOOO", 500)