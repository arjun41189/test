# Frontend Message Display Test

This repository contains a Selenium-based automated test script written in Java to verify if the frontend correctly displays a message returned by the backend.

## Prerequisites

1. **Java Development Kit (JDK)**: Ensure you have JDK 8 or above installed.
2. **Maven**: Ensure Maven is installed for managing dependencies.
3. **Chrome Browser**: This script uses ChromeDriver to automate the Chrome browser.

## How to Setup & Run the test script

1. **Create a new Maven project & create a package like ui in an IDE of your choice like eclipse and Add Dependencies**:
    Ensure your `pom.xml` file contains the following dependencies:
  
    <dependencies>
		<!--
		https://mvnrepository.com/artifact/org.seleniumhq.selenium/selenium-java -->
		<dependency>
			<groupId>org.seleniumhq.selenium</groupId>
			<artifactId>selenium-java</artifactId>
			<version>4.21.0</version>
		</dependency>
		<!--
		https://mvnrepository.com/artifact/io.github.bonigarcia/webdrivermanager -->
		<dependency>
			<groupId>io.github.bonigarcia</groupId>
			<artifactId>webdrivermanager</artifactId>
			<version>5.8.0</version>
		</dependency>
    </dependencies>

2. **Update URL and Element IDs**:
    Open `FrontendMessageCheck.java` and update as below:
    - Replace `"http://your-frontend-url.com"` with the actual URL of your frontend application.
    - Replace `"messageDisplay"` with the actual `id` or `xpath`` attributes of your HTML elements.

3. **Run the script 
	Either using option in the panel above or right click and run as java application

## Understanding the Script:
The script performs the following steps:
1. **Setup WebDriver**: Initializes ChromeDriver using WebDriverManager.
2. **Open the frontend application**: Navigates to the specified URL.
3. **Wait for the message to be displayed**: Waits for the message to appear (using `Thread.sleep`).
4. **Locate the message element**: Finds the HTML element that displays the message.
5. **Get and verify the message**: Retrieves the text of the displayed message and compares it with the expected message.
6. **Output the result**: Prints whether the test passed or failed to the console.
7. **Close the browser**: Closes the browser after the test completes.

## Note:
Ensure ChromeDriver is compatible with the version of Chrome installed on your machine.