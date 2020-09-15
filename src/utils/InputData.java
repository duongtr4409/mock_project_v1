package utils;

import java.util.Scanner;

public class InputData {

    public static int inputInt(String message, Scanner sc) {
        int intValue = 0;
        while (true) {
            System.out.println(message);
            try {
                intValue = Integer.parseInt(sc.nextLine());
                break;
            } catch (NumberFormatException e) {

                System.out.println("Invalid data. Try again!!!");
            }
        }

        return intValue;
    }

    public static double inputDouble(String message, Scanner sc) {
        double doubleValue = 0;
        while (true) {
            System.out.println(message);
            try {
                doubleValue = Double.parseDouble(sc.nextLine());
                break;
            } catch (NumberFormatException e) {
                System.out.println("Invalid data. Try again!!!");
            }
        }

        return doubleValue;
    }

    public static String inputString(String message, Scanner sc) {
        System.out.println(message);
        String strValue = sc.nextLine();
        return strValue;
    }

}
