from basis import *
import fileinput
import sys 

file = sys.argv[1]

for line in fileinput.FileInput(file,inplace=1):
  if "C     6.0" in line:
    line = line.replace(line,line+carbon_sto3g_basis)
  print(line, end='')

for line in fileinput.FileInput(file, inplace=1):
  if "H     1.0" in line:
    line = line.replace(line,line+hydrogen_sto3g_basis)
  print(line, end='')

for line in fileinput.FileInput(file, inplace=1):
  if "O     8.0" in line:
    line = line.replace(line,line+oxygen_sto3g_basis)
  print(line, end='')

for line in fileinput.FileInput(file, inplace=1):
  if "W    74.0" in line:
    line = line.replace(line,line+tungsten_basis)
  print(line, end='')

for line in fileinput.FileInput(file, inplace=1):
  if "P    15.0" in line:
    line = line.replace(line,line+phosphorus_sto3g_basis)
  print(line, end='')
