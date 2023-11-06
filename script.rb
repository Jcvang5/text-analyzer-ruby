# Function to read the text document and return its content as a string
def read_document(file_name)
    File.read(file_name)  # Reads the content of the specified file and returns it as a string
end

# Function to count the number of words in the document
def count_words(text)
    text.split(/\s+/).count  # Splits the text into words using whitespace as a delimiter and counts them
end

# Function to count the number of characters in the document
def count_characters(text)
    text.length  # Counts the total number of characters in the text
end

# Function to count the number of paragraphs in the document
def count_paragraphs(text)
    paragraphs = text.split(/\n\n+/)  # Splits the text into paragraphs using double newline as a delimiter
    paragraphs.count  # Counts the number of paragraphs
end

# Function to identify the most common word in the document and its frequency
def most_common_word(text)
    word_frequency = Hash.new(0)  # Initialize an empty hash to store word frequencies
    words = text.split(/\s+/)  # Split the text into words
    words.each { |word| word_frequency[word.downcase] += 1 }  # Count the frequency of each word (case-insensitive)
    most_common = word_frequency.max_by { |word, frequency| frequency }  # Find the word with the highest frequency
    [most_common[0], most_common[1]]  # Return the most common word and its frequency
end

# Function to provide word frequency statistics
def word_frequency_statistics(text)
    word_frequency = Hash.new(0)  # Initialize an empty hash to store word frequencies
    words = text.split(/\s+/)  # Split the text into words
    words.each { |word| word_frequency[word.downcase] += 1 }  # Count the frequency of each word (case-insensitive)
    sorted_word_frequency = word_frequency.sort_by { |word, frequency| -frequency }  # Sort words by frequency in descending order
    top_10_words = sorted_word_frequency[0..9]  # Get the top 10 words with the highest frequencies
    top_10_words.each do |word, frequency|
        puts "#{word}: #{frequency} times"  # Print the top 10 words and their frequencies
    end
end

# Main program
file_name = 'sample.txt'
text = read_document(file_name)  # Read the content of the specified file

# Output statistics
puts "Number of words: #{count_words(text)}"  # Print the word count
puts "Number of characters: #{count_characters(text)}"  # Print the character count
puts "Number of paragraphs: #{count_paragraphs(text)}"  # Print the paragraph count

most_common, frequency = most_common_word(text)  # Find the most common word and its frequency
puts "Most common word: '#{most_common}' (#{frequency} times)"  # Print the most common word and its frequency

puts "Word frequency statistics (Top 10 words):"
word_frequency_statistics(text)  # Print the top 10 words and their frequencies
