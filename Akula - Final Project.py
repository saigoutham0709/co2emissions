#!/usr/bin/env python
# coding: utf-8

# In[5]:


import pandas as pd


# In[6]:


import numpy as np


# In[7]:


import matplotlib.pyplot as plot


# In[9]:


Data_Frame = pd.read_csv(r"C:\Users\Sai\Desktop\Final\AIT580/2005-19_Local_Authority_CO2_emissions.csv")


# In[27]:


data = pd.DataFrame(Data_Frame)
X = list(data.iloc[:, 0])
Y = list(data.iloc[:, 1])


# In[12]:


print(data.head(15))


# In[13]:


unique_data = np.unique(data['Country'])


# In[14]:


CO2_Country = data.groupby("Country")["Territorial emissions"].count()


# In[15]:


CO2_Country


# In[55]:


CO2_Country.plot(kind='bar', figsize=(20,10), color=(0.2, 0.4, 0.6, 0.6),title = "CO2 Emissions by Countries in UK")


# In[38]:


CO2_Influence = data.groupby("Country")["Emissions within the scope of influence of LAs (kt CO2)"].count()


# In[57]:


CO2_Influence.plot(kind='line', figsize=(20,10), label = "CO2 Emissions within the scope of LA's")


# In[ ]:





# In[ ]:




