#!/usr/bin/env python
# coding: utf-8

# In[4]:


sum_num = 0
for i in range(1, 75) :
    sum_num += i
print(sum_num)


# In[6]:


who = ["i am ", "you are "]
mood = ["happy", "confident"]
for i in who :
    for ii in mood :
        print(i + ii)


# In[9]:


names = ["susan", "tom", "edward"]
mood = ["happy", "sad"]
for i in names :
    for ii in mood :
        print(i + " is " + ii)


# In[10]:


v = ("five", 5, True)
v


# In[11]:


(x, y, z) = v


# In[12]:


v


# In[13]:


x


# In[14]:


y


# In[15]:


z


# In[16]:


(monday, tuesday, wednesday, thursday, friday, saturday, sunday) = range(1, 8)


# In[17]:


1


# In[18]:


monday


# In[19]:


sunday


# In[24]:


x, y, *z, t, w = (11, 22, 33, 44, 55, 66, 77, 88, 99)


# In[25]:


z


# # List Comprehension

# In[26]:


[expression for item in iterable]
for item in iterable :
    expression


# In[29]:


sayılar = []
for i in range(5) :
    sayılar.append(i)
sayılar


# In[30]:


[i for i in range(5)]


# In[32]:


[i ** 2 for i in range(1,6)]


# # ternary if condition yapısı

# # #execute-body if condition else execute-body2

# In[38]:


my_list = [1, 2, 3, 4, 5, 6]
new_list = []
for i in my_list :
    if i % 2 :
        new_list.append(i ** 2)
new_list


# In[44]:


[i**2 for i in range(6) if i%2 != 0   ]


# In[39]:


condition = True
if condition :
    a = 1
else :
    a = 0
print(a)


# In[42]:


condition = True
1 if condition else 0


# In[45]:


my_list


# In[46]:


[i ** 2 for i in my_list]


# In[47]:


[i ** 2 for i in my_list if i % 2] # sonuç 1 verdiği için true veri


# In[ ]:


body if i % 2


# # Functions

# In[49]:


multiply(2, 5)


# In[ ]:





# In[ ]:





# In[ ]:




