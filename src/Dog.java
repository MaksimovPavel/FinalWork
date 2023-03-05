public class Dog extends Pet {

    private String color;
    private String furLength;

    public Dog(String name, int age, String color, String furLength) {
        this.name = name;
        this.age = age;
        this.color = color;
        this.furLength = furLength;
    }

    public void bark(String command) {
        if (command == "Голос!")
            System.out.println("Собака лаит по команде");
        else System.out.println("Собака не знает команду");
    }

    public void seat(String command) {
        if (command == "Сидеть!")
            System.out.println("Собака садится по команде");
        else System.out.println("Собака не знает команду");
    }

    public void teachCommand() {
        System.out.println("Отправить собаку на дрессировку");
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getFurLength() {
        return furLength;
    }

    public void setFurLength(String furLength) {
        this.furLength = furLength;
    }

    @Override
    public String toString() {
        return "Dog{" +
                "name='" + name + '\'' +
                "age='" + age + '\'' +
                "color='" + color + '\'' +
                ", hairLength='" + furLength + '\'' +
                '}';
    }
}