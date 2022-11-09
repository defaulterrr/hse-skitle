wordlist = open(r'example.txt','r').read().split()
print(wordlist)

ngrams = [wordlist[i:i+5] for i in range(len(wordlist)-4)]

kwicdict = {}
for n in ngrams:
    if n[2] not in kwicdict:
        kwicdict[n[2]] = [n]
    else:
        kwicdict[n[2]].append(n)

for key in sorted(kwicdict): 
    for val in kwicdict[key]:
       outstring = ' '.join(val[:2]).rjust(20)
       outstring += ' '
       outstring += ' '.join(str(val[2]).center(len(n[2])+6))
       outstring +=' '
       outstring += ' '.join(val[3:])
       print (outstring)
