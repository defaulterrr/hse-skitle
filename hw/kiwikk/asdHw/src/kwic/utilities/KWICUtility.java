package kwic.utilities;

import kwic.shift.Shift;

import java.util.ArrayList;
import java.util.Collections;
import java.util.stream.Collectors;

public class KWICUtility {
    public static ArrayList<Shift> sort(ArrayList<Shift> list) {
        Collections.sort(list);
        return list.stream().distinct().collect(Collectors.toCollection(ArrayList::new));
    }
}
