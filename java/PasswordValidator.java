import java.util.Scanner;

public class PasswordValidator
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);

        while(true)
        {
            System.out.print("Enter password: ");
            String password = sc.nextLine();

            boolean length = checkLength(password);
            boolean upper = checkUppercase(password);
            boolean lower = checkLowercase(password);
            boolean digit = checkDigit(password);
            boolean special = checkSpecial(password);
            boolean noSpace = checkNoSpace(password);

            if(length && upper && lower && digit && special && noSpace)
            {
                System.out.println("Password is strong and valid");
                break;
            }

            if(!length)
                System.out.println("Password must be at least 8 characters");

            if(!upper)
                System.out.println("Missing uppercase letter");

            if(!lower)
                System.out.println("Missing lowercase letter");

            if(!digit)
                System.out.println("Missing digit");

            if(!special)
                System.out.println("Missing special character");

            if(!noSpace)
                System.out.println("Password should not contain spaces");

            System.out.println("Try again\n");
        }
    }

    static boolean checkLength(String password)
    {
        return password.length() >= 8;
    }

    static boolean checkUppercase(String password)
    {
        for(int i=0;i<password.length();i++)
        {
            if(Character.isUpperCase(password.charAt(i)))
                return true;
        }
        return false;
    }

    static boolean checkLowercase(String password)
    {
        for(int i=0;i<password.length();i++)
        {
            if(Character.isLowerCase(password.charAt(i)))
                return true;
        }
        return false;
    }

    static boolean checkDigit(String password)
    {
        for(int i=0;i<password.length();i++)
        {
            if(Character.isDigit(password.charAt(i)))
                return true;
        }
        return false;
    }

    static boolean checkSpecial(String password)
    {
        for(int i=0;i<password.length();i++)
        {
            char ch = password.charAt(i);

            if(!Character.isLetterOrDigit(ch))
                return true;
        }
        return false;
    }

    static boolean checkNoSpace(String password)
    {
        for(int i=0;i<password.length();i++)
        {
            if(password.charAt(i) == ' ')
                return false;
        }
        return true;
    }
}
