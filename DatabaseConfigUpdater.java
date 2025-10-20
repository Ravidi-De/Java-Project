import java.io.*;
import java.nio.file.*;
import java.util.Scanner;

/**
 * Configuration helper to update database credentials in all DbConnection files
 * Run this after installing MySQL to update connection details
 */
public class DatabaseConfigUpdater {
    
    private static final String[] DB_CONNECTION_FILES = {
        "src/main/java/Reservation/DbConnection.java",
        "src/main/java/UpdateAdmin/DbConnection.java", 
        "src/main/java/UpdateTrains/DbConnection.java",
        "src/main/java/Updateusers/DbConnection.java"
    };
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("=== Railway Reservation Database Configuration ===");
        System.out.println();
        
        System.out.print("Enter MySQL username (default: root): ");
        String username = scanner.nextLine();
        if (username.trim().isEmpty()) {
            username = "root";
        }
        
        System.out.print("Enter MySQL password: ");
        String password = scanner.nextLine();
        
        System.out.print("Enter MySQL host (default: localhost): ");
        String host = scanner.nextLine();
        if (host.trim().isEmpty()) {
            host = "localhost";
        }
        
        System.out.print("Enter MySQL port (default: 3306): ");
        String port = scanner.nextLine();
        if (port.trim().isEmpty()) {
            port = "3306";
        }
        
        String newUrl = "jdbc:mysql://" + host + ":" + port + "/Railway";
        
        System.out.println();
        System.out.println("Updating configuration:");
        System.out.println("URL: " + newUrl);
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println();
        
        // Update all DbConnection files
        for (String filePath : DB_CONNECTION_FILES) {
            try {
                updateDbConnectionFile(filePath, newUrl, username, password);
                System.out.println("✓ Updated: " + filePath);
            } catch (IOException e) {
                System.out.println("✗ Failed to update: " + filePath + " - " + e.getMessage());
            }
        }
        
        System.out.println();
        System.out.println("Configuration update completed!");
        System.out.println("Now you can compile and run the project.");
        
        scanner.close();
    }
    
    private static void updateDbConnectionFile(String filePath, String url, String username, String password) throws IOException {
        Path path = Paths.get(filePath);
        if (!Files.exists(path)) {
            throw new IOException("File not found: " + filePath);
        }
        
        String content = Files.readString(path);
        
        // Replace URL
        content = content.replaceAll(
            "String url = \"jdbc:mysql://.*?\";",
            "String url = \"" + url + "\";"
        );
        
        // Replace username
        content = content.replaceAll(
            "String db_uname = \".*?\";",
            "String db_uname = \"" + username + "\";"
        );
        
        // Replace password
        content = content.replaceAll(
            "String db_password = \".*?\";",
            "String db_password = \"" + password + "\";"
        );
        
        Files.writeString(path, content);
    }
}