# MiniJava-Compiler
Trabalho da disciplina de Compiladores | prof. Flávia Bernardini | 2025.2 | Instituto de Computação | Universidade Federal Fluminense

## Gerando script do scanner
A aplicação foi desenvolvida utilizando o **IntelliJ** como IDE. Ao fazer alterações em algum arquivo .flex, gere o script do scanner correspondente

Para o flex da calculadora:
```shell
 java -jar tools/jflex-full-1.9.1.jar src/calculator/Calc.flex
```

Para o flex do MiniJava:
```shell
 java -jar tools/jflex-full-1.9.1.jar src/minijava/MiniJava.flex
```
## Gerando script do parser
Para compilar .cup (gramática) do MiniJava (Esperando 2 conflitos de ambiguidade ):
```shell
 java -jar tools/java-cup-11b.jar -parser Parser -symbols sym -destdir src/minijava -expect 2 src/minijava/MiniJava.cup


```
Os conflitos esperados são entre:
```shell
VarDeclarationList ::= (empty)
e
Type ::= ID
sob o símbolo ID
```
Isto acontece porque, dentro de um método, ao ver ID logo depois de {, o parser não sabe se aquele ID inicia uma declaração de variável (Type ID ;) ou um statement que começa com ID (por exemplo ID = ... ;). Essa ambiguidade é típica em gramáticas Java-like quando Type pode ser ID (tipos de classe) — o parser LR pode resolver (CUP está resolvendo em favor do shift), mas ainda geram conflitos que precisam ser aceitos explicitamente.

## Testando o scanner
Compile o arquivo .java com 
```shell
javac -cp ".;src;tools/java-cup-11b-runtime.jar" -d bin src/main/Main.java src/minijava/MiniJava.java src/minijava/Parser.java src/minijava/sym.java
```

E execute-o com
```shell
java -cp "bin;tools/java-cup-11b-runtime.jar" main.Main
```

## Testando o parser
Compile o arquivo .java com
```shell
javac -cp ".;src;tools/java-cup-11b-runtime.jar" -d bin src/main/Main.java src/minijava/MiniJava.java src/minijava/Parser.java src/minijava/sym.java
```

E execute-o com
```shell
java -cp "bin;tools/java-cup-11b-runtime.jar" main.Main
```
