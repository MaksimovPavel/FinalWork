public class Cat extends Pet{
    private String color;
    private String furLength;

    public Cat(String name, int age, String color, String furLength) {
        this.name = name;
        this.age = age;
        this.color = color;
        this.furLength = furLength;
    }

    public void meow(String action) {
        if (action == "Показать Шебу")
            System.out.println("Кошка начинает радостно мяукать");
        else System.out.println("Кошка обиделась");
    }

    public void lay(String action) {
        if (action == "Почесать животик")
            System.out.println("Кошка ложитья на спину");
        else System.out.println("Кошка уходит");
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
        return "Cat{" +
                "name='" + name + '\'' +
                "age='" + age + '\'' +
                "color='" + color + '\'' +
                ", hairLength='" + furLength + '\'' +
                '}';
    }
}
