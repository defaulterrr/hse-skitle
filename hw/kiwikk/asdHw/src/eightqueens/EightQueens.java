package eightqueens;

public class EightQueens {
    static int[] chessboard = {0, 0, 0, 0, 0, 0, 0, 0};
    static int index = 0;
    static int version = 0;

    public static void main(String[] args) {
        placeQueens();
        printResult();
    }

    static void placeQueens() {
        do {
            if (checking()) {
                if (index == 7) {
                    version++;
                    chessboard[index]++;
                } else {
                    index++;
                }
            } else {
                chessboard[index]++;
            }
        } while (chessboard[0] < 8);
    }

    static void printResult() {
        System.out.println("Versions for 8x8 and 8 queens = " + version);
    }

    static boolean checking() {
        int i;

        if (index == 0) {
            return true;
        }

        if (chessboard[index] > 7) {
            chessboard[index] = 0;
            index--;
            return false;
        }

        for (i = 0; i < index; i++) {
            if ((chessboard[index] == chessboard[i]) | ((Math.abs(chessboard[index] - chessboard[i])) == (index - i))) {
                return false;
            }
        }

        return true;
    }
}
