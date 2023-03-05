public abstract class Sumpter extends Animal {

    protected String name;
    protected int carryingCapacity;

    private void carryCargo() {
        System.out.println("Животное перевозит груз");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}