package ui;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class FrontendMessageCheck 
{

    public static void main(String[] args) throws InterruptedException 
    {
    		// Setup WebDriver
    		WebDriverManager.chromedriver().setup();
    		WebDriver driver = new ChromeDriver();

            // Open the frontend application
            driver.get("http://your-frontend-url.com");  //Replace `"http://your-frontend-url.com"` with the actual URL of your frontend application.
            Thread.sleep(2000);

            // Locate the element displaying the message
            //Replace `"messageDisplay"` with the actual `id` or `xpath`` attributes of your HTML elements.
            WebElement messageElement = driver.findElement(By.id("messageDisplay"));

            // Get the displayed message
            String displayedMessage = messageElement.getText();

            // Expected message from the backend
            String expectedMessage = "Hello from the Backend!";

            // Check if the displayed message matches the expected message
            if (displayedMessage.equals(expectedMessage)) 
            {
                System.out.println("Test Passed: The message is displayed correctly.");
            } 
            else 
            {
                System.out.println("Test Failed: The message is not displayed correctly.");
                System.out.println("Expected: " + expectedMessage);
                System.out.println("Found: " + displayedMessage);
            }
            
            // Close the browser
            driver.quit();
    }
}