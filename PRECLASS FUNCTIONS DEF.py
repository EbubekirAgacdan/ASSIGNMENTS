#!/usr/bin/env python
# coding: utf-8

# In[6]:


print('Say: I love you!')
print()
print('me too', 2019)


# In[7]:


def first_function(argument_1, argument_2) :
    print(argument_1**2 + argument_2**2)


# In[8]:


first_function(2, 3)


# In[9]:


first_function(1254, 5462)


# In[10]:


def multiply(a, b) :
    print(a*b)


# In[11]:


multiply(4, 5)


# In[12]:


multiply(4.23, 2.54)


# In[16]:


multiply("ebubekir ", 5)


# In[17]:


def motto() :
    print("dont hesitate to reinvent yourself")
motto()  # it takes no argument


# In[27]:


def multiply_1(a, b) :
    print(a * b)  # it prints something

def multiply_2(a, b) :
    return a * b  # returns any numeric data type value

multiply_1(10, 5)  # nın type
print(multiply_2(10, 5))  #type integer


# In[28]:


print(type(multiply_1(10, 2)))
print(type(multiply_2(10, 5)))


# In[29]:


shadow_var = print("It can't be assigned to any variable")  # print fonksiyonunun sonucu non type olduğu için
 # bir değişkene atayanmazsınız
print(shadow_var)  # NoneType value can't be used


# In[1]:


def my_function(a, b):
    hypotenuse = (a**2 + b**2)**0.5
    return hypotenuse


# In[2]:


my_function(9, 12)


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




