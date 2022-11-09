package kwic.filter;

import java.util.ArrayList;

public class Filter {
    ArrayList<String> filteredList;

    public Filter(ArrayList<String> words, ArrayList<String> wordsToFilter) {
        filteredList = filter(words, wordsToFilter);
    }

    private ArrayList<String> filter(ArrayList<String> words, ArrayList<String> wordsToFilter) {
        ArrayList<String> tmp = words;

        for (String noiseWord : wordsToFilter) {
            for (int j = 0; j < tmp.size(); j++) {
                String inputString = tmp.get(j);
                String[] stringArray = inputString.split("\\s+", 2);
                if (stringArray[0].equalsIgnoreCase(noiseWord)) {
                    tmp.remove(j);
                    j--;
                }
            }
        }

        return tmp;
    }

    public ArrayList<String> getFilteredList() {
        return filteredList;
    }
}
