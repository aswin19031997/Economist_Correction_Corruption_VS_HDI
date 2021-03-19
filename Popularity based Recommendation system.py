#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[3]:


rating=pd.read_csv("rating_final.csv")
cuisine=pd.read_csv("chefmozcuisine.csv")


# In[7]:


rating.head()


# In[6]:


cuisine.head()


# In[18]:


rating_count=pd.DataFrame(rating.groupby("placeID")['rating'].count())
rating_count.sort_values('rating',ascending=False).head()


# In[25]:


most_rated_place = pd.DataFrame([135085,132825,135032,135052,132834],index=np.arange(5),columns=['placeID'])
most_rated_place.head()

summary=pd.merge(most_rated_place,cuisine,on='placeID')
print(summary)

cuisine["Rcuisine"].describe()

