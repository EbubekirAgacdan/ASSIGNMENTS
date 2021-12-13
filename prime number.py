number=int(input("enter prime number limit?"))
prime_list=[]
for i in range(2,number+1):
    count=0
    for j in range(1,i+1):
        if not i%j:
            count+=1
    if i==0 or i==1 or count>=3:
        continue
    else:
        prime_list.append(i)
print(prime_list)
