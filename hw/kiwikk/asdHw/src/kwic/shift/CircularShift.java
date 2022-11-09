package kwic.shift;

import java.util.ArrayList;
import java.util.Arrays;

public class CircularShift {
    ArrayList<Shift> circularedList;

    public CircularShift(ArrayList<String> words, ArrayList<String> wordsToIgnore) {
        circularedList = circularize(words, wordsToIgnore);
    }

    private ArrayList<Shift> circularize(ArrayList<String> words, ArrayList<String> wordsToIgnore) {
        ArrayList<Shift> resultList = new ArrayList<>();

        words.forEach(line -> {
            ArrayList<String> splittedWords = new ArrayList<String>(Arrays.asList(line.split(" ")));
            int numberOfWords = splittedWords.size();

            for (int wordIndex = 0; wordIndex < numberOfWords; wordIndex++) {
                String startWord = splittedWords.get(wordIndex);
                startWord = strip(startWord);
                if (!wordsToIgnore.contains(startWord.toLowerCase())) {
                    resultList.add(new Shift(line, wordIndex));
                }
            }
        });

//        for (String string : words) {
//            String[] stringArray = string.split("\\s+");
//
//            for (int firstWord = 0; firstWord < stringArray.length; firstWord++) {
//                StringBuilder sb = new StringBuilder();
//                for (int j = firstWord; j < firstWord + stringArray.length; j++) {
//                    sb.append(stringArray[j % stringArray.length]);
//                    sb.append(" ");
//                }
//                resultList.add(sb.toString());
//            }
//        }

        return resultList;
    }

    private String strip(String word) {
        char firstChar = word.charAt(0);
        char lastChar = word.charAt(word.length() - 1);

        if (!Character.isDigit(firstChar) && !Character.isAlphabetic(firstChar)) {
            word = word.substring( 1);
        }

        if (word.length() > 0 && !Character.isDigit(lastChar) && !Character.isAlphabetic(lastChar)) {
            word = word.substring(0, word.length() - 1);
        }

        return word;
    }

    public ArrayList<Shift> getCircularedList() {
        return circularedList;
    }
}
