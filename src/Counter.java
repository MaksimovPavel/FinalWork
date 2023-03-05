import java.io.IOException;

public class Counter implements AutoCloseable {

    private int count = 0;

    public void add() {
        if (Registry.clickButton().equals("Завести новое животное"))
            count++;
    }

    @Override
    public void close() throws IOException {
        if (Registry.fillFieldsOfAnimal().equals("Все поля животного заполнены"))
            System.out.println("Счетчик закрыт");
        else throw new IOException();
    }

}