# MiniJava-Compiler
Trabalho da disciplina de Compiladores | prof. Flávia Bernardini | 2025.2 | Instituto de Computação | Universidade Federal Fluminense

## Gerando script do scanner
Ao fazer alterações em algum arquivo .flex, gere o script do scanner correspondente com:
```shell
 java -jar tools/jflex-full-1.9.1.jar nomeDoArquivo.flex 
```

## Testando o scanner
Compile o arquivo .java dentro do diretório desejado (ex.: Calc) com 
```shell
javac *.java
```

E execute-o com
```shell
java Main
```
