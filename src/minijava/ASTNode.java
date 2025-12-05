package minijava;

import java.util.ArrayList;
import java.util.List;

public class ASTNode {
    public String name;
    public List<ASTNode> children = new ArrayList<>();

    public ASTNode(String name) {
        this.name = name;
    }

    public void addChild(ASTNode child) {
        children.add(child);
    }

    public void print(String indent) {
        System.out.println(indent + "- " + name);
        for (ASTNode c : children) {
            c.print(indent + "  ");
        }
    }
}
