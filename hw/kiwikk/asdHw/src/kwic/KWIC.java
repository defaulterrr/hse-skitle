package kwic;

import kwic.filter.Filter;
import kwic.io.InputOutput;
import kwic.shift.CircularShift;
import kwic.utilities.KWICUtility;

import java.util.ArrayList;

public class KWIC {
    public static void main(String[] args) {
        ArrayList<String> words = InputOutput.getInput(InputOutput.InputType.NORMAL);
        ArrayList<String> stopList = InputOutput.getInput(InputOutput.InputType.STOP_LIST);

        CircularShift shifter = new CircularShift(words, stopList);

        InputOutput.printOutput(
                KWICUtility.sort(shifter.getCircularedList())
        );
    }
}
