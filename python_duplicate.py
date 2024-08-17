'''
Programming challenge description:
Imagine we have an immutable array of size N which we know to be filled with integers ranging from 0 to N-2, inclusive. 
Suppose we know that the array contains exactly one duplicated entry and that duplicate appears exactly twice. 
Find the duplicated entry.
Input:
Your program should read lines of text from standard input. Each line begins with a positive integer N, 
the size of the array, followed by a semicolon, followed by a comma separated list of positive numbers ranging from 0 to N-2, inclusive.
Output:
For each line of input, print to standard output the duplicated entry, each on its own line.
Test 1
Test Input
Download Test 1 Input
5;0,1,2,3,0
Expected Output
Download Test 1 Output
0
Test 2
Test Input
Download Test 2 Input
20;0,1,10,3,2,4,5,7,6,8,11,9,15,12,13,4,16,18,17,14
Expected Output
Download Test 2 Output
4
'''

import sys

def find_duplicate_entry(line):
    # Split the input line into N and the list of numbers
    n, numbers_str = line.split(';')
    n = int(n)
    numbers = list(map(int, numbers_str.split(',')))
    
    # Use a set to find the duplicate entry
    seen = set()
    for number in numbers:
        if number in seen:
            return number
        seen.add(number)
    return None

def main():
    # Read lines from standard input
    for line in sys.stdin:
        line = line.strip()
        if line:
            duplicate = find_duplicate_entry(line)
            if duplicate is not None:
                print(duplicate)

if __name__ == "__main__":
    main()