import json
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--infile', nargs=1,
                    help="JSON file to be processed",
                    type=argparse.FileType('r'))
arguments = parser.parse_args()

# Loading a JSON object returns a dict.
d = json.load(arguments.infile[0])


d['places_visted'][0]














#############################################################333

for key in user_score:
    score = df_new['place_score'] = df_new[df_new['results__types__002']==key]*user_score[key].values()
    print(score)
    






score_cols = ['results__002_score','results__003_score','results__004_score']



# j=0
# for column in ['results__types__002','results__types__003', 'results__types__004']:

#     #print(column)
#     for key in sig_vals.index:
#         #print(key)
#         if cur_data[cur_data[column]==key].empty== False:

#             scores = cur_data[cur_data[column]==key][score_cols[j]] * sig_vals[key]
            
#     j=j+1


# print(scores)
# # sys.stdout.flush()


# print(cur_data['results__rating_score'])


# for key in sig_vals.index:
#     if cur_data[cur_data['results__types__002']==key].empty== False:
#         scores[key] = cur_data[cur_data['results__types__002']==key]['results__002_score'] * sig_vals[key]


