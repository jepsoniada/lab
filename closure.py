adders=[None, None, None, None]

for i in range(4):
    adders[i] = lambda a: i+a

for fn in adders:
    print(fn(0))