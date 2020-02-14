import numpy as np 
import pandas as pd 
import math
import sys

df = pd.read_csv('./rec_engine/data/places1.csv')

#print(df)
#print(df.columns)



columns = ['results__formatted_address',
       'results__geometry__location__lat', 'results__geometry__location__lng',
       'results__id',
       'results__name', 'results__opening_hours__open_now',
       'results__rating','results__reference', 
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

user_vector = {
    "place_of_worship":3,
    "point_of_interest":0,
    "establishment":1
}

user_score = {}

for key in user_vector.keys():
    user_score[key] = sigmoid(user_vector[key])

user_score


scores = []

for key in list(user_score.keys()):
    #print(key)
    score = df_new[df_new['results__types__003']==key]['place_score'] * user_score[key]
    scores.append(score)


print(scores)
sys.stdout.flush()