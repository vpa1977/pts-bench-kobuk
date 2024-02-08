with open("system-list.txt") as input:
    lines = input.readlines()
    for line in lines:
        columns = line.split()
        print("<Execute>");
        print("<Test>" + columns[0] + "</Test>");
        print("<Description>", end="");
        for x in columns[1:]:
            print(x, end =" ")
        print("</Description>");
        print("</Execute>")
