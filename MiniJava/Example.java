class Example {
    public static void main(String[] args) {
        System.out.println(new Test().sum(3, 4));
    }
}

class Test {
    public int sum(int a, int b) {
        int result;
        result = a + b;
        return result;
    }
}
