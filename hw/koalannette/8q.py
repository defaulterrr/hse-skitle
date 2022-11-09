board = [[0 for i in range(8)] for j in range(8)]
cnt = 0

def setQueen(i,j):
    for x in range(8):
        board[x][j] += 1
        board[i][x] += 1
        if 0 <= i + j - x < 8:
            board[i + j - x][x] += 1
        if 0 <= i - j + x < 8:
            board[i - j + x][x] += 1
    board[i][j] = -1
      
def removeQueen(i,j):
    for x in range(8):
        board[x][j] -= 1
        board[i][x] -= 1
        if 0 <= i + j - x < 8:
            board[i + j - x][x] -= 1
        if 0 <= i - j + x < 8:
            board[i - j + x][x] -= 1
    board[i][j] = 0
      
def printPosition():
    global cnt
    cnt += 1
    abc = "abcdefgh"
    answer = []
    for i in range(8):
        for j in range(8):
            if board[i][j] == -1:
                answer.append(abc[j] + str(i + 1))
    print(", ".join(answer))
      
def solveQueens(i):
    for j in range(8):
        if board[i][j] == 0:
            setQueen(i, j)
            if i == 7:
                printPosition()
            else:
                solveQueens(i + 1)
            removeQueen(i, j)
              
solveQueens(0)
print(cnt)
