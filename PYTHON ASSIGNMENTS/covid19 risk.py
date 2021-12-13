age = input("Are you a cigarette addict older than 75 years old? (yes or no) : ")
if age.title() == "Yes" :
    age = True
elif age.title() == "No" :
    age = False
else :
    print("Invalid answer!")
        
chorinic = input("Do you have a severe chronic disease? (yes or no) : ")
if chorinic.title() == "Yes" :
    chorinic = True
elif chorinic.title() == "No" :
    chorinic = False
else :
    print("Invalid answer!")
    
immune = input("Is your immune system too weak? (yes or no) : ")
if immune.title() == "Yes":
    immune = True
elif immune.title() == "No" :
    immune = False
else :
    print("Invalid answer!")        
    
if age :
    risk = age and (chorinic or immune) # if only age is True, there is not a risk of death
else :
    risk = age or chorinic or immune 
    
if risk :
    print("age =",age,"\nchorinic =",chorinic,"\nimmune =",immune,"\nRisk = You are in risky group")
else :
    print("age =",age,"\nchorinic =",chorinic,"\nimmune =",immune,"\nRisk =You are not in risky group")