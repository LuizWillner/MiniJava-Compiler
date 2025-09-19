import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Reader reader = new StringReader("123 abc ? 456");
        Lexer lexer = new Lexer(reader);

        String token;
        while ((token = lexer.yylex()) != null) {
            System.out.println("Token: " + token);
        }
    }
}
