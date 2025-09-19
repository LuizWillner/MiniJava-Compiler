import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Reader reader = new StringReader("123 + 3219 - 57*(8//2 ** 4)");
        Calc calc = new Calc(reader);

        Calc.Token token;
        while ((token = calc.yylex()) != null) {
            System.out.println("Token: " + token.type + ", Value: " + token.value);
        }
    }
}
