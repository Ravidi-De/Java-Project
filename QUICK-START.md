# Railway Reservation System - Quick Deployment Guide

## ✅ Current Status:
- ✅ Database setup completed successfully
- ✅ Sample data loaded (users, admin, trains)
- ✅ Database credentials updated to use password "1234"

## 🚀 Next Steps to Run the Project:

### Option 1: Using Eclipse IDE (Recommended for Development)

1. **Install Eclipse IDE for Enterprise Java and Web Developers**
   - Download from: https://www.eclipse.org/downloads/
   - Choose "Eclipse IDE for Enterprise Java and Web Developers"

2. **Import the Project**
   ```
   - Open Eclipse
   - File → Import → Existing Projects into Workspace
   - Browse to: Railway-Reservation-main/Railway
   - Click Finish
   ```

3. **Configure Tomcat in Eclipse**
   ```
   - Window → Preferences → Server → Runtime Environments
   - Add → Apache Tomcat v9.0
   - Browse to your Tomcat installation directory
   ```

4. **Add MySQL Connector**
   ```
   - Download mysql-connector-java-8.0.x.jar
   - Copy to: Railway/src/main/webapp/WEB-INF/lib/
   - Or add to project build path
   ```

5. **Run the Project**
   ```
   - Right-click project → Run As → Run on Server
   - Choose Tomcat 9.0
   - Access: http://localhost:8080/Railway/
   ```

### Option 2: Manual Command Line Deployment

1. **Install JDK and add to PATH**
   ```
   - Download JDK 8+ from Oracle or OpenJDK
   - Add bin directory to system PATH
   - Verify: java -version && javac -version
   ```

2. **Install and Configure Tomcat**
   ```
   - Download Tomcat 9.0 from Apache
   - Extract to C:\apache-tomcat-9.0.x
   - Set CATALINA_HOME environment variable
   ```

3. **Compile and Deploy**
   ```powershell
   # Navigate to project
   cd Railway-Reservation-main\Railway
   
   # Create directories
   mkdir build\classes -Force
   
   # Add MySQL connector to lib
   # Download and copy mysql-connector-java-8.0.x.jar to src\main\webapp\WEB-INF\lib\
   
   # Compile (requires proper classpath setup)
   javac -cp "src/main/webapp/WEB-INF/lib/*" -d build/classes src/main/java/**/*.java
   
   # Create WAR file
   jar -cvf Railway.war -C src/main/webapp .
   jar -uvf Railway.war -C build/classes .
   
   # Deploy to Tomcat
   copy Railway.war %CATALINA_HOME%\webapps\
   
   # Start Tomcat
   %CATALINA_HOME%\bin\startup.bat
   ```

### Option 3: Ready-to-Use Development Environment

If you want a quick setup, I recommend installing **Eclipse IDE** which comes with built-in Tomcat support and makes deployment much easier.

## 🔗 Application URLs (after deployment):

- **Home Page**: http://localhost:8080/Railway/
- **User Registration**: http://localhost:8080/Railway/SignUp/registration.jsp
- **User Login**: http://localhost:8080/Railway/SignUp/login.jsp
- **Admin Login**: http://localhost:8080/Railway/Admin/AdminLogin.jsp

## 🔑 Login Credentials:

**Regular User:**
- Username: `testuser`
- Password: `password123`

**Admin User:**
- Username: `admin`
- Password: `admin123`

## 📊 Database Information:

Your MySQL database "Railway" now contains:
- **3 sample users** (including testuser)
- **1 admin account**
- **8 train routes** (Colombo to various destinations)
- **2 sample reservations**

## 🛠️ Troubleshooting:

1. **Java not found**: Install JDK and add to PATH
2. **MySQL connection error**: Verify service is running and password is correct
3. **Port 8080 in use**: Change Tomcat port in server.xml
4. **ClassNotFoundException**: Ensure MySQL connector JAR is in classpath

## 📋 Required Downloads:

1. **Java JDK 8+**: https://www.oracle.com/java/technologies/downloads/
2. **Apache Tomcat 9.0**: https://tomcat.apache.org/download-90.cgi
3. **MySQL Connector/J**: https://dev.mysql.com/downloads/connector/j/
4. **Eclipse IDE** (optional): https://www.eclipse.org/downloads/

Would you like me to help you with any specific step?