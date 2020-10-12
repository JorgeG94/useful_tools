import sys 

file = sys.argv[1]
size = sys.argv[2]
size = int(size)
size_of_matrix = size*size

print("size of matrix is = ", size_of_matrix)

with open(file) as f:
  lines = [line.rstrip() for line in f]

rows, cols = (size, size)
sad_matrix = [[0]*cols]*rows

offset = 0

print("{")
for i in range(size):
  print("{", end="")
  for j in range(size):
    #print(i, " ", j, " ")
    sad_matrix[i][j] = lines[i+j+offset]
    #print(sad_matrix[i][j], " ", lines[i+j+offset])
  offset += size -1
  print(','.join(sad_matrix[i]), end="")
  print("},")
print("} // end of sad array ")

'''
print("{")
for i in sad_matrix:
  print("{", end="")
  for j in i:
    if j == "14":
      print(j, end="")
    if j < "14":
      print(j, end=",")

  print("}")
print("} // end of sad array ")
'''
