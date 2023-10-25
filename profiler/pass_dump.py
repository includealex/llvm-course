import matplotlib as mp
import numpy as np
import os
import pandas as pd

filename = "res.txt"
filepath = os.path.join("profiler_sources", filename)

rate_dict = {}

for line in open(filepath):
  q = "="
  if q in line:
    instr_name = line[line.find(q)+len(q):].split()[0]
    if not (instr_name in rate_dict):
      rate_dict[instr_name] = 1
      continue

    rate_dict[instr_name] += 1

all_values = rate_dict.values()
sum = sum(all_values)

for val, cal in rate_dict.items():
  rate_dict[val] = cal / sum

df_rate = pd.DataFrame.from_dict(rate_dict, orient='index')
print(df_rate)