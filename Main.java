import java.io.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);
        String inputString;
        while (true) {
            System.out.print("> ");
            inputString = scanner.nextLine();

            if (inputString.equals("exit")) {
                break;
            }

            Reader reader = new StringReader(inputString);
            Calc calc = new Calc(reader);

            Calc.Token token;
            while ((token = calc.yylex()) != null) {
                System.out.println("Token Type: " + token.type + ", Token Value: " + token.value);
            }
        }
    }
}
