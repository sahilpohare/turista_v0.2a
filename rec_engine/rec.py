import numpy as np 
import pandas as pd 
import math
import sys
import json
import argparse

df = pd.read_csv('./rec_engine/data/places1.csv')

parser = argparse.ArgumentParser()
parser.add_argument('--infile', nargs=1,
                    help="JSON file to be processed",
                    type=argparse.FileType('r'))
arguments = parser.parse_args()

# Loading a JSON object returns a dict.
d = json.load(arguments.infile[0])



#print(df)
print(df.columns)



columns = ['results__formatted_address',
       'results__geometry__location__lat', 'results__geometry__location__lng',
       'results__id',
       'results__name', 'results__opening_hours__open_now',
       'results__rating','results__reference',
       'results__place_id',
       'results__types__001', 'results__types__002',
       'results__types__003', 'results__types__004',
    'results__types__005','results__user_ratings_total']

df = df[columns]



df_new = pd.DataFrame(columns=columns)

for i in range(len(df)):
    if i%2 == 0:
        df_new = df_new.append(df.iloc[i])
        #print(i)
    else:
        pass


df_new = df_new.reset_index(drop=True)

df_new



def sigmoid(param):
    return 1/(1 + np.exp(-param))



df_new['place_score'] = 1

#visted_place_ids = d['places_id']

cur_data = pd.DataFrame()

for id in d['places_id']:
    cur_data = cur_data.append(df_new[df_new['results__place_id']==id]).reset_index(drop=True)

# print(cur_data[['results__rating','results__types__002',
#        'results__types__003', 'results__types__004']])



# print(cur_data.columns)

cur_data = cur_data.assign(results__rating_score=1, results__002_score=1, results__003_score=1,results__004_score=1)
df_new = df_new.assign(results__002_score=1, results__003_score=1,results__004_score=1)

# print(cur_data.columns)

cur_data['results__rating_score'] = pd.to_numeric(cur_data['results__rating_score'], downcast='float')


cur_data['results__rating_score'] = cur_data['results__rating']/5

print(cur_data['results__rating_score'])





# j=0
# for i in cur_data['results__rating']:
#     cur_data['results__rating_score'][j] = i/5
#     j=j+1



vals = np.array(cur_data[['results__types__002','results__types__003', 'results__types__004']].values)

vals = pd.Series(vals.reshape(-1))

vals = vals.value_counts()

vals = sigmoid(vals)

print(vals)
print(vals.index)

# for i in range(0:5):
#     cur_data['results__002_score'] = cur_data['results__002_score']











# print(df_new.results__place_id,df_new.results__name)

# user_vector = {
#     "place_of_worship":3,
#     "point_of_interest":0,
#     "establishment":1
# }

# user_score = {}

# for key in user_vector.keys():
#     user_score[key] = sigmoid(user_vector[key])

# user_score


# scores = []

# for key in list(user_score.keys()):
#     #print(key)
#     score = df_new[df_new['results__types__003']==key]['place_score'] * user_score[key]
#     scores.append(score)


# # print(scores)
# sys.stdout.flush()

# print(cur_data)



print(df_new.columns)

cols = ['results__002_score','results__003_score', 'results__004_score']

df_new['results__002_score'] = pd.to_numeric(df_new['results__002_score'], downcast='float')
df_new['results__003_score'] = pd.to_numeric(df_new['results__003_score'], downcast='float')
df_new['results__004_score'] = pd.to_numeric(df_new['results__004_score'], downcast='float')


# for col in ['results__types__002','results__types__003', 'results__types__004']:
#     k=0
#     print(col)
#     for i in range(len(vals.index)):
#         poi = df_new.index[df_new[col]==vals.index[i]]
#         for j in poi:
#             print(df_new.iloc[j][cols[k]]*vals[i])
#             df_new[cols[k]][j] = df_new.iloc[j][cols[k]]*vals[i]
#     k=k+1
    
# print(df_new[['results__002_score','results__003_score', 'results__004_score']])

# print(vals)
# print(df_new['results__types__002'])

for i in range(len(vals.index)):
    poi = df_new.index[df_new['results__types__002']==vals.index[i]]
    for j in poi:
        df_new['results__002_score'][j]=df_new.iloc[j]['results__002_score']*vals[i]

print(df_new[['results__002_score','results__types__002']])



for i in range(len(vals.index)):
    poi = df_new.index[df_new['results__types__003']==vals.index[i]]
    for j in poi:
        df_new['results__003_score'][j]=df_new.iloc[j]['results__002_score']*vals[i]

print(df_new[['results__003_score','results__types__003']])

for i in range(len(vals.index)):
    poi = df_new.index[df_new['results__types__004']==vals.index[i]]
    for j in poi:
        df_new['results__004_score'][j]=df_new.iloc[j]['results__004_score']*vals[i]

print(df_new[['results__004_score','results__types__004']])





# df_sc = df_new[df_new[['results__002_score','results__003_score', 'results__004_score']]<1]
# print(df_sc)

for i in ['results__002_score','results__003_score', 'results__004_score']:
    df_new[i].replace(to_replace = 1.0,value=0.1,inplace=True)



df_new['rating_score'] = df_new['results__rating']/5


print(df_new['rating_score'])

loc = np.array([15.467865,73.823232])

latlong = df_new[['results__geometry__location__lat','results__geometry__location__lng']].values

latlong_score = np.linalg.norm(latlong-loc)

print(latlong_score)

df_new['overall_score'] = sigmoid(df_new['results__002_score']+df_new['results__003_score']+df_new['rating_score'])

print(df_new.sort_values('overall_score',ascending=False))

out = df_new.to_json(orient='index')

with open('cur.json', 'w') as f:
    f.write(out)