public abstract class Animal {
    protected String body;
    protected int age;

    private void move() {
        System.out.println("Животное передвигается");
    }

    private void breathe() {
        System.out.println("Животное дышит");
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
