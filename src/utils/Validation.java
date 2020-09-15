package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {

    public static boolean checkDate(String dateStr) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date date = dateFormat.parse(dateStr);
            return true;
        } catch (ParseException e) {
            System.out.println("Invalid Data type");
            return false;
        }
    }

    public static boolean checkEmail(String email) {
        Pattern pattern = Pattern.compile(Const.regexEmail);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

}
