number = int(input("Enter a number: "))


def countinreverse(n):
    for i in range(n, 0, -1):
        if i % 5 == 0 and i % 3 == 0:
            print(f"{i} Testing")
        elif i % 5 == 0:
            print(f"{i} Agile")
        elif i % 3 == 0:
            print(f"{i} Software")
        else:
            print(f"{i}")


countinreverse(number)
