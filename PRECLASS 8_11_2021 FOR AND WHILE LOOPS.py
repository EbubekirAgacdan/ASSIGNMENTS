#!/usr/bin/env python
# coding: utf-8

# In[3]:


number = 0

while number < 6:
    print(number)
    number += 1
print('now, number is bigger or equal to 6')


# In[4]:


my_list=["a", "b", "c", "d", "e"]

a = 0

while a < len(my_list):
    print('square of {} is : {}'.format(a, a**2))
    a+=1


# In[6]:


answer = 44

question = 'What number am I thinking of?  '
print ("Let's play the guessing game!")

while True:
    guess = int(input(question))

    if guess < answer:
        print('Little higher')
    elif guess > answer:
        print('Little lower')
    else:  # guess == answer
        print('Are you a MINDREADER!!!')
        break


# In[12]:


flowers = ['Rose', 'Orchid', 'Tulip']
count1 = len("")

while count1 <= 2 :
    print(flowers[count1])
    count1 += 1
    


# In[8]:


flowers = ['Rose', 'Orchid', 'Tulip']
for i in flowers :
    print(i)


# In[1]:


for i in [1, 2, 3, 4, 5] :
    print(i)


# In[2]:


seasons = ['spring', 'summer', 'autumn', 'winter']

for season in seasons :
    print(season)


# In[3]:


for i in {'n1' : 'one', 'n2' : 'two'} : print(i)


# In[6]:


iterable = [1, 2, 3, 4]
for i in iterable :
    print(i**2)


# In[7]:


course = 'clarusway'

for i in course :
    print(i)


# In[13]:


times = int(input("How many times should say 'I love you'"))
for i in range(times) :
    print("I love you")


# In[17]:


n = int(input('enter a number between 1-10'))

for i in range(11):
    print('{}x{} = '.format(n, i), n*i)


# In[18]:


print(range(5))  # it will not print the numbers in sequence

print(*range(5))  # '*' separates its elements


# In[19]:


print(*('separate'))  # Starred expression 👉🏻* can separate other iterable objects. For example, you can separate a string:


# In[20]:


print(*range(10,0,-1))


# In[21]:


text = ['one','two','three','four','five']
numbers = [1, 2, 3, 4, 5]
for x, y in zip(text, numbers):
    print(x, ':', y)


# In[22]:


who = ['I am ', 'You are ']
mood = ['happy', 'confident']
for i in who:
    for ii in mood:
        print(i + ii)


# In[ ]:




