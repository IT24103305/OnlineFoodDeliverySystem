package algorithm;

import model.FoodItem;

public class QuickSort {
    public static void sort(FoodItem[] arr, int low, int high) {
        if (low < high) {
            int pi = partition(arr, low, high);
            sort(arr, low, pi - 1);
            sort(arr, pi + 1, high);
        }
    }

    private static int partition(FoodItem[] arr, int low, int high) {
        double pivot = arr[high].getPrice();
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (arr[j].getPrice() < pivot) {
                i++;
                FoodItem temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        FoodItem temp = arr[i + 1];
        arr[i + 1] = arr[high];
        arr[high] = temp;
        return i + 1;
    }
}
