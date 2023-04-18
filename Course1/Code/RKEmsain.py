#!/usr/bin/env python
# coding: utf-8

# In[1]:


## Libraries


# In[2]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pylab import *
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')
import  statsmodels.api as sm
import statsmodels.stats.api as sms
from scipy.stats import boxcox


# In[3]:


ESI = pd.read_csv('~renoodle/Downloads/Employee Satisfaction Index.csv')


# In[4]:


#Recode Activity into a New Variable


# In[5]:


ESI.head()


# In[6]:


## Dropping Columns


# In[7]:


emsain = ESI[['age', 'Dept', 'location', 'job_level', 'recruitment_type', 'rating', 'satisfied', 'education', 'onsite']]


# In[8]:


emsain.head()


# In[9]:


## Changing Dept, recruitment_typelocation and education to integers


# In[10]:


def Dept (series):
    if series == "HR":
        return 0
    if series == "Marketing":
        return 1
    if series == "Purchasing":
        return 2
    if series == "Sales":
        return 3
    if series == "Technology":
        return 4


# In[11]:


def education (series):
    if series == "PG":
        return 0
    if series == "UG":
        return 1


# In[21]:


def location (series):
    if series == "City":
        return 0
    if series == "Suburb":
        return 1


# In[22]:


emsain.head()


# In[23]:


emsain['Dept1'] = emsain['Dept'].apply(Dept)


# In[24]:


emsain.head()


# In[25]:


def recruitment_type (series):
    if series == "On-Campus":
        return 0
    if series == "Recruitment Agency":
        return 1
    if series == "Referral":
        return 2
    if series == "Walk-in":
        return 3


# In[26]:


emsain['recruitment_type1'] = emsain['recruitment_type'].apply(recruitment_type)


# In[27]:


emsain['education1'] = emsain['education'].apply(education)


# In[28]:


emsain['Dept1'] = emsain['Dept'].apply(Dept)


# In[29]:


emsain['location1'] = emsain['location'].apply(location)


# In[30]:


emsain.head()


# In[31]:


# Testing for Linearity and Normality


# In[32]:


sns.distplot(emsain['age'])


# In[33]:


sns.distplot(emsain['satisfied'])


# In[34]:


sns.distplot(emsain['age'])


# In[35]:


sns.distplot(emsain['location1'])


# In[36]:


sns.distplot(emsain['onsite'])


# In[55]:


emsain.to_csv('RKEmsain.csv,index=TRUE')


# In[38]:


sns.distplot(emsain['rating'])


# In[39]:


# Testing for Homoscedasticity


# In[40]:


x = emsain['satisfied']
y = emsain['rating']


# In[41]:


model = sm.OLS(y,x).fit()


# In[42]:


print(model)


# In[43]:


pred_val = model.fittedvalues.copy()
true_val = emsain['satisfied'].values.copy()
residual = true_val - pred_val


# In[44]:


pred_val = model.fittedvalues.copy()
true_val = emsain['rating'].values.copy()
residual = true_val - pred_val


# In[45]:


sms.diagnostic.het_breuschpagan(residual, emsain[['satisfied']])


# In[46]:


sms.diagnostic.het_breuschpagan(residual, ESI[['rating']])


# In[47]:


sms.linear_harvey_collier(model)


# In[48]:


transformed, _ = boxcox(ESI['rating'])


# In[49]:


x = transformed
model1 = sm.OLS(y,x).fit()
model1.summary()


# In[50]:


pred_val = model1.fittedvalues.copy()
true_val = ESI['satisfied'].values.copy()
residual = true_val - pred_val


# In[51]:


pred_val = model1.fittedvalues.copy()
true_val = ESI['rating'].values.copy()
residual = true_val - pred_val


# In[52]:


# Testing for Multicollinearity


# In[53]:


emsain.corr()


# In[ ]:




