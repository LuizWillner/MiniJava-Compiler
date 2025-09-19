# MiniJava-Compiler
Trabalho da disciplina de Compiladores | prof. Flávia Bernardini | 2025.2 | Instituto de Computação | Universidade Federal Fluminense

## Gerando script do scanner
Ao fazer alterações em algum arquivo .flex, gere o script do scanner correspondente

Para a calculadora:
```shell
 java -jar tools/jflex-full-1.9.1.jar src/calculator/Calc.flex
```

Para o MiniJava:
```shell
 java -jar tools/jflex-full-1.9.1.jar src/minijava/MiniJava.flex
```

## Testando o scanner
Compile o arquivo .java com 
```shell
javac -sourcepath src src\main\Main.java
```

E execute-o com
```shell
java -cp src main.Main
```
