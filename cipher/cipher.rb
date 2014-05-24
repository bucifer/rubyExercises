@alphabet = ("a".."z").to_a



def multidecoder(sentence)
	choppedSentences = sentence.split
	result = []
		if choppedSentences.size == 1
			return decoder(sentence)
		else
			for word in choppedSentences
				result << decoder(word)
			end
		end
	return result
end

def decoder(str)
#this function will return one word's individual letters decoded into numbers
#the return result will be one array with each number
	wordCode = []	
	chopWord = str.split(//)
		for letter in chopWord
			wordCode << @alphabet.index(letter)
		end
	return wordCode
end

def translator(array)
	word = []
	for number in array
		word << @alphabet[number]
	end
	return word.join 
end

def jump(sentence, jumps)
	arrays = multidecoder(sentence)
	if arrays[0].is_a?(Array)
		for array in arrays
			for i in (0...array.size)
				total = array[i] + jumps
				if total > (@alphabet.size-1) #maximum possible index of the alphabet (25)
					array[i]  = total % (@alphabet.size)
				else #when it's normal
					array[i] = array[i] + jumps
				end
			end
		end
	else
		for i in (0...arrays.size)
				total = arrays[i] + jumps
				if total > (@alphabet.size-1) #maximum possible index of the alphabet (25)
					arrays[i]  = total % (@alphabet.size)
				else #when it's normal
					arrays[i] = arrays[i] + jumps
				end
			end
	end
	return arrays
end

def cipher(sentence, jumps)
	arrays = jump(sentence, jumps)
	result = []
	if arrays[0].is_a?(Array)
		for array in arrays
			result << translator(array)
		end	
	else
		return translator(arrays)	
	end
	return result.join(" ")
end


p cipher("i love your mom", 25)
p cipher("G dog is your MOM", 22)