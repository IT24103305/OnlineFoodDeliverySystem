package user_manager;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private String filePath;

    // Constructor: Accepts the file path (e.g., "users.txt")
    public FileHandler(String filePath) {
        this.filePath = filePath;
        ensureFileExists();
    }

    /**
     * Ensures that the file exists. If it doesn't, creates a new file.
     */
    public void ensureFileExists() {
        File file = new File(filePath);
        try {
            if (!file.exists()) {
                if (file.createNewFile()) {
                    System.out.println("File created: " + filePath);
                } else {
                    System.out.println("File could not be created: " + filePath);
                }
            }
        } catch (IOException e) {
            System.out.println("Error ensuring file exists: " + e.getMessage());
        }
    }

    /**
     * Reads all the lines from the file and returns them as a list of strings.
     *
     * @return List of lines from the file.
     */
    public List<String> readAllLines() {
        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                lines.add(line);
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }
        return lines;
    }

    /**
     * Writes the provided list of lines to the file, overwriting existing content.
     *
     * @param lines The list of lines to write.
     */
    public void writeAllLines(List<String> lines) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error writing file: " + e.getMessage());
        }
    }

    /**
     * Appends a single line to the file.
     *
     * @param line The line to append.
     */
    public void appendLine(String line) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error appending to file: " + e.getMessage());
        }
    }
}
