package main; // Fica no seu próprio pacote

// Importa tudo o que precisamos dos outros pacotes
import calculator.Calc;      // <-- ADICIONADO
import minijava.MiniJava;   // <-- ADICIONADO

import java.io.FileReader;
import java.io.Reader;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner inputScanner = new Scanner(System.in);

        System.out.println("Escolha qual analisador léxico executar:");
        System.out.println("1: Calculator"); // Mudado para "Calculator"
        System.out.println("2: MiniJava");
        System.out.print("Sua escolha: ");
        String choice = inputScanner.nextLine();
        String filePath = "";
        if (choice.equals("1")) {
            filePath = "src/calculator/test/";
        } else if (choice.equals("2")) {
            filePath = "src/minijava/test/";
        } else {
            System.out.println("Opção inválida!");
            return;
        }

        System.out.print("Digite o nome do arquivo de entrada (ex: teste.txt): ");
        String fileName = inputScanner.nextLine();
        String fullPath = filePath + fileName;
        System.out.println("Caminho completo do arquivo: " + fullPath);

        try (Reader reader = new FileReader(fullPath)) {
            switch (choice) {
                case "1":
                    System.out.println("\n--- Executando Analisador do Calculator ---\n");
                    runCalculator(reader);
                    break;
                case "2":
                    System.out.println("\n--- Executando Analisador do MiniJava ---\n");
                    runMiniJava(reader);
                    break;
                default:
                    System.out.println("Opção inválida!");
                    break;
            }
        } catch (Exception e) {
            System.err.println("Erro ao ler o arquivo: " + e.getMessage());
        }
    }

    private static void runCalculator(Reader reader) throws Exception {
        Calc calcScanner = new Calc(reader);
        // O Token é uma classe interna de Calc, então o tipo completo é Calc.Token
        Calc.Token token;
        while ((token = calcScanner.yylex()) != null) {
            System.out.println("Token.type: " + token.type + ", Token.value: " + token.value);
        }
    }

    private static void runMiniJava(Reader reader) throws Exception {
        MiniJava miniJavaScanner = new MiniJava(reader);
        // O Token é uma classe interna de MiniJava, então o tipo completo é MiniJava.Token
        MiniJava.Token token; // <-- CORRIGIDO (era minijava.Calc.Token)
        while ((token = miniJavaScanner.yylex()) != null) {
            System.out.println("Token - <type: " + token.type + ", value: " + token.value + ", line: " + token.line + ", column: " + token.column + ">");
        }
    }
}