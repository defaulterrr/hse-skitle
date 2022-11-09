package kwic.shift;

public class Shift implements Comparable<Shift> {
    private String line;
    private int index;

    public Shift(String line, int number) {
        this.line = line;
        this.index = number;
    }

    public String getLine() {
        return line;
    }

    public int getIndex() {
        return index;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        int numberOfWords = line.split(" ").length;
        for(int i = 0; i < numberOfWords; i++) {
            builder.append(line.split(" ")[(index + i) % numberOfWords]).append(" ");
        }

        return builder.toString();
    }

    @Override
    public int compareTo(Shift other) {
        int wordsCount = 0;
        int thisWordIndex = this.index;
        int otherWordIndex = other.index;

        int thisLineTotalWords = this.line.split(" ").length;
        int otherLineTotalWords = other.line.split(" ").length;

        while (wordsCount < thisLineTotalWords && wordsCount < otherLineTotalWords) {

            int compareVal = this.line.split(" ")[thisWordIndex].compareToIgnoreCase(other.line.split(" ")[otherWordIndex]);

            if (compareVal > 0) {
                return 1;
            } else if (compareVal < 0) {
                return -1;
            }

            wordsCount++;
            thisWordIndex = (thisWordIndex + 1) % thisLineTotalWords;
            otherWordIndex = (otherWordIndex + 1) % otherLineTotalWords;
        }

        if (wordsCount >= thisLineTotalWords) {
            return -1;
        } else if (wordsCount >= otherLineTotalWords) {
            return 1;
        } else {
            return 0;
        }
    }
}
