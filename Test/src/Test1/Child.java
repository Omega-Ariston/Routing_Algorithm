package Test1;

public class Child extends Father {
    @Override
    public void test() {
        super.test();
        System.out.println("Child");
    }
}
