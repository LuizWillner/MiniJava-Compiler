import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Reader reader = new StringReader("123 + 3219");
        Calc calc = new Calc(reader);

        String token;
        while ((token = calc.yylex()) != null) {
            System.out.println("Token: " + token);
        }
    }
}
