#!/usr/bin/env python
# coding: utf-8

# In[5]:


import tweepy
import re
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

consumer_key = "xxxxxxxxxxxx"
consumer_secret = "xxxxxxxxxxxxxxxx"
access_token = "xxxxxxxxxxxxxxxx"
access_token_secret = "xxxxxxxxxxxxxxxxx"


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)


# In[7]:


search_words= ("Jouska penipuan OR rugi OR skandal OR saham OR OJK")
date_since = "2020-07-27"
new_search = search_words + " -filter:retweets -filter:replies -filter:likes"
#new_search = search_words.append(" -filter:retweets")

tweets = tweepy.Cursor(api.search,
        q=new_search,
        lang="id",
        since=date_since, tweet_mode='extended').items(1000)


# In[8]:


print(tweets)


# In[9]:


items = []
for tweet in tweets:
    item = []
    item.append (' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)", " ", tweet.full_text).split()))
    items.append(item)

hasil = pd.DataFrame(data=items, columns=['tweet'])
hasil['tweet_lc']=hasil['tweet'].str.lower()



# In[11]:


S=[]    
pos_list= open("./kata_positif.txt","r")
pos_kata = pos_list.readlines()
neg_list= open("./kata_negatif.txt","r")
neg_kata = neg_list.readlines()
for item in items:
    count_p = 0
    count_n = 0
    for kata_pos in pos_kata:
        if kata_pos.strip() in item[0]:
            #print("kata_pos: ",kata_pos)
            #print("kata_pos.strip(): ",kata_pos.strip()) #tanpa newline
            count_p +=1
    for kata_neg in neg_kata:
        if kata_neg.strip() in item[0]:
            count_n +=1
    # print ("positif: "+str(count_p))
    # print ("negatif: "+str(count_n))
    S.append(count_p - count_n)
    # print ("-----------------------------------------------------")

hasil["value"] = S
print ("Nilai rata-rata (mean): "+str(np.mean(hasil["value"])))
print ("Standar deviasi: "+str(np.std(hasil["value"])))
print ("Nilai rata-rata (median): "+str(np.median(hasil["value"])))


# In[12]:


labels, counts = np.unique(hasil["value"], return_counts=True)
plt.bar(labels, counts, align='center')
plt.gca().set_xticks(labels)
plt.show()


# In[13]:


print("Kesimpulan untuk topik: ", search_words)
print("Dapat dilihat bahwa secara rata-rata, publik merasa bahwa kasus Jouska")
print("memiliki sentimen atau opini negatif terkait yang dibuktikan dengan ")
print("nilai rata-rata sebesar", "{:.2f}".format(np.mean(hasil["value"])))


# In[14]:


search_words= ("Anies Baswedan OR Gubernur Jakarta")
date_since = "2020-07-27"
new_search = search_words + " -filter:retweets -filter:replies -filter:likes"
#new_search = search_words.append(" -filter:retweets")

tweets = tweepy.Cursor(api.search,
        q=new_search,
        lang="id",
        since=date_since, tweet_mode='extended').items(1000)


# In[15]:


items = []
for tweet in tweets:
    item = []
    item.append (' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)", " ", tweet.full_text).split()))
    items.append(item)

hasil = pd.DataFrame(data=items, columns=['tweet'])
hasil['tweet_lc']=hasil['tweet'].str.lower()



# In[16]:


S=[]    
pos_list= open("./kata_positif.txt","r")
pos_kata = pos_list.readlines()
neg_list= open("./kata_negatif.txt","r")
neg_kata = neg_list.readlines()
for item in items:
    count_p = 0
    count_n = 0
    for kata_pos in pos_kata:
        if kata_pos.strip() in item[0]:
            #print("kata_pos: ",kata_pos)
            #print("kata_pos.strip(): ",kata_pos.strip()) #tanpa newline
            count_p +=1
    for kata_neg in neg_kata:
        if kata_neg.strip() in item[0]:
            count_n +=1
    # print ("positif: "+str(count_p))
    # print ("negatif: "+str(count_n))
    S.append(count_p - count_n)
    # print ("-----------------------------------------------------")

hasil["value"] = S
print ("Nilai rata-rata (mean): "+str(np.mean(hasil["value"])))
print ("Standar deviasi: "+str(np.std(hasil["value"])))
print ("Nilai rata-rata (median): "+str(np.median(hasil["value"])))


# In[17]:


labels, counts = np.unique(hasil["value"], return_counts=True)
plt.bar(labels, counts, align='center')
plt.gca().set_xticks(labels)
plt.show()


# In[ ]:


print("\n\nKesimpulan untuk topik: ", search_words)
print("Dapat dilihat bahwa secara rata-rata, publik merasa bahwa Hal terkait tentang Anies Baswedan")
print("memiliki sentimen atau opini negatif terkait yang dibuktikan dengan ")
print("nilai rata-rata sebesar", "{:.2f}".format(np.mean(hasil["value"])),".")
print("Hal menarik bahwa persebaran kata-kata negatif justru sangat besar ketimbang")
print("kata-kata positif. Perlu diperhatikan bahwa terjadi suatu hal yang unik untuk")
print("jumlah total sentimen bernilai -7,-8, -10 tidak ada.")


# In[18]:


search_words= ("Menkes OR Terawan OR Menteri Kesehatan")
date_since = "2020-07-27"
new_search = search_words + " -filter:retweets -filter:replies -filter:likes"
#new_search = search_words.append(" -filter:retweets")

tweets = tweepy.Cursor(api.search,
        q=new_search,
        lang="id",
        since=date_since, tweet_mode='extended').items(1000)


# In[19]:


items = []
for tweet in tweets:
    item = []
    item.append (' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)", " ", tweet.full_text).split()))
    items.append(item)

hasil = pd.DataFrame(data=items, columns=['tweet'])
hasil['tweet_lc']=hasil['tweet'].str.lower()
hasil.head()


# In[20]:


S=[]    
pos_list= open("./kata_positif.txt","r")
pos_kata = pos_list.readlines()
neg_list= open("./kata_negatif.txt","r")
neg_kata = neg_list.readlines()
for item in items:
    count_p = 0
    count_n = 0
    for kata_pos in pos_kata:
        if kata_pos.strip() in item[0]:
            #print("kata_pos: ",kata_pos)
            #print("kata_pos.strip(): ",kata_pos.strip()) #tanpa newline
            count_p +=1
    for kata_neg in neg_kata:
        if kata_neg.strip() in item[0]:
            count_n +=1
    # print ("positif: "+str(count_p))
    # print ("negatif: "+str(count_n))
    S.append(count_p - count_n)
    # print ("-----------------------------------------------------")

hasil["value"] = S
print ("Nilai rata-rata (mean): "+str(np.mean(hasil["value"])))
print ("Standar deviasi: "+str(np.std(hasil["value"])))
print ("Nilai rata-rata (median): "+str(np.median(hasil["value"])))


# In[21]:


labels, counts = np.unique(hasil["value"], return_counts=True)
plt.bar(labels, counts, align='center')
plt.gca().set_xticks(labels)
plt.show()


# In[ ]:


print("\n\nKesimpulan untuk topik: ", search_words)
print("Dapat dilihat bahwa secara rata-rata, publik merasa bahwa Menkes Terawan")
print("memiliki sentimen atau opini positif terkait yang dibuktikan dengan ")
print("nilai rata-rata sebesar", "{:.2f}".format(np.mean(hasil["value"])))
print("Berbeda dengan topik mengenai Anies Baswedan, sentimen positif")
print("jauh mengungguli sentimen negatif.")

print("Program perlu pengembangan lebih lanjut untuk mendeteksi post")
print("yang terindikasi dari buzzer atau tidak.")

