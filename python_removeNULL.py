'''
given table with data and column headers
first row, header, is never defective 
delete all rows with NULL cells, keep null cells
each word may contain only digits (0-9) lower case and uppercase english letters (a-z, A-Z). 
case matters. a != A
don't change order of rows
input is csv. every two lines separated by comma. every row separated by newline \n.
example input: "id,name.age.score\n,Jack,NULL,12\n17,Berry,28,11"
So jack would be deleted and berry returned as a table output

write function def solution(S): returns string S of length N without Null rows. 

'''

def solution(S):
    # Split the input string into rows
    rows = S.split('\n')
    
    # Initialize a list to hold valid rows
    valid_rows = []
    
    # Iterate over each row
    for row in rows:
        # Split the row into cells
        cells = row.split(',')
        
        # Check if any cell is null (empty string)
        if all(cell != 'NULL' for cell in cells):
            # If no cell is null, add the row to valid_rows
            valid_rows.append(row)
    
    # Join the valid rows back into a CSV string
    result = '\n'.join(valid_rows)
    
    # print(result)
    return result


#if __name__ == '__main__':
#    S = "id,name,age,score\nJack,NULL,12\n17,Berry,28,11"
#    solution(S)