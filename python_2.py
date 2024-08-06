'''


write a function class Solution {public String solution(String S);}
that given a string S, returns a string that represents all occurances of all one letter, two letter, three-letter, etc
combinations that appear in the input string S
Only list combinations that occue in the actual input and only include combinations tht involve letters (no numbers, spaces, or special characters)
Ignore capitialization. List in order of frequency of occurence, then alphabetically. 
Example: input string is "Banana Boat" would return the folling string with each line sepearated by a new license
4:a
2:an
2:ana
2:b
2:n
2:na
1:anan
1:anana
etc. 
assume max length of S is 50

The answer looks right but failed unit tests



'''

import re
from collections import defaultdict

class Solution:
    def solution(self, S):
        # Clean the input string: remove non-letter characters and convert to lowercase
        cleaned_string = re.sub(r'[^a-zA-Z]', '', S).lower()
        
        # Dictionary to store the frequency of each substring
        substring_count = defaultdict(int)
        
        # Generate all possible substrings
        for length in range(1, len(cleaned_string) + 1):
            for i in range(len(cleaned_string) - length + 1):
                substring = cleaned_string[i:i + length]
                substring_count[substring] += 1
        
        # Sort the substrings by frequency (descending) and then alphabetically
        sorted_substrings = sorted(substring_count.items(), key=lambda x: (-x[1], x[0]))
        print(sorted_substrings)
        
        # Format the result as a string with each substring and its frequency on a new line
        result = '\n'.join(f"{count}:{substring}" for substring, count in sorted_substrings)
        
        return result

# Example usage
sol = Solution()
input_string = "Banana Boat"
print(sol.solution(input_string))