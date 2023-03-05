public class Hamster extends Pet {

    private String color;
    private String furLength;

    public Hamster(String name, int age, String color, String furLength) {
        this.name = name;
        this.age = age;
        this.color = color;
        this.furLength = furLength;

    }

    void run(String action) {
        if (action == "Поставить в колесо")
            System.out.println("Хомяк начинает бежать в колесе");
        else System.out.println("Хомяк прячется в домике");
    }

    void play(String action) {
        if (action == "Дать игрушку")
            System.out.println("Хомяк начинает играть с игрушкой");
        else System.out.println("Хомяк прячется в домике");
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
        return "Hamster{" +
                "name='" + name + '\'' +
                "age='" + age + '\'' +
                "color='" + color + '\'' +
                ", hairLength='" + furLength + '\'' +
                '}';
    }
}
