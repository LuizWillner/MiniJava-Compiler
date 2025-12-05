package main; // Fica no seu próprio pacote

import calculator.Calc;
import java_cup.runtime.Symbol;
import minijava.Parser;
import minijava.MiniJava;

import java.io.FileReader;
import java.io.Reader;
import java.util.Scanner;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.io.PrintStream;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Main {
    public static void main(String[] args) {
        Scanner inputScanner = new Scanner(System.in);

        System.out.println("Escolha o módulo:");
        System.out.println("1: Lexer da Calculadora");
        System.out.println("2: Lexer do MiniJava");
        System.out.println("3: Parser do MiniJava (léxico + sintático)");
        System.out.print("Sua escolha: ");
        String choice = inputScanner.nextLine();

        String filePath, outputPath;
        switch (choice) {
            case "1":
                filePath = "src/calculator/test/";
                outputPath = "src/calculator/output/";
                break;
            case "2":
                filePath = "src/minijava/outputparser/";
                outputPath = "src/minijava/output/";
                break;
            case "3":
                filePath = "src/minijava/outputlexer/";
                outputPath = "src/minijava/output/";
                break;
            default:
                System.out.println("Opção inválida!");
                return;
        }

        System.out.print("Digite o nome do arquivo de entrada (ex: teste.txt): ");
        String fileName = inputScanner.nextLine();
        String fullPath = filePath + fileName;
        System.out.println("Caminho completo do arquivo: " + fullPath);

        System.out.print("Digite o nome do arquivo de saída (ex: saida.txt)." +
                " Deixe em branco caso deseje utilizar a nomenclatura padrão: ");
        String outputFileName = inputScanner.nextLine();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH-mm-ss");
        if (outputFileName.isEmpty()) {
            String timestamp = LocalDateTime.now().format(formatter);
            outputFileName = "output_" + timestamp + "_" + fileName + ".txt";
        }
        String fullOutputPath = outputPath + outputFileName;

        PrintStream originalOut = System.out; // Salva a saída padrão
        try (
                Reader reader = new FileReader(fullPath);
                FileOutputStream fos = new FileOutputStream(fullOutputPath);
                TeeOutputStream tos = new TeeOutputStream(originalOut, fos);
                PrintStream teeOut = new PrintStream(tos)) {
            System.setOut(teeOut); // Redireciona a saída para o TeeOutputStream
            switch (choice) {
                case "1":
                    System.out.println("--- Executando Lexer da Calculadora ---");
                    runCalculatorLexer(reader);
                    break;

                case "2":
                    System.out.println("--- Executando Lexer do MiniJava ---");
                    runMiniJavaLexer(reader);
                    break;

                case "3":
                    System.out.println("--- Executando Parser do MiniJava ---");
                    runMiniJavaParser(reader);
                    break;
            }
        } catch (Exception e) {
            System.setOut(originalOut);
            System.err.println("Erro ao processar: " + e.getMessage());
        } finally {
            System.setOut(originalOut);
            System.out.println("Processamento concluído. Saída salva em: " + fullOutputPath);
        }
    }

    private static void runCalculatorLexer(Reader reader) throws Exception {
        Calc calcScanner = new Calc(reader);
        // O Token é uma classe interna de Calc, então o tipo completo é Calc.Token
        Calc.Token token;
        while (true) {
            token = calcScanner.yylex();

            // Nova condição de parada: se o token for EOF (ou nulo, por segurança)
            if (token == null || "EOF".equals(token.type)) {
                System.out.println("--- Fim da Analise Lexica ---");
                break; // Sai do loop
            }
            System.out.println("Token - <type: " + token.type + ", value: " + token.value + ", line: " + token.line
                    + ", column: " + token.column + ">");
        }
    }

    private static void runMiniJavaLexer(Reader reader) throws Exception {
        MiniJava miniJavaScanner = new MiniJava(reader);
        MiniJava.Token token;

        // Inicia um loop infinito que será controlado internamente
        while (true) {
            token = miniJavaScanner.yylex();

            // Nova condição de parada: se o token for EOF (ou nulo, por segurança)
            if (token == null || "EOF".equals(token.type)) {
                System.out.println("--- Fim da Analise Lexica ---");
                break; // Sai do loop
            }

            System.out.println("Token - <type: " + token.type + ", value: " + token.value + ", line: " + token.line
                    + ", column: " + token.column + ">");
        }
    }

    private static void runMiniJavaParser(Reader reader) throws Exception {
        // Cria o scanner (léxico) que será consumido pelo parser
        MiniJava miniJavaScanner = new MiniJava(reader);
        // Cria o parser, passando o scanner para ele
        Parser miniJavaParser = new Parser(miniJavaScanner);
        try {
            miniJavaParser.parse(); // Inicia a análise sintática. Este método pode lançar uma exceção em caso de erro.
            System.out.println("\nAnálise sintática concluída com sucesso!");
        } catch (Exception e) {
            System.err.println("Erro durante a análise sintática: " + e.getMessage());
        }
    }

    private static class TeeOutputStream extends OutputStream implements AutoCloseable {
        private final OutputStream out1, out2;

        public TeeOutputStream(OutputStream out1, OutputStream out2) {
            this.out1 = out1;
            this.out2 = out2;
        }

        @Override
        public void write(int b) throws IOException {
            out1.write(b);
            out2.write(b);
        }

        @Override
        public void flush() throws IOException {
            out1.flush();
            out2.flush();
        }

        @Override
        public void close() throws IOException {
            out2.close(); // fecha apenas o arquivo
            out1.flush(); // deixa system.out aberto
        }
    }
}