# MiniJava-Compiler
Trabalho da disciplina de Compiladores | prof. Flávia Bernardini | 2025.2 | Instituto de Computação | Universidade Federal Fluminense

## Pré-requisitos
- Java JDK 8+
- Make (já incluído no macOS/Linux)
- **IntelliJ** como IDE, não é obrigatório, mas é recomendável o seu uso

## Compilação Rápida (Makefile)
Build completo (scanner + parser + compilar) e execução da Main
```bash
make all

make run
```

Limpar arquivos compilados
```bash
make clean
```

## Comandos Individuais

### Gerando scanner
```bash
# MiniJava
make scanner-minijava

# Calculadora
make scanner-calc
```

### Gerando parser
```bash
make parser
```

> **Nota:** São esperados 2 conflitos de ambiguidade entre `VarDeclarationList ::= (empty)` e `Type ::= ID` sob o símbolo ID. Isso é normal em gramáticas Java-like.

### Compilar
```bash
make compile
```

### Executar
```bash
make run
```

## Comandos Manuais (sem Make)

### macOS/Linux
```bash
# Compilar
javac -cp ".:src:tools/java-cup-11b-runtime.jar" -d bin src/main/Main.java src/minijava/*.java

# Executar
java -cp "bin:tools/java-cup-11b-runtime.jar" main.Main
```

### Windows
```bash
# Compilar
javac -cp ".;src;tools/java-cup-11b-runtime.jar" -d bin src/main/Main.java src/minijava/*.java

# Executar
java -cp "bin;tools/java-cup-11b-runtime.jar" main.Main
```
