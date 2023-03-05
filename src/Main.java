import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Введите, пожалуйста, вид домашнего животного:\n" +
                "1 - собака \n2 - кошка \n3 - хомяк");
        try {
            int pet = scanner.nextInt();
            switch (pet) {
                case 1:
                    System.out.println("Введите, пожалуйста поочередно:\n" +
                            "- кличку собаки\n- возраст собаки(в месяцах)\n- цвет шерсти\n" +
                            "- длину шерсти(короткая, средняя, длинная)");
                    String dogName = scanner.next();
                    int dogAge = scanner.nextInt();
                    String dogColor = scanner.next();
                    String dogHairLength = scanner.next();
                    Dog dog = new Dog(dogName, dogAge, dogColor, dogHairLength);
                    System.out.println("В реестр домашних животных введены данные нового питомца:");
                    System.out.println(dog);
                    System.out.println("Собака умеет выполнять команды:\n" +
                            "- лаять\n" +
                            "- сидеть\n" +
                            "Хотите обучить собаку новой команде? (y/n)");
                    String teach = scanner.next();
                    if (teach.equalsIgnoreCase("y")) dog.teachCommand();
                    else if (teach.equalsIgnoreCase("n")) System.out.println("Завершаем работу реестра");
                    else System.out.println("Введите корректные данные!");
                    break;
                case 2:
                    System.out.println("Введите, пожалуйста поочередно:\n" +
                            "- кличку кошки\n- возраст кошки(в месяцах)\n- цвет шерсти\n" +
                            "- длину шерсти(короткая, средняя, длинная)");
                    String catName = scanner.next();
                    int catAge = scanner.nextInt();
                    String catColor = scanner.next();
                    String catHairLength = scanner.next();
                    Cat cat = new Cat(catName, catAge, catColor, catHairLength);
                    System.out.println("В реестр домашних животных введены данные нового питомца:");
                    System.out.println(cat);
                    break;
                case 3:
                    System.out.println("Введите, пожалуйста поочередно:\n" +
                            "- кличку хомяка\n- возраст хомяка(в месяцах)\n- цвет шерсти\n" +
                            "- длину шерсти(короткая, средняя, длинная)");
                    String hamsterName = scanner.next();
                    int hamsterAge = scanner.nextInt();
                    String hamsterColor = scanner.next();
                    String hamsterHairLength = scanner.next();
                    Hamster hamster = new Hamster(hamsterName, hamsterAge, hamsterColor, hamsterHairLength);
                    System.out.println("В реестр домашних животных введены данные нового питомца:");
                    System.out.println(hamster);
                    break;
                default:
                    System.out.println("Введите корректные данные!");
            }
        } catch (Exception e) {
            System.out.println("Введите корректные данные!");
        }
    }
}