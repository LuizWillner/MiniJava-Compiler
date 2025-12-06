JFLEX = java -jar tools/jflex-full-1.9.1.jar
CUP = java -jar tools/java-cup-11b.jar
JAVAC = javac
JAVA = java

ifeq ($(OS),Windows_NT)
	SEP = ;
else
	SEP = :
endif

CP = .$(SEP)src$(SEP)tools/java-cup-11b-runtime.jar
BINCP = bin$(SEP)tools/java-cup-11b-runtime.jar

scanner-minijava:
	$(JFLEX) src/minijava/MiniJava.flex

scanner-calc:
	$(JFLEX) src/calculator/Calc.flex

parser:
	$(CUP) -parser Parser -symbols sym -destdir src/minijava -expect 2 src/minijava/MiniJava.cup

compile:
	mkdir -p bin
	$(JAVAC) -cp "$(CP)" -d bin src/main/Main.java src/minijava/*.java

run:
	$(JAVA) -cp "$(BINCP)" main.Main

all: scanner-minijava parser compile

clean:
	rm -rf bin/*
