package minijava;

import java.util.ArrayList;
import java.util.List;

public class ASTNode {
    private String label;       // Nome do nó
    private String value;       // Opcional: valor associado (ex: número, id, tipo)
    private List<ASTNode> children;

    // Construtor usado para nós simples (sem valor)
    public ASTNode(String label) {
        this.label = label;
        this.value = null;
        this.children = new ArrayList<>();
    }

    // Construtor usado pelo Parser CUP (label + valor)
    public ASTNode(String label, String value) {
        this.label = label;
        this.value = value;
        this.children = new ArrayList<>();
    }

    // Construtor label + 1 filho direto (também usado por algumas regras do CUP)
    public ASTNode(String label, ASTNode child) {
        this(label);
        this.children.add(child);
    }

    // Adicionar filho
    public void addChild(ASTNode child) {
        if (child != null)
            this.children.add(child);
    }

    public String getLabel() {
        return label;
    }

    public String getValue() {
        return value;
    }

    public List<ASTNode> getChildren() {
        return children;
    }

    // Impressão da árvore (indentado)
    public void print(String indent) {
        if (value != null)
            System.out.println(indent + label + ": " + value);
        else
            System.out.println(indent + label);

        for (ASTNode child : children) {
            child.print(indent + "  ");
        }
    }
}
