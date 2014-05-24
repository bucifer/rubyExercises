
def substring_maker(word)
#helper function
#take a word, break it down into an array of its substrings
arrayLetters = word.split(//)
result = []
	for j in (0..(word.length-1))
		for i in (j..(word.length-1))
			result << arrayLetters[j..i].join
		end
	end
	return result
end


def substrings(sentence_string, dictionary)	
	words_array = sentence_string.downcase.split
	substrings_array = []
	words_array.each {|word| word.gsub!(/[[:punct:]]/, "")}
	result = {}
	
	#loop through each word in the words array then make substrings out of them
	for word in words_array
		substrings_array << substring_maker(word)
	end
	substrings_array.flatten! 
	#this flattens all substring arrays into one array
	
	#Hash count section 
	for item in dictionary
		if substrings_array.include? (item)
			result[item] = substrings_array.count(item)
		end
	end
	result.keys.sort! #just so that hash displays the keys alphabetially
	return result
end


#testing
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
p substrings("Yolo you only live once, I know that do you?", dictionary)