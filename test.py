import pandas as pd

# 讀取 TSV 文件
header = ["userid", "gender", "age", "country", "registered"]
df = pd.read_csv("userprofile.tsv", sep="\t", header=None, names=header)
gender = df.groupby(header[1]).size().sort_index(axis=0, ascending=0)
print(df.head())
print(gender)
gender.to_csv("output/example01.tsv", sep="\t", index=False, header=None)
# 按 gender 分組，並計算每個性別的數量
# gender_count = input2.groupby('gender').size().reset_index(name='count')

# 輸出結果到文件
# gender_count.to_csv('pig_example01.tsv', sep='\t', index=False)
