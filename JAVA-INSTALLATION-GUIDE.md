# Java Installation Guide for Railway Reservation Project

## Current Status ✅
- ✅ **Database**: MySQL database "Railway" is set up and ready
- ✅ **Project**: Source code is configured with correct database credentials  
- ❌ **Java**: Not installed (required for compilation and running)
- ❌ **Tomcat**: Not installed (required for web server)

## Step 1: Install Java JDK

### Option A: Oracle JDK (Recommended)
1. **Download**: Go to https://www.oracle.com/java/technologies/downloads/
2. **Choose**: Java 17 or Java 21 (LTS versions)
3. **Select**: Windows x64 Installer (.msi)
4. **Install**: Run the downloaded .msi file with default settings

### Option B: OpenJDK (Free Alternative)
1. **Download**: Go to https://jdk.java.net/ or https://adoptium.net/
2. **Choose**: Latest LTS version (17 or 21)
3. **Select**: Windows x64 msi installer
4. **Install**: Run installer with default settings

### Option C: Amazon Corretto (AWS's JDK)
1. **Download**: Go to https://aws.amazon.com/corretto/
2. **Choose**: Java 17 or 21
3. **Select**: Windows x64 msi
4. **Install**: Run installer

## Step 2: Configure Java PATH

After installation, add Java to your system PATH:

### Method 1: Automatic (if installer didn't do it)
1. Press `Windows Key + R`
2. Type `sysdm.cpl` and press Enter
3. Click "Advanced" tab
4. Click "Environment Variables"
5. Under "System variables", find and select "Path"
6. Click "Edit"
7. Click "New"
8. Add: `C:\Program Files\Java\jdk-17\bin` (adjust version number)
9. Click "OK" to save all dialogs

### Method 2: PowerShell (Quick Test)
```powershell
# Test if Java is in a common location
Get-ChildItem "C:\Program Files\Java" -Recurse -Name "java.exe" | Select-Object -First 1
```

## Step 3: Verify Java Installation

Open a **new** PowerShell window and run:
```powershell
java -version
javac -version
```

You should see output like:
```
java version "17.0.x" 2023-xx-xx
Java(TM) SE Runtime Environment (build 17.0.x+xx-xxx)
Java HotSpot(TM) 64-Bit Server VM (build 17.0.x+xx-xxx, mixed mode, sharing)
```

## Step 4: Install Apache Tomcat

1. **Download**: Go to https://tomcat.apache.org/download-90.cgi
2. **Choose**: "32-bit/64-bit Windows Service Installer"
3. **Install**: Run the installer
   - Choose installation directory (e.g., `C:\Program Files\Apache Software Foundation\Tomcat 9.0`)
   - Set admin username/password for Tomcat Manager
   - Choose to install as Windows service

## Step 5: Download MySQL Connector

1. **Download**: Go to https://dev.mysql.com/downloads/connector/j/
2. **Choose**: "Platform Independent" ZIP file
3. **Extract**: The mysql-connector-java-8.x.x.jar file
4. **Save**: Keep this JAR file handy for later

## Step 6: Choose Development Method

### Option A: Eclipse IDE (Easiest)
1. **Download**: Eclipse IDE for Enterprise Java and Web Developers
   - Go to: https://www.eclipse.org/downloads/
2. **Install**: Extract and run Eclipse
3. **Import Project**: File → Import → Existing Projects into Workspace
4. **Add MySQL JAR**: Right-click project → Properties → Java Build Path → Libraries → Add External JARs
5. **Configure Tomcat**: Window → Preferences → Server → Runtime Environments → Add
6. **Deploy**: Right-click project → Run As → Run on Server

### Option B: Manual Compilation (Advanced)
After Java is installed, you can compile manually:
```powershell
# Navigate to project
cd Railway-Reservation-main\Railway

# Create build directory
mkdir build\classes -Force

# Copy MySQL connector to lib
# (Copy mysql-connector-java-8.x.x.jar to src\main\webapp\WEB-INF\lib\)

# Compile all Java files
javac -cp "src/main/webapp/WEB-INF/lib/*" -d build/classes src/main/java/**/*.java

# Create deployable WAR file
jar -cvf Railway.war -C src/main/webapp .
jar -uvf Railway.war -C build/classes .

# Deploy to Tomcat webapps folder
```

## Step 7: Access Your Application

After deployment:
- **Home**: http://localhost:8080/Railway/
- **User Login**: http://localhost:8080/Railway/SignUp/login.jsp
- **Admin Login**: http://localhost:8080/Railway/Admin/AdminLogin.jsp

### Login Credentials:
- **User**: testuser / password123
- **Admin**: admin / admin123

## Troubleshooting

### "java not recognized"
- Restart PowerShell after installing Java
- Check PATH environment variable includes Java bin directory
- Try absolute path: `"C:\Program Files\Java\jdk-17\bin\java.exe" -version`

### "Could not find or load main class"
- Ensure CLASSPATH includes MySQL connector JAR
- Check all Java files compiled without errors

### "Connection refused" or database errors
- Verify MySQL service is running
- Check database credentials in DbConnection.java files
- Test database connection: `mysql -u root -p`

## Quick Start Summary

1. ⬬ **Install Java JDK** (choose Oracle, OpenJDK, or Corretto)
2. ⚙️ **Add Java to PATH** (environment variables)
3. ✅ **Verify**: `java -version` works in new PowerShell
4. ⬬ **Install Tomcat** (Windows Service Installer)
5. ⬬ **Download MySQL Connector JAR**
6. 🔧 **Use Eclipse IDE** for easy development
7. 🚀 **Deploy and test** the application

Your database is already set up and ready! Once Java is installed, you'll be able to run the Railway Reservation System.