package kwic.io;

import kwic.shift.Shift;

import java.util.ArrayList;
import java.util.Scanner;

public class InputOutput {
    public static ArrayList<String> getInput(InputType type) {
        System.out.println("Input some words" + type.type + ":");
        ArrayList<String> titles = new ArrayList<>();
        String tmp;
        Scanner sc = new Scanner(System.in);
        while (sc.hasNextLine()) {
            tmp = sc.nextLine();
            if(tmp.isEmpty()) {
                break;
            }

            titles.add(tmp);
        }

        return titles;
    }

    public static void printOutput(ArrayList<Shift> list) {
        System.out.println("Result: ");
        list.forEach(System.out::println);
    }

   public enum InputType {
        NORMAL(""),
        STOP_LIST(" for stop list");

        public final String type;

        private InputType(String type) {
            this.type = type;
        }
    }
}
