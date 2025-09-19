import java.io.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Digite o nome do arquivo: ");
        String fileName = scanner.nextLine();

        Reader reader = new FileReader(fileName);
        MiniJava miniJava = new MiniJava(reader);

        MiniJava.Token token;
        while ((token = miniJava.yylex()) != null) {
            System.out.println("Token.type: " + token.type + ", Token.value: " + token.value);
        }
    }
}
