sudoku = [
    [0, 0, 0, 0, 6, 4, 0, 0, 0],
    [7, 0, 0, 0, 0, 0, 3, 9, 0],
    [8, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 5, 0, 2, 0, 6, 0],
    [0, 8, 0, 4, 0, 0, 0, 0, 0],
    [3, 5, 0, 6, 0, 0, 0, 7, 0],
    [0, 0, 2, 0, 0, 0, 1, 0, 3],
    [0, 0, 1, 0, 5, 9, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 7, 0, 0]
]

sudoku.insert(0,[16*"- "])
sudoku.insert(4,[16*"- "])
sudoku.insert(8,[16*"- "])
sudoku.insert(12,[16*"- "])
sudoku
for i in range(len(sudoku)):
    if i%4!=0:
        sudoku[i].insert(3,"|")
        sudoku[i].insert(7,"|")
sudoku
for i in range(len(sudoku)):
    if i%4==0:
        print(sudoku[i][0])
    else:
        a=[]
        for j in sudoku[i]:
            a.append(str(j))
        print("  ".join(a))