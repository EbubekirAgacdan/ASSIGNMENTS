#!/usr/bin/env python
# coding: utf-8

# In[2]:


names = ["Ahmed", "Aisha", "Adam", "Joseph", "Gabriel"]
for i in names :
    print("Hello ", i)


# In[5]:


liste = []
for i in range(1,6) :
    liste.append(i)
print(liste)


# In[6]:


course = "clarusway"
for i in course :
    print(i)


# In[13]:


liste = list(range(0, 11))
liste


# In[20]:


for i in liste :
    print("5 x", i, "=", i * 5)


# In[23]:


liste = list(range(0, 11))
liste
for i in liste :
    print("{}x{} =".format(5, i), 5 * i)


# In[26]:


liste = range(1, 10)
for i in liste :
    print(str(i) * i)


# In[30]:


print(*range(5, 25, 2))


# In[34]:


print(*range(10,0,-2))


# In[35]:


text = ["one", "two", "three", "four", "five"]


# In[39]:




events = []
odds = []

for i in range(0,10) :
    if i%2 == 0 :
        events.append(i)
    else :
        odds.append(i)
print("events :", events)
print("odds :", odds)


# In[40]:


liste = [11, 36, 33, 66, 89, 21, 32, 16, 10]
odds = 0
evens = 0
for i in liste :
    if i % 2 == 0 :
        evens += 1
    else :
        odds += 1
print("evens count :", evens)
print("odds count :", odds)


# In[ ]:




