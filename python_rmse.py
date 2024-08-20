'''
Write a function def solution(prdicted, observed)
that given arrays predicted and observed of floats (length N) returns root mean square error of these values
for every J the values predicted[J] corresponds to observed[J]. 
The result will be accepted if its absolute error is at most 10^-4
For example, given predicted = [4,25,0.76,11], observed = [3,21,-1.25,13] the function sould return 2.5
Assume intereger within range [1....1,000] and each element in predicted and observed arrays is a vlue within the range [-10^9...10^9]

'''
import math

def solution(predicted, observed):
    # Calculate the squared differences
    squared_diffs = [(p - o) ** 2 for p, o in zip(predicted, observed)]
    
    # Compute the mean of the squared differences
    mean_squared_diff = sum(squared_diffs) / len(squared_diffs)
    
    # Return the square root of the mean squared difference
    return math.sqrt(mean_squared_diff)

# test
predicted = [4, 25, 0.76, 11]
observed = [3, 21, -1.25, 13]
print(solution(predicted, observed))  # Output should be 2.5
