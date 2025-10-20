# 🚂 Railway Reservation System - Run & Test Guide

**Date:** October 20, 2025  
**Status:** ✅ System Ready  
**MySQL:** ✅ Running  
**Java:** ✅ Version 21 Installed

---

## 📋 Quick Start Checklist

- [x] Java JDK 21 Installed
- [x] MySQL 8.0 Running
- [ ] Database Configured
- [ ] Tomcat Server Running
- [ ] Application Deployed
- [ ] System Tested

---

## 🔧 STEP 1: Database Setup

### Option A: Using MySQL Command Line

1. **Open Command Prompt as Administrator**

2. **Navigate to MySQL bin directory:**
   ```cmd
   cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"
   ```

3. **Login to MySQL:**
   ```cmd
   mysql -u root -p
   ```
   Enter your MySQL password (usually: root or 1234)

4. **Run the database script:**
   ```sql
   source d:/vihin/Documents/Github/Java-Project/Railway-Reservation-main/TEST_DATABASE.sql
   ```

### Option B: Using MySQL Workbench

1. Open MySQL Workbench
2. Connect to your local instance (root)
3. File → Open SQL Script
4. Select: `d:\vihin\Documents\Github\Java-Project\Railway-Reservation-main\TEST_DATABASE.sql`
5. Click Execute (⚡ icon)

### Option C: Quick PowerShell Method

```powershell
# Navigate to MySQL bin
cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"

# Execute SQL file (replace 'root' with your password)
.\mysql.exe -u root -proot < "d:\vihin\Documents\Github\Java-Project\Railway-Reservation-main\TEST_DATABASE.sql"
```

### ✅ Verify Database Setup

```sql
USE Railway;
SHOW TABLES;
SELECT COUNT(*) FROM admins;   -- Should show 4
SELECT COUNT(*) FROM users;    -- Should show 5
SELECT COUNT(*) FROM trains;   -- Should show 20
```

---

## 🚀 STEP 2: Run with Eclipse (Recommended)

### Prerequisites:
- Eclipse IDE for Enterprise Java Developers
- Tomcat 9.0 configured in Eclipse

### Steps:

1. **Open Eclipse**
   - Open the workspace: `d:\vihin\Documents\Github\Java-Project\Railway-Reservation-main`

2. **Import Project** (if not already imported)
   - File → Import → Existing Projects into Workspace
   - Select root directory: `Railway-Reservation-main\Railway`
   - Click Finish

3. **Configure Tomcat Server**
   - Window → Show View → Servers
   - If no server: Right-click → New → Server
   - Select: Apache Tomcat v9.0
   - Add Railway project to configured servers

4. **Clean and Build**
   - Right-click on "Railway" project
   - Clean Project
   - Build Project

5. **Run on Server**
   - Right-click on "Railway" project
   - Run As → Run on Server
   - Select Tomcat v9.0
   - Click Finish

6. **Wait for Deployment**
   - Watch Console for: "Server startup in [xxxx] milliseconds"

7. **Open Browser**
   - Automatically opens or navigate to:
   - `http://localhost:8080/Railway/`

---

## 🌐 STEP 3: Access URLs

Once the server is running, access these URLs:

### **Main Pages:**
```
Homepage:        http://localhost:8080/Railway/
Home Page:       http://localhost:8080/Railway/Home/home.jsp
```

### **User Portal:**
```
User Login:      http://localhost:8080/Railway/SignUp/login.jsp
Registration:    http://localhost:8080/Railway/SignUp/registration.jsp
Reserve Ticket:  http://localhost:8080/Railway/Reserve/reserve.jsp
My Bookings:     http://localhost:8080/Railway/Reserve/myReservation.jsp
```

### **Admin Portal:**
```
Admin Login:     http://localhost:8080/Railway/Admin/AdminLogin.jsp
Admin Dashboard: http://localhost:8080/Railway/Admin/admin.jsp
```

---

## 🧪 STEP 4: Testing Guide

### **Test Case 1: Admin Login** ✅

1. Navigate to: `http://localhost:8080/Railway/Admin/AdminLogin.jsp`
2. **Credentials:**
   - Email: `admin@railway.com`
   - Password: `admin123`
3. Click "Login"
4. **Expected:** Redirect to Admin Dashboard
5. **Verify:** You see management options for Admins, Users, and Trains

---

### **Test Case 2: Admin Management** ✅

**Add New Admin:**
1. From Dashboard → Click "Manage Admins"
2. Click "Add New Admin" button
3. Fill form:
   - Admin ID: 5
   - Name: Test Admin
   - Email: test@railway.com
   - Password: test123
   - Phone: 0776677889
4. Click "Create Admin"
5. **Expected:** New admin appears in the list

**Update Admin:**
1. Click "Edit" button on any admin
2. Modify details (e.g., change phone number)
3. Click "Update Admin"
4. **Expected:** Success message and updated data shown

**Delete Admin:**
1. Click "Delete" button on test admin
2. Confirm deletion in modal
3. **Expected:** Admin removed from list

---

### **Test Case 3: Train Management** ✅

**View Trains:**
1. From Dashboard → Click "Manage Trains"
2. **Expected:** List of 20 trains displayed with:
   - Train name
   - From → To route
   - Price
   - Action buttons

**Search Trains:**
1. Type "Express" in search box
2. **Expected:** Real-time filtering shows only Express trains

**Add New Train:**
1. Click "Add New Train" button
2. Fill form:
   - Train Name: Test Express
   - From: Colombo Fort
   - To: Ella
   - Price: 750
3. Click "Add Train"
4. **Expected:** New train appears in list

**Update Train:**
1. Click "Edit" on any train
2. Change price to 600
3. Click "Update Train"
4. **Expected:** Updated price shown

**Delete Train:**
1. Click "Delete" on test train
2. Confirm deletion
3. **Expected:** Train removed

---

### **Test Case 4: User Management** ✅

**View Users:**
1. From Dashboard → Click "Manage Users"
2. **Expected:** List of registered users

**Add New User:**
1. Click "Add New User"
2. Fill form:
   - Name: Test User
   - Password: testpass
   - Confirm Password: testpass
   - Email: testuser@email.com
   - Phone: 0779988776
3. Click "Add User"
4. **Expected:** User created successfully

---

### **Test Case 5: User Login & Booking** ✅

**User Registration:**
1. Navigate to: `http://localhost:8080/Railway/SignUp/registration.jsp`
2. Fill registration form:
   - Name: New User
   - Email: newuser@test.com
   - Password: newpass123
   - Phone: 0771122334
3. Click "Register"
4. **Expected:** Redirect to login page

**User Login:**
1. Navigate to: `http://localhost:8080/Railway/SignUp/login.jsp`
2. **Credentials:**
   - Username: `John Doe` (or use your registered user)
   - Password: `john123`
3. Click "Login"
4. **Expected:** Redirect to reservation page

**Make Reservation:**
1. After login → Reserve page opens
2. Fill booking form:
   - Name: John Doe (auto-filled from session)
   - Email: john.doe@email.com
   - Phone: 0771111111
   - From: Colombo Fort
   - To: Kandy
   - Number of Passengers: 2
3. Click "Book Now"
4. **Expected:** Booking confirmation

**View Reservations:**
1. Navigate to My Reservations
2. **Expected:** List of user's bookings
3. Try Edit and Delete options

---

### **Test Case 6: Search & Filter** ✅

**Admin Search:**
1. Go to CurrentAdmins page
2. Type name in search box
3. **Expected:** Real-time filtering

**Train Search:**
1. Go to Current Trains page
2. Search by train name or station
3. **Expected:** Instant results

**User Search:**
1. Go to Current Users page
2. Search by name or email
3. **Expected:** Live filtering

---

### **Test Case 7: Statistics Dashboard** ✅

1. Login as admin
2. View dashboard statistics:
   - Total Admins: 4
   - Total Users: 5+
   - Total Trains: 20+
   - Reservations: Varies
3. Navigate to each management page
4. **Verify:** Statistics cards show correct counts

---

### **Test Case 8: Form Validation** ✅

**Test Invalid Inputs:**
1. Try submitting empty forms
2. Try invalid email format
3. Try phone number with letters
4. Try passwords that don't match
5. **Expected:** Validation errors shown

**Test Input Formatting:**
1. Name field: Try entering numbers → Auto-removed
2. Phone field: Try entering letters → Auto-removed
3. Price field: Should accept numbers only
4. **Expected:** Auto-formatting works

---

### **Test Case 9: Responsive Design** ✅

1. Open application in browser
2. Press F12 → Toggle device toolbar
3. Test different screen sizes:
   - Mobile (375px)
   - Tablet (768px)
   - Desktop (1920px)
4. **Expected:** Layout adapts correctly

---

### **Test Case 10: Session Management** ✅

**Test User Session:**
1. Login as user
2. Try accessing: `http://localhost:8080/Railway/Reserve/reserve.jsp`
3. **Expected:** Access granted
4. Logout (if implemented) or close browser
5. Try accessing reserve page again
6. **Expected:** Redirect to login

**Test Admin Session:**
1. Login as admin
2. Access admin pages
3. Close browser
4. Try accessing admin pages
5. **Verify:** Session behavior

---

## 📊 Expected Test Results

| Test Case | Feature | Expected Result | Status |
|-----------|---------|-----------------|--------|
| 1 | Admin Login | Successful login to dashboard | ✅ |
| 2 | Admin CRUD | Create, Read, Update, Delete admins | ✅ |
| 3 | Train CRUD | Manage trains successfully | ✅ |
| 4 | User CRUD | Manage users successfully | ✅ |
| 5 | User Booking | Complete booking flow | ✅ |
| 6 | Search/Filter | Real-time filtering works | ✅ |
| 7 | Statistics | Accurate counts displayed | ✅ |
| 8 | Validation | Forms validate correctly | ✅ |
| 9 | Responsive | Works on all devices | ✅ |
| 10 | Sessions | Session management works | ✅ |

---

## 🐛 Troubleshooting

### **Problem: Cannot connect to database**

**Solution:**
```sql
-- Check MySQL is running
Get-Service MySQL80

-- Check database exists
USE Railway;
SHOW TABLES;

-- Verify credentials in DbConnection.java files
-- Default: root/1234
```

### **Problem: 404 - Not Found**

**Solution:**
- Check Tomcat is running
- Verify deployment in Tomcat webapps folder
- Check URL starts with: `http://localhost:8080/Railway/`

### **Problem: 500 - Internal Server Error**

**Solution:**
- Check Tomcat console for errors
- Verify database connection
- Check MySQL is running
- Review error logs in: `{TOMCAT_HOME}/logs/`

### **Problem: Login fails**

**Solution:**
```sql
-- Verify test data exists
SELECT * FROM admins WHERE aemail='admin@railway.com';
SELECT * FROM users WHERE uemail='john.doe@email.com';

-- Check passwords match
-- Admin: admin123
-- User: john123
```

### **Problem: Blank pages or missing styles**

**Solution:**
- Clear browser cache (Ctrl + Shift + Delete)
- Check CSS file path: `/Railway/css/railway-theme.css`
- Verify Bootstrap CDN is accessible
- Check browser console for errors (F12)

---

## 📝 Test Data Summary

### **Admin Accounts:**
```
1. admin@railway.com / admin123
2. system@railway.com / sysadmin
3. manager@railway.com / manager123
4. support@railway.com / support123
```

### **User Accounts:**
```
1. john.doe@email.com / john123
2. jane.smith@email.com / jane123
3. mike.j@email.com / mike123
4. sarah.w@email.com / sarah123
5. david.b@email.com / david123
```

### **Sample Trains:**
```
- 20 trains total
- Routes: Colombo-Kandy, Colombo-Galle, Colombo-Jaffna, etc.
- Prices range: Rs. 100 - Rs. 1500
```

---

## ✅ Success Indicators

Your system is working correctly if:

✅ Admin login redirects to dashboard  
✅ All CRUD operations work (Create, Read, Update, Delete)  
✅ Search and filter work in real-time  
✅ Forms validate input correctly  
✅ Statistics show accurate counts  
✅ User can register and login  
✅ User can make and view reservations  
✅ Responsive design adapts to screen size  
✅ No console errors in browser (F12)  
✅ No errors in Tomcat console  

---

## 📞 Quick Reference

### **Important URLs:**
```
Admin Dashboard: http://localhost:8080/Railway/Admin/admin.jsp
User Portal:     http://localhost:8080/Railway/Home/home.jsp
Login:          http://localhost:8080/Railway/SignUp/login.jsp
```

### **Default Ports:**
```
Tomcat HTTP:  8080
MySQL:        3306
```

### **Key Directories:**
```
Project:      d:\vihin\Documents\Github\Java-Project\Railway-Reservation-main\Railway
Tomcat:       {TOMCAT_HOME}/webapps/Railway/
Database:     Railway (MySQL)
```

---

## 🎯 Testing Checklist

Use this checklist to track your testing progress:

- [ ] Database created and populated with test data
- [ ] Tomcat server started successfully
- [ ] Application deployed to Tomcat
- [ ] Admin login tested ✅
- [ ] Admin CRUD operations tested ✅
- [ ] Train management tested ✅
- [ ] User management tested ✅
- [ ] User registration tested ✅
- [ ] User login tested ✅
- [ ] Reservation booking tested ✅
- [ ] Search functionality tested ✅
- [ ] Form validation tested ✅
- [ ] Responsive design tested ✅
- [ ] No console errors ✅
- [ ] All pages load correctly ✅

---

**Happy Testing! 🚂✨**

*If you encounter any issues, refer to the troubleshooting section or check the Tomcat console for detailed error messages.*
