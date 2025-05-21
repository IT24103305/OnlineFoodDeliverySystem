package model;

import java.io.*;
import java.util.*;

public class FoodManager {
    private static final String FILE_PATH = "C:/FoodDeliveryData/fooditems.txt"; // Replace with actual path

    public static void addFoodItem(FoodItem item) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = item.getFoodId() + "|" + item.getName() + "|" + item.getDescription().replace("|", "/") + "|" + item.getCategory() + "|" + item.getPrice();
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<FoodItem> getAllFoodItems() {
        List<FoodItem> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 5) {
                    String id = parts[0], name = parts[1], desc = parts[2], category = parts[3];
                    double price = Double.parseDouble(parts[4]);
                    FoodItem item = ("Drinks".equalsIgnoreCase(category)) ? new Drink(id, name, desc, category, price)
                            : new Meal(id, name, desc, category, price);
                    list.add(item);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }
}