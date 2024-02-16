"""
1. Consider an array that has both positive and negative numbers. Write a function to find all pairs of numbers whose sum is equal to a manually assigned number. So, the function has two inputs, begin the array with numbers and the manually assigned number. The function returns all possible pairs.
"""
# Hint:
# Make sure that your function returns unique combinations. If the array [2, 3, 4, 6] has assigned number 5, only return (2, 3), not (2, 3), (3, 2)

def modifiedTwoSum(numbers, target):
    pairs = set()
    complements = set()

    for num in numbers:
        complement = target - num
        if complement in complements:
            pair = (min(num, complement), max(num, complement))
            pairs.add(pair)
        complements.add(num)

    return pairs


"""
2. You are given a list L with different words. Implement the function words_with_all_vowels that returns the list of all words from L that contain all vowels (case insensitive). Remember that the vowels are ‘a’, ‘e’, ‘i’, ‘o’, and ‘u’. For example: L = [‘car’, ‘multidirectional’, ‘hello’] should result in [‘multidirectional’].
"""
# Hint: -

def words_with_all_vowels(L):
  vowels = ['a', 'e', 'i', 'o', 'u']
  final_words_array = []
  for word in L:
    covered_vowels = set()
    for char in word:
      if char in vowels:
        covered_vowels.add(char)
    if len(covered_vowels) == len(vowels):
      final_words_array.append(word)
  return final_words_array


"""
3. You are given a list with numbers in it. Create the largest possible numbers using all the numbers available in the list. For example, if the list is [2,73,9,0], the largest possible number will be 97320. Create a function that has a list as an input and returns the largest possible number.
"""
# Hint:
# Many people would start with sorting the numbers in descending order. This will not always work. Assume the list contains the numbers [3, 7, 55]. Here, 55 is bigger than 7, but the biggest number would be *755* rather than *557*. In other words, don’t use this approach and find the right approach.
import functools
def largestNumber(nums):
  for i, n in enumerate(nums):
    nums[i] = str(n)

  def compare(n1, n2):
    if n1 + n2 > n2 + n1:
      return -1
    else:
      return 1

  nums = sorted(nums, key=functools.cmp_to_key(compare))
  return str(int("".join(nums)))

"""
# 4. Create a function that finds the missing number in an array from range 0 to n. There is only one number missing. Bonus: figure out if you can solve this problem without looping through the numbers.
"""
# Hint:
# Do you remember how to compute the sum of numbers from 1 to n? Use (n+1)n/2 to solve this problem without loops.

def find_missing_number(array):
  n = len(array)
  return n*(n+1)/2.0 - sum(array)

"""
5. Write a function that, given a string S, returns the alphabetically smallest string that can be obtained by removing exactly one letter from the string.

For example, given S = ‘efg’, removing one letter would result in either ‘ef’, ‘eg’ or ‘fg’. Your function should return ‘ef’, since this is alphabetically smaller than ‘eg’ and ‘fg’.
"""
# Hint: remove the first character that is greater than the next from left to right

def one_short_alphabetically_smallest_string(S):
  l = len(S)
  for i in range(len(S)):
    if i == len(S) - 1:
      return S[:-1]
    if S[i] > S[i+1]:
      return S[:i] + S[i+1:]

"""
6. 

####### Objective:

In this programming assignment, you will create a Python script that counts the frequency of words in a given text file. Your script should be able to read a text file, process its content, and output the word frequencies in descending order.

####### Instructions:

Write a function called read_file(file_path) that takes a single argument, file_path, which is a string representing the path to the text file. The function should read the contents of the file and return a string containing the entire text.

Write another function called word_frequency(text) that takes a single argument, text, which is a string containing the text to be processed. The function should return a dictionary containing the frequency of each word in the text. For example, the output could look like: {"the": 10, "cat": 3, "sat": 2}.

To accomplish this, you may use string manipulation techniques and/or Python’s built-in string methods to split the input text into words. Ensure that your function ignores punctuation, capitalization, and common stopwords (e.g., “a”, “an”, “the”, “and”, “in”).

Write a function called sort_by_frequency(word_freq) that takes a single argument, word_freq, which is a dictionary containing word frequencies. 

The function should return a list of tuples containing the words and their frequencies, sorted in descending order by frequency. For example, the output could look like: [("the", 10), ("cat", 3), ("sat", 2)].

Write a test function called test_word_frequency() that tests your word_frequency(text) and sort_by_frequency(word_freq) functions using a sample text or a small text file. Include test cases with different types of text, as well as edge cases (e.g., empty text, text containing only special characters, or text with only stopwords).
 
####### Deliverables:

A Python script containing the read_file(file_path), word_frequency(text), sort_by_frequency(word_freq), and test_word_frequency() functions.
A brief report (1-2 paragraphs) describing your approach, any challenges you encountered, and possible improvements or alternative methods for word frequency counting.
"""
# Hint: -
"""
import string
from collections import Counter

def read_file(file_path):
    with open(file_path, 'r') as file:
        text = file.read()
    return text

def word_frequency(text):
    # Convert text to lowercase and remove punctuation
    text = text.lower()
    text = text.translate(str.maketrans('', '', string.punctuation))
    
    # Split the text into words
    words = text.split()
    
    # Create a counter object to count word frequencies
    word_counter = Counter(words)
    
    # Remove common stopwords
    stopwords = ['a', 'an', 'the', 'and', 'in']
    for stopword in stopwords:
        del word_counter[stopword]
    
    return word_counter

def sort_by_frequency(word_freq):
    # Sort the word frequencies in descending order
    sorted_freq = sorted(word_freq.items(), key=lambda x: x[1], reverse=True)
    return sorted_freq

def test_word_frequency():
    file_path = 'sample.txt'  # Path to the sample text file
    text = read_file(file_path)
    word_freq = word_frequency(text)
    sorted_freq = sort_by_frequency(word_freq)
    for word, freq in sorted_freq:
        print(f"{word}: {freq}")
"""

"""
7. You are given an array A of N integers and an integer S. Your task is to compute how many ways one can choose a contiguous fragment of A that has am arithmetic mean equal to S. The arithmetic mean (average) of a fragment is the sum of the elements of the fragment divided by its length. For example, the arithmetic mean of [1, 3, 3, 5] = 12/4 = 3.

Write a function which returns the number of contiguous fragments of A whose arithmetic means are equal to S. Examples:

Given A = [3, 2, 4] and S = 3, your function should return 3, since the arithmetic means of fragments [3], [2, 4], [3, 2, 4] are equal to 3.
Given A = [-1, 3, 2, -2] and S = 1, your function should return 2, since fragments [-1, 3] and [3, 2, -2] have an arithmetic mean of 1.
Given A = [2, 3, 6] and S = 5, your function should return 0, since there exist no contiguous fragments whose arithmetic mean is equal to 5.
Write an efficient algorithm for the following assumptions:

N is an integer within the range [1, …, 100,000]
S is an integer within the range [-100,000,000,000, 100,000,000,000]
Each element of array A is an integer within the range [-100,000,000,000, 100,000,000,000]
"""

# Hint: -

def count_contiguous_fragments(A, S):
    count = 0  # Variable to store the count of fragments with arithmetic mean equal to S
    start = 0  # Start index of the current fragment
    end = 0    # End index of the current fragment
    fragment_sum = A[0]  # Sum of elements within the current fragment

    while start < len(A):
        # Check if the current fragment has arithmetic mean equal to S
        if fragment_sum / (end - start + 1) == S:
            count += 1
        
        # If the sum is greater than or equal to S, move the start pointer to the right
        if fragment_sum >= S:
            fragment_sum -= A[start]
            start += 1
        # If the sum is less than S, move the end pointer to the right
        elif end + 1 < len(A):
            end += 1
            fragment_sum += A[end]
        else:
            break

    return count


"""
8. Sudoku is a well-known puzzle. A solved Sudoku grid obeys the following rules:

The grid has a valid structure: it has n rows and n columns (with n being an integer), divided sub blocks of sqrt(n) x sqrt(n)
For every row, it should contain all the numbers from 1 up to and including n.
For every column, it should contain all the numbers from 1 up to and including n.
Every sub block should contain all the numbers from 1 up to and including n.
In this assignment, you will implement the function is_valid_sudoku that takes as input a 2-dimensional list sudoku of size n x n. This function should return True if the values in the grid obey all the Sudoku rules described above. Otherwise, it should return False.

This is an example of a Sudoku you can expect as input to the sudoku function:

[
[5, 3, 4, 6, 7, 8, 9, 1, 2],
[6, 7, 2, 1, 9, 5, 3, 4, 8],
[1, 9, 8, 3, 4, 2, 5, 6, 7],
[8, 5, 9, 7, 6, 1, 4, 2, 3],
[4, 2, 6, 8, 5, 3, 7, 9, 1],
[7, 1, 3, 9, 2, 4, 8, 5, 6],
[9, 6, 1, 5, 3, 7, 2, 8, 4],
[2, 8, 7, 4, 1, 9, 6, 3, 5],
[3, 4, 5, 2, 8, 6, 1, 7, 9]
]

We suggest you use a class/ multiple functions instead of just one function, but it’s up to you to come up with the most efficient and clean solution.
"""
# Hint: -

class Sudoku:
    def __init__(self, grid):
        self.grid = grid
        self.n = len(grid)

    def is_valid_sudoku(self):
        if not self.has_valid_structure():
            return False
        
        for i in range(self.n):
            if not self.has_valid_row(i) or not self.has_valid_column(i) or not self.has_valid_sub_block(i):
                return False
        
        return True

    def has_valid_structure(self):
        sqrt_n = int(self.n ** 0.5)
        return sqrt_n * sqrt_n == self.n

    def has_valid_row(self, row):
        nums = set()
        for col in range(self.n):
            num = self.grid[row][col]
            if num in nums or not self.is_valid_num(num):
                return False
            nums.add(num)
        return True

    def has_valid_column(self, col):
        nums = set()
        for row in range(self.n):
            num = self.grid[row][col]
            if num in nums or not self.is_valid_num(num):
                return False
            nums.add(num)
        return True

    def has_valid_sub_block(self, block):
        sqrt_n = int(self.n ** 0.5)
        start_row = (block // sqrt_n) * sqrt_n
        start_col = (block % sqrt_n) * sqrt_n
        nums = set()
        for i in range(start_row, start_row + sqrt_n):
            for j in range(start_col, start_col + sqrt_n):
                num = self.grid[i][j]
                if num in nums or not self.is_valid_num(num):
                    return False
                nums.add(num)
        return True

    def is_valid_num(self, num):
        return 1 <= num <= self.n


"""
9. 

####### Objective
In this programming assignment, you will create a Python script that retrieves weather data from the OpenWeatherMap API and analyzes it. Your script should be able to fetch weather data for a given location, process the data, and output basic statistics about the temperature, humidity, and pressure for a specified period.

####### Instructions
Visit the OpenWeatherMap API documentation (https://openweathermap.org/api) to learn how to access historical weather data. Sign up for a free API key if required.

Write a function called fetch_weather_data(location, start_date, end_date, api_key) that takes four arguments: location (a string representing the location for which you want to fetch weather data), start_date and end_date (strings representing the date range for the data in the format ‘YYYY-MM-DD’), and api_key (a string representing your API key). The function should fetch weather data for the specified location and date range and return the data as a list of dictionaries or a similar data structure.

Write another function called calculate_statistics(weather_data) that takes a single argument, weather_data, which is a list of dictionaries containing the weather data to be processed. The function should return a dictionary containing the average temperature, humidity, and pressure for the specified period. 

For example, the output could look like: {"avg_temperature": 20.5, "avg_humidity": 60.0, "avg_pressure": 1010.0}.

To accomplish this, you may use loops or list comprehensions to iterate through the weather data and calculate the averages. Ensure that your function can handle data with missing or non-numerical values by skipping them during the calculation.

Write a function called print_statistics(statistics) that takes a single argument, statistics, which is a dictionary containing the calculated statistics. The function should print the statistics in a user-friendly format, displaying the average temperature, humidity, and pressure for the specified period.

######## Deliverables
A Python script containing the fetch_weather_data(location, start_date, end_date, api_key), calculate_statistics(weather_data), and print_statistics(statistics) functions.

A brief report (1-2 paragraphs) describing your approach, the OpenWeatherMap API, any challenges you encountered, and possible improvements or alternative methods for retrieving and analyzing weather data.
"""
# Hint: -

import requests

def fetch_weather_data(location, start_date, end_date, api_key):
    url = f"https://api.openweathermap.org/data/2.5/history/city?q={location}&start={start_date}&end={end_date}&appid={api_key}"
    response = requests.get(url)
    data = response.json()
    return data

def calculate_statistics(weather_data):
    temperature_sum = 0
    humidity_sum = 0
    pressure_sum = 0
    count = 0

    for record in weather_data:
        temperature = record.get("temperature")
        humidity = record.get("humidity")
        pressure = record.get("pressure")

        if temperature is not None and humidity is not None and pressure is not None:
            temperature_sum += temperature
            humidity_sum += humidity
            pressure_sum += pressure
            count += 1

    if count > 0:
        avg_temperature = temperature_sum / count
        avg_humidity = humidity_sum / count
        avg_pressure = pressure_sum / count
        return {
            "avg_temperature": avg_temperature,
            "avg_humidity": avg_humidity,
            "avg_pressure": avg_pressure
        }
    else:
        return {}

def print_statistics(statistics):
    if statistics:
        print("Statistics:")
        print(f"Average Temperature: {statistics['avg_temperature']}")
        print(f"Average Humidity: {statistics['avg_humidity']}")
        print(f"Average Pressure: {statistics['avg_pressure']}")
    else:
        print("No data available.")



"""
10. Write an efficient function to find the longest common prefix from several strings stored in an array. For example, if you have a list like words_list = {‘applejuice’, ‘applebandit’, ‘apples’}, the result should be ‘apple’.
"""
# Hint: -

def longest_common_prefix(words_list):
  if not words_list:
      return ""

  shortest_word = min(words_list, key=len)

  for i, char in enumerate(shortest_word):
      for word in words_list:
          if word[i] != char:
              return shortest_word[:i]

  return shortest_word



"""
11. In this assignment you will implement the words_with_consecutive_letters function. It takes as input a list with words. It returns another list with words that contain three consecutive letters of the alphabet. For instance, if the word “definitive” exists in the input file, it should end up it the returned list because the letters DEF are in it.
"""
# Hint: 
# You can use ‘ord’ to get the Unicode number value for a character. For example, ord(‘a’) is equal to 97 and ord(‘b’) is equal to 98

def words_with_consecutive_letters(word_list):
    result = []

    for word in word_list:
        for i in range(len(word) - 2):
            if ord(word[i]) == ord(word[i+1]) - 1 == ord(word[i+2]) - 2:
                result.append(word)
                break

    return result

# Example usage
words = ['definitive', 'alphabet', 'abc', 'xyz']
result = words_with_consecutive_letters(words)
print(result)


"""
12. You have 100 balls and 50 boxes. Every ball is put into a random box and the events are independent from each other. What is the expected number of empty boxes?
"""
# Hint: -
import numpy as np
def put_balls_into_boxes(balls, boxes):
  allocation = []
  boxes_with_atleast_one_ball = set()
  for ball in range(balls):
    box_allocated_to_that_ball = np.random.randint(1,boxes+1)
    allocation.append(box_allocated_to_that_ball)
    boxes_with_atleast_one_ball.add(box_allocated_to_that_ball)
  return boxes - len(boxes_with_atleast_one_ball)

def ball_boxes_simulator(balls, boxes, iterations):
  total_empty_boxes = 0.0
  for _ in range(iterations):
    num_empty_boxes = put_balls_into_boxes(balls, boxes)
    total_empty_boxes += num_empty_boxes
  return total_empty_boxes/iterations

def ball_boxes_question_empirical_answer_generator(balls, boxes):
  expectation_for_one_ball = ((boxes-1)/(boxes*1.0))**balls
  return expectation_for_one_ball*boxes
# 10,000 iterations gave 6.62753 as the answer
  

"""
13. 

######### Objective
In this programming assignment, you will create a Python script that checks whether a given word or phrase is a palindrome. A palindrome is a word, phrase, or sequence of characters that reads the same forwards and backwards (ignoring spaces, punctuation, and capitalization).

######### Instructions
Write a function called is_palindrome(input_string) that takes a single argument, input_string, which is a string containing a word or phrase.
The function should ignore spaces, punctuation, and capitalization when determining if the input string is a palindrome. For example, the function should return True for the input strings “A man, a plan, a canal, Panama!” and “amanaplanacanalpanama”.

To accomplish this, you may use string manipulation techniques and/or Python’s built-in string methods to filter out non-alphanumeric characters and convert the input string to lowercase.

Implement a palindrome-checking algorithm to determine whether the cleaned input string is a palindrome. You may use any approach you like (e.g., comparing characters, slicing, or reversing the string).

Write a test function called test_is_palindrome() that tests your is_palindrome() function using a few example input strings. Include test cases with palindromes, non-palindromes, and edge cases (e.g., empty strings or strings with only special characters).

######### Deliverables (in 1 hour)
A Python script containing the is_palindrome(input_string) function and the test_is_palindrome() function.

A brief report (1-2 paragraphs) describing your approach and any challenges you encountered while completing the assignment.
"""
# Hint: -

import string

def is_palindrome(input_string):
    # Remove spaces, punctuation, and convert to lowercase
    cleaned_string = ''.join(char.lower() for char in input_string if char.isalnum())
    # Check if the cleaned string is equal to its reverse
    return cleaned_string == cleaned_string[::-1]

def test_is_palindrome():
    test_cases = [
        ("A man, a plan, a canal, Panama!", True),
        ("amanaplanacanalpanama", True),
        ("Palindrome", False),
        ("", True),
        ("!@#$%", True)
    ]
    for input_string, expected_result in test_cases:
        result = is_palindrome(input_string)
        print(f"Input: {input_string} | Palindrome: {result} | Expected: {expected_result}")


"""
14. In this assignment, you will compare the accuracy between the Binomial Tree Model and the Black Scholes Model. You can use the code snippets in the two lectures in this code for both models. Write a code that returns the number of ‘steps’ that the Binomial Tree Model should have such that the difference in price between the call (or put) option in the BT model and the BS model is less than 0.5%.
"""
# Hint: - 

import math
from scipy.stats import norm

def black_scholes(S, K, r, sigma, T, option_type):
    d1 = (math.log(S / K) + (r + 0.5 * sigma ** 2) * T) / (sigma * math.sqrt(T))
    d2 = d1 - sigma * math.sqrt(T)
    
    if option_type == 'call':
        price = S * norm.cdf(d1) - K * math.exp(-r * T) * norm.cdf(d2)
    elif option_type == 'put':
        price = K * math.exp(-r * T) * norm.cdf(-d2) - S * norm.cdf(-d1)
    else:
        raise ValueError("Invalid option type")
    
    return price

def binomial_tree(S, K, r, sigma, T, option_type, N):
    delta_t = T / N
    up_factor = math.exp(sigma * math.sqrt(delta_t))
    down_factor = 1 / up_factor
    p = (math.exp(r * delta_t) - down_factor) / (up_factor - down_factor)
    
    # Initialize the stock price tree
    stock_tree = [[S]]
    for i in range(1, N + 1):
        prev_prices = stock_tree[i - 1]
        next_prices = [price * up_factor for price in prev_prices]
        next_prices.append(prev_prices[-1] * down_factor)
        stock_tree.append(next_prices)
    
    # Initialize the option value tree
    option_tree = [[max(price - K if option_type == 'call' else K - price, 0) for price in prices] for prices in stock_tree]
    
    # Calculate option values at each node
    for i in range(N - 1, -1, -1):
        option_values = option_tree[i]
        for j in range(len(option_values)):
            option_values[j] = (p * option_values[j] + (1 - p) * option_values[j + 1]) * math.exp(-r * delta_t)
    
    return option_tree[0][0]

def find_steps_with_accuracy(S, K, r, sigma, T, option_type, accuracy):
    num_steps = 1
    bs_price = black_scholes(S, K, r, sigma, T, option_type)
    
    while True:
        bt_price = binomial_tree(S, K, r, sigma, T, option_type, num_steps)
        diff = abs(bt_price - bs_price)
        if diff <= accuracy / 100 * bs_price:
            return num_steps
        num_steps += 1

# Example usage
S = 100  # Stock price
K = 100  # Strike price
r = 0.05  # Risk-free interest rate
sigma = 0.2  # Volatility
T = 1  # Time to maturity
option_type = 'call'  # Option type ('call' or 'put')
accuracy = 0.5  # Desired accuracy in percentage


"""
15. 
######### Objective
In this programming assignment, you will create a Python script that generates a list of prime numbers within a specified range. A prime number is a natural number greater than 1 that is not a product of two smaller natural numbers.

######## Instructions
Write a function called is_prime(number) that takes a single argument, number, which is a positive integer. The function should return True if the number is prime and False otherwise.

Implement a prime-checking algorithm in the is_prime() function. You may use any approach you like (e.g., trial division, checking for divisors up to the square root of the number, or using a Sieve of Eratosthenes-style algorithm).

Write another function called generate_primes(start, end) that takes two arguments, start and end, which are positive integers representing the range within which you want to generate prime numbers. The function should return a list of prime numbers within the specified range (inclusive of start and end).

Utilize the is_prime() function within the generate_primes() function to check if a number is prime before adding it to the list of primes.

Write a test function called test_generate_primes() that tests your generate_primes(start, end) function using a few example ranges. Include test cases with various ranges and edge cases (e.g., a range with no prime numbers or a range containing only one number).

####### Deliverables (in 1 hour)
A Python script containing the is_prime(number) function, the generate_primes(start, end) function, and the test_generate_primes() function.

A brief report (1-2 paragraphs) describing your approach, the prime-checking algorithm used, and any challenges you encountered while completing the assignment.
"""
# Hint: -

def is_prime(number):
    if number < 2:
        return False
    for i in range(2, int(number ** 0.5) + 1):
        if number % i == 0:
            return False
    return True


def generate_primes(start, end):
    primes = []
    for number in range(start, end + 1):
        if is_prime(number):
            primes.append(number)
    return primes


def test_generate_primes():
    test_cases = [(1, 10), (20, 30), (1, 1), (2, 2), (100, 200)]
    for start, end in test_cases:
        primes = generate_primes(start, end)
        print(f"Primes between {start} and {end}: {primes}")


"""
16. You start with a budget of 200 euros. You keep betting on black at the roulette table, with a probability of wining of 18/17. You start by betting 20 euros. Any time you win, you bet 20 euros again. Anytime you lose, you double your previous bet. The game ends when you either run out of money or realise a profit of 40 euros.

# Questions:

- Compute the expected value of this game using Monte Carlo.
- Compute the expected value of this game using an infinite budget.
"""
# Hint: 
# This is not a hard assignment, right? But with this type of assignments, it will be extra important how clean you code. So, pay attention to your coding style and try to create and use functions.

# Implement your function here

"""
17. Emilie is driving in her bus. She is on a road trip and she downloaded the top 2000 songs. The songs are shuffled, so she hears a random song out of the 2000 songs whenever a song is finished. Emilie makes a bet with her travel mate that she can listen to at least 100 songs without hearing a song for the second time. Is this a safe bet? After how many songs do you expect that Emilie will hear a song for the second time?
"""
# Hint:
# The programming part of this problem would be rather categorised as easy, however, this question involves a core understanding of Markov chains.

import numpy as np

def songsSimulator(n):
  num_songs = 2000
  songs_list = [i for i in range(num_songs)]
  num_simulations = n
  simulation_results = []
  for simulation_number in range(num_simulations):
    played_songs = set()
    random_num = np.random.randint(0,2001) 
    played_songs.add(random_num)
    random_song = np.random.randint(0,2001)
    while random_song not in played_songs:
      played_songs.add(random_song)
      random_song = np.random.randint(0,2001)
    simulation_results.append(len(played_songs))

  sum_sim_results = 0.0
  for sim_result in simulation_results:
    sum_sim_results += sim_result
  
  return sum_sim_results/len(simulation_results)

# With 100,000 simulations the result was 55.71582, so 100 songs is definitely not a safe bet.

"""
18. You’re given a list and a string. The list contains different words. Create a function, given the list and the string, that returns a list with booleans wether the words occur in the string or not. For example, the inputs ([‘trading’, ‘interview’], ‘ncdtradingpmwinterkow’) should return [True, False].
"""
# Hint: -

def words_exists(words, S):
  boolean_arrayOfWords = []
  for word in words:
    idx = 0
    while idx <= len(S) - len(word) - 1:
      if S[idx : idx + len(word)] == word:
        boolean_arrayOfWords.append(True)
        break
      else:
        idx += 1
    if idx == len(S) - len(word):
      boolean_arrayOfWords.append(False)
  return boolean_arrayOfWords
