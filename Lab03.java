import java.util.Scanner;

//Question03

public class Lab03 {
    private String employeeId;
    private String name;
    private double basicSalary;
    private int performanceRating;
    private double bonus;

    public Lab03(String employeeId, String name, double basicSalary) {
        this.employeeId = employeeId;
        this.name = name;
        this.basicSalary = basicSalary;
        this.performanceRating = 0;
        this.bonus = 0.0;
    }

    public void setPerformanceRating(int rating) {
        if (rating >= 1 && rating <= 5) {
            this.performanceRating = rating;
        } else {
            throw new IllegalArgumentException("Performance rating must be between 1 and 5.");
        }
    }

    public void calculateBonus() {
        switch (this.performanceRating) {
            case 5:
                this.bonus = this.basicSalary * 0.20;
                break;
            case 4:
                this.bonus = this.basicSalary * 0.15;
                break;
            case 3:
                this.bonus = this.basicSalary * 0.10;
                break;
            case 2:
                this.bonus = this.basicSalary * 0.05;
                break;
            case 1:
            default:
                this.bonus = 0.0;
                break;
        }
    }

    public double calculateTotalSalary() {
        return this.basicSalary + this.bonus;
    }

    public void displayEmployeeDetails() {
        System.out.println("Employee Details:");
        System.out.println("- Employee ID: " + this.employeeId);
        System.out.println("- Name: " + this.name);
        System.out.printf("- Basic Salary: %.2f%n", this.basicSalary);
        System.out.println("- Performance Rating: " + this.performanceRating);
        System.out.printf("- Bonus: %.2f%n", this.bonus);
        System.out.printf("- Total Salary: %.2f%n", calculateTotalSalary());
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // user inputs
        System.out.print("Enter Employee ID: ");
        String employeeId = scanner.nextLine();

        System.out.print("Enter Employee Name: ");
        String name = scanner.nextLine();

        System.out.print("Enter Basic Salary: ");
        double basicSalary = scanner.nextDouble();

        Lab03 emp = new Lab03(employeeId, name, basicSalary);

        // Set performance rating
        System.out.print("Enter Performance Rating (1-5): ");
        int rating = scanner.nextInt();
        emp.setPerformanceRating(rating);

        // Calculate bonus
        emp.calculateBonus();

        // Display employee details
        emp.displayEmployeeDetails();
    }
}
