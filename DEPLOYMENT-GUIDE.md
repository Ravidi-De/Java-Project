# Railway Reservation System - Complete Deployment Guide

## Quick Start (Step-by-Step)

### Phase 1: Install Required Software

#### 1. Install Java JDK
```bash
# Download JDK 19+ from Oracle or OpenJDK
# For Windows: Download .msi installer
# After installation, verify:
java -version
javac -version
```

#### 2. Install MySQL
```bash
# Download MySQL Community Server
# For Windows: Download MySQL Installer
# During installation:
# - Set root password (remember this!)
# - Install MySQL Server and MySQL Workbench
# After installation, verify:
mysql --version
```

#### 3. Install Apache Tomcat 9.0
```bash
# Download from: https://tomcat.apache.org/download-90.cgi
# Extract to: C:\apache-tomcat-9.0.x
# Set environment variable: CATALINA_HOME=C:\apache-tomcat-9.0.x
```

### Phase 2: Database Setup

#### 1. Start MySQL Service
```powershell
# Windows: Start MySQL service
net start mysql
# Or use MySQL Workbench
```

#### 2. Create Database
```bash
# Connect to MySQL
mysql -u root -p

# Run the provided SQL script
mysql -u root -p < database-setup.sql
```

#### Alternative: Manual Database Creation
```sql
CREATE DATABASE Railway;
USE Railway;

-- Copy and paste the SQL from database-setup.sql
```

### Phase 3: Project Configuration

#### 1. Update Database Credentials
```bash
# Option A: Use the configuration helper
javac DatabaseConfigUpdater.java
java DatabaseConfigUpdater

# Option B: Manual update
# Edit each DbConnection.java file and update:
# - String url = "jdbc:mysql://localhost:3306/Railway";
# - String db_uname = "your_mysql_username";
# - String db_password = "your_mysql_password";
```

#### 2. Required JAR Files
Ensure these JAR files are in your classpath:
- `mysql-connector-java-8.0.x.jar` (MySQL JDBC driver)
- Servlet API JARs (usually provided by Tomcat)

### Phase 4: Build and Deploy

#### Option A: Using Eclipse IDE
1. Import project into Eclipse
2. Configure Tomcat server in Eclipse
3. Add project to server
4. Right-click project → Run As → Run on Server

#### Option B: Manual Compilation and Deployment
```powershell
# Navigate to project directory
cd Railway-Reservation-main\Railway

# Create build directories
mkdir build\classes

# Compile Java files (add required JARs to classpath)
javac -cp "path\to\mysql-connector.jar;path\to\servlet-api.jar" -d build\classes src\main\java\**\*.java

# Create WAR file
jar -cvf Railway.war -C src\main\webapp .
jar -uvf Railway.war -C build\classes .

# Deploy to Tomcat
copy Railway.war %CATALINA_HOME%\webapps\

# Start Tomcat
%CATALINA_HOME%\bin\startup.bat
```

### Phase 5: Access the Application

#### 1. Start Tomcat Server
```bash
# Start Tomcat
cd %CATALINA_HOME%\bin
startup.bat

# Check if server started successfully
# Look for "Server startup in [xxxx] ms" in logs
```

#### 2. Access URLs
- **Home Page**: http://localhost:8080/Railway/
- **User Registration**: http://localhost:8080/Railway/SignUp/registration.jsp
- **User Login**: http://localhost:8080/Railway/SignUp/login.jsp
- **Admin Login**: http://localhost:8080/Railway/Admin/AdminLogin.jsp

#### 3. Test Credentials
```
User Login:
- Username: testuser
- Password: password123

Admin Login:
- Username: admin
- Password: admin123
```

## Troubleshooting

### Common Issues and Solutions

#### 1. "Java not recognized"
```bash
# Add Java to PATH environment variable
# Windows: Add C:\Program Files\Java\jdk-19\bin to PATH
```

#### 2. "MySQL connection failed"
```bash
# Check MySQL service is running
net start mysql

# Verify credentials in DbConnection.java files
# Test connection manually:
mysql -u root -p
```

#### 3. "ClassNotFoundException: com.mysql.cj.jdbc.Driver"
```bash
# Download MySQL Connector/J from:
# https://dev.mysql.com/downloads/connector/j/
# Add mysql-connector-java-x.x.x.jar to classpath
```

#### 4. "Port 8080 already in use"
```bash
# Change Tomcat port in:
# %CATALINA_HOME%\conf\server.xml
# Find <Connector port="8080" and change to 8081 or another port
```

#### 5. "404 Not Found"
```bash
# Ensure WAR file is deployed correctly
# Check %CATALINA_HOME%\webapps\Railway\ exists
# Check Tomcat logs in %CATALINA_HOME%\logs\
```

### Development Tips

1. **Hot Deployment**: Copy updated JSP files directly to webapps/Railway/
2. **Debugging**: Check Tomcat logs in logs/catalina.out
3. **Database**: Use MySQL Workbench for easy database management
4. **IDE Setup**: Import as "Existing Project" in Eclipse

## Project Structure After Setup

```
Railway-Reservation-main/
├── Railway/
│   ├── src/main/
│   │   ├── java/           # Java source files
│   │   └── webapp/         # Web content (JSP, CSS, JS)
│   ├── build/classes/      # Compiled class files
│   └── Railway.war         # Deployable WAR file
├── database-setup.sql      # Database creation script
├── setup-instructions.md   # This file
├── DatabaseConfigUpdater.java  # Config helper
└── setup.bat              # Windows setup script
```

## Security Notes

⚠️ **Important**: This is a learning project with basic security. For production use:
- Implement password hashing
- Add input validation
- Use prepared statements consistently
- Implement proper session management
- Add HTTPS support