package controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import model.FoodItem;


public class FoodManager {
    private static final String FILE_PATH = "C:/FoodDeliveryData/fooditems.txt"; // Change to your absolute path

    public static void addFoodItem(FoodItem item) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = item.getFoodId() + "|" +
                    item.getName() + "|" +
                    item.getDescription() + "|" +
                    item.getCategory() + "|" +
                    item.getPrice();
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<FoodItem> getAllFoodItems() {
        List<FoodItem> itemList = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 5) { // Now expecting exactly 4 parts
                    String id = parts[0];
                    String name = parts[1];
                    String discription = parts[2];
                    String category = parts[3];
                    double price = Double.parseDouble(parts[4]);
                    // Assuming you have a FoodItem constructor that takes 4 params.
                    itemList.add(new FoodItem(id, name,discription, category, price));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return itemList;
    }
    public static FoodItem getFoodById(String foodId) {
        List<FoodItem> list = getAllFoodItems();
        for (FoodItem item : list) {
            if (item.getFoodId().equalsIgnoreCase(foodId)) {
                return item;
            }
        }
        return null;
    }

    public static void updateFoodItem(FoodItem updatedItem) {
        List<FoodItem> items = getAllFoodItems();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (FoodItem item : items) {
                if (item.getFoodId().equalsIgnoreCase(updatedItem.getFoodId())) {
// write updated item
                    bw.write(updatedItem.getFoodId() + "|" + updatedItem.getName() + "|" +
                            updatedItem.getDescription().replace("|", "/") + "|" +
                            updatedItem.getCategory() + "|" + updatedItem.getPrice());
                } else {
// write original item
                    bw.write(item.getFoodId() + "|" + item.getName() + "|" +
                            item.getDescription().replace("|", "/") + "|" +
                            item.getCategory() + "|" + item.getPrice());
                }
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static void deleteFoodItem(String foodId) {
        List<FoodItem> items = getAllFoodItems();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (FoodItem item : items) {
                if (!item.getFoodId().equalsIgnoreCase(foodId)) {
                    String line = item.getFoodId() + "|" + item.getName() + "|" +
                            item.getDescription().replace("|", "/") + "|" +
                            item.getCategory() + "|" + item.getPrice();
                    bw.write(line);
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<FoodItem> searchFoodItems(String keyword) {
        List<FoodItem> result = new ArrayList<>();
        for (FoodItem item : getAllFoodItems()) {
            if (item.getName().toLowerCase().contains(keyword.toLowerCase()) ||
                    item.getCategory().toLowerCase().contains(keyword.toLowerCase())) {
                result.add(item);
            }
        }
        return result;
    }
}
