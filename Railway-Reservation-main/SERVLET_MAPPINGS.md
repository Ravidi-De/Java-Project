# Railway Reservation System - Complete Servlet Mappings

## 📋 Overview
This document lists all servlet mappings configured in the Railway Reservation System. All servlets are properly registered in `web.xml` and ready to use.

---

## 🔐 Authentication & Registration

### User Login
- **Servlet:** `LoginServlet`
- **Class:** `Railway.registration.LoginServlet`
- **URL:** `/Railway/LoginServlet`
- **Method:** POST
- **Usage:** User login authentication

### User Registration
- **Servlet:** `Register`
- **Class:** `Railway.registration.Register`
- **URL:** `/Railway/Register`
- **Method:** POST
- **Usage:** New user registration

### Admin Login
- **Servlet:** `LOGINADMIN`
- **Class:** `Admin.Login.LOGINADMIN`
- **URL:** `/Railway/LOGINADMIN`
- **Method:** POST
- **Usage:** Administrator login authentication

---

## 👥 Admin Management (UpdateAdmin Package)

### View Current Admins
- **Servlet:** `Curent_sv`
- **Class:** `UpdateAdmin.Curent_sv`
- **URL:** `/Railway/Curent_sv`
- **Method:** GET
- **Usage:** Display list of all administrators

### Add New Admin
- **Servlet:** `updateAdmins`
- **Class:** `UpdateAdmin.updateAdmins`
- **URL:** `/Railway/updateAdmins`
- **Method:** POST
- **Usage:** Create new administrator account

### Update Admin Data
- **Servlet:** `Update_admin_data_sev`
- **Class:** `UpdateAdmin.Update_admin_data_sev`
- **URL:** `/Railway/Update_admin_data_sev`
- **Method:** GET
- **Usage:** Update existing administrator information

### Delete Admin
- **Servlet:** `Del_admin_suv`
- **Class:** `UpdateAdmin.Del_admin_suv`
- **URL:** `/Railway/Del_admin_suv`
- **Method:** GET
- **Usage:** Remove administrator from system

---

## 🚂 Train Management (UpdateTrains Package)

### View Current Trains
- **Servlet:** `Cur_train_sev`
- **Class:** `UpdateTrains.Cur_train_sev`
- **URL:** `/Railway/Cur_train_sev`
- **Method:** GET
- **Usage:** Display list of all trains

### Add New Train
- **Servlet:** `InsertTrainServlet`
- **Class:** `UpdateTrains.InsertTrainServlet`
- **URL:** `/Railway/InsertTrainServlet`
- **Method:** POST
- **Usage:** Add new train to the system

### Update Train Details
- **Servlet:** `Update_trains_sev`
- **Class:** `UpdateTrains.Update_trains_sev`
- **URL:** `/Railway/Update_trains_sev`
- **Method:** GET
- **Usage:** Modify existing train information

### Delete Train
- **Servlet:** `Deleter_train_sev`
- **Class:** `UpdateTrains.Deleter_train_sev`
- **URL:** `/Railway/Deleter_train_sev`
- **Method:** GET
- **Usage:** Remove train from the system

---

## 👤 User Management (Updateusers Package)

### View Current Users
- **Servlet:** `Curent_servlet`
- **Class:** `Updateusers.Curent_servlet`
- **URL:** `/Railway/Curent_servlet`
- **Method:** GET
- **Usage:** Display list of all registered users

### Add New User
- **Servlet:** `AddUser_servlet`
- **Class:** `Updateusers.AddUser_servlet`
- **URL:** `/Railway/AddUser_servlet`
- **Method:** POST
- **Usage:** Create new user account (admin function)

### Update User Information
- **Servlet:** `Update_suv`
- **Class:** `Updateusers.Update_suv`
- **URL:** `/Railway/Update_suv`
- **Method:** GET
- **Usage:** Modify existing user information

### Delete User
- **Servlet:** `Delete_use_sev`
- **Class:** `Updateusers.Delete_use_sev`
- **URL:** `/Railway/Delete_use_sev`
- **Method:** GET
- **Usage:** Remove user from the system

---

## 🎫 Reservation Management (Reservation Package)

### Search Available Trains
- **Servlet:** `Train_res`
- **Class:** `Reservation.Train_res`
- **URL:** `/Railway/Train_res`
- **Method:** GET/POST
- **Usage:** Search for available trains based on criteria

### Create New Reservation
- **Servlet:** `insertReserve`
- **Class:** `Reservation.insertReserve`
- **URL:** `/Railway/insertReserve`
- **Method:** POST
- **Usage:** Book a new train reservation

### View My Reservations
- **Servlet:** `My_res_sv`
- **Class:** `Reservation.My_res_sv`
- **URL:** `/Railway/My_res_sv`
- **Method:** GET
- **Usage:** Display user's current reservations

### Update Reservation
- **Servlet:** `Update_reservation_sev`
- **Class:** `Reservation.Update_reservation_sev`
- **URL:** `/Railway/Update_reservation_sev`
- **Method:** GET
- **Usage:** Modify existing reservation details

### Delete Reservation
- **Servlet:** `Del_reser_sev`
- **Class:** `Reservation.Del_reser_sev`
- **URL:** `/Railway/Del_reser_sev`
- **Method:** GET
- **Usage:** Cancel a reservation

---

## 🔧 Troubleshooting

### If You Get 404 Errors:

1. **Check Tomcat is Running**
   - Verify server status in Eclipse Servers tab
   - Ensure no port conflicts (default: 8080)

2. **Restart Tomcat After Changes**
   - Stop the server
   - Clean the project and server
   - Restart the server

3. **Verify URL Patterns**
   - Always use format: `/Railway/ServletName`
   - Example: `/Railway/Register`, not `/Register`

4. **Check Servlet Compilation**
   - Ensure .class files exist in `build/classes/` folder
   - Rebuild project if necessary

5. **Verify web.xml Deployment**
   - Check `web.xml` is in `WEB-INF` folder
   - Ensure no XML syntax errors
   - Verify servlet class paths match actual package structure

---

## 📝 Quick Reference Table

| Feature | Servlet URL | Method | Description |
|---------|------------|--------|-------------|
| User Login | `/Railway/LoginServlet` | POST | Authenticate user |
| User Register | `/Railway/Register` | POST | Create new user |
| Admin Login | `/Railway/LOGINADMIN` | POST | Authenticate admin |
| View Admins | `/Railway/Curent_sv` | GET | List all admins |
| Add Admin | `/Railway/updateAdmins` | POST | Create admin |
| Update Admin | `/Railway/Update_admin_data_sev` | GET | Modify admin |
| Delete Admin | `/Railway/Del_admin_suv` | GET | Remove admin |
| View Trains | `/Railway/Cur_train_sev` | GET | List all trains |
| Add Train | `/Railway/InsertTrainServlet` | POST | Create train |
| Update Train | `/Railway/Update_trains_sev` | GET | Modify train |
| Delete Train | `/Railway/Deleter_train_sev` | GET | Remove train |
| View Users | `/Railway/Curent_servlet` | GET | List all users |
| Add User | `/Railway/AddUser_servlet` | POST | Create user |
| Update User | `/Railway/Update_suv` | GET | Modify user |
| Delete User | `/Railway/Delete_use_sev` | GET | Remove user |
| Search Trains | `/Railway/Train_res` | GET/POST | Find trains |
| Book Ticket | `/Railway/insertReserve` | POST | Make reservation |
| My Bookings | `/Railway/My_res_sv` | GET | View reservations |
| Update Booking | `/Railway/Update_reservation_sev` | GET | Modify reservation |
| Cancel Booking | `/Railway/Del_reser_sev` | GET | Cancel reservation |

---

## 🎯 Development Notes

### Adding New Servlets
When adding new servlets to the project:

1. Create the servlet class with proper package
2. Add servlet definition in `web.xml`:
   ```xml
   <servlet>
     <servlet-name>YourServletName</servlet-name>
     <servlet-class>package.YourServletClass</servlet-class>
   </servlet>
   ```
3. Add servlet mapping:
   ```xml
   <servlet-mapping>
     <servlet-name>YourServletName</servlet-name>
     <url-pattern>/YourServletURL</url-pattern>
   </servlet-mapping>
   ```
4. Restart Tomcat server

### Alternative: Using Annotations
Instead of web.xml, you can use `@WebServlet` annotation:
```java
@WebServlet("/YourServletURL")
public class YourServletClass extends HttpServlet {
    // servlet code
}
```

**Note:** If using annotations, make sure servlet API 3.0+ is configured and the servlet is compiled properly.

---

## 📂 Project Structure

```
Railway/
├── src/main/java/
│   ├── Admin/Login/
│   │   └── LOGINADMIN.java
│   ├── Railway/registration/
│   │   ├── LoginServlet.java
│   │   └── Register.java
│   ├── UpdateAdmin/
│   │   ├── Curent_sv.java
│   │   ├── updateAdmins.java
│   │   ├── Update_admin_data_sev.java
│   │   └── Del_admin_suv.java
│   ├── UpdateTrains/
│   │   ├── Cur_train_sev.java
│   │   ├── InsertTrainServlet.java
│   │   ├── Update_trains_sev.java
│   │   └── Deleter_train_sev.java
│   ├── Updateusers/
│   │   ├── Curent_servlet.java
│   │   ├── AddUser_servlet.java
│   │   ├── Update_suv.java
│   │   └── Delete_use_sev.java
│   └── Reservation/
│       ├── Train_res.java
│       ├── insertReserve.java
│       ├── My_res_sv.java
│       ├── Update_reservation_sev.java
│       └── Del_reser_sev.java
└── src/main/webapp/
    └── WEB-INF/
        └── web.xml

```

---

## ✅ Status: All Servlets Configured

All 22 servlets are now properly mapped and ready to use!

**Last Updated:** October 19, 2025
**Configuration File:** `src/main/webapp/WEB-INF/web.xml`

---

## 🚀 Next Steps

1. **Restart Tomcat** to apply all servlet mappings
2. Test each functionality to ensure proper routing
3. Check database connections for each servlet
4. Verify form submissions work correctly
5. Test complete user workflows (login → book → view → cancel)

---

*For technical support or issues, check the Tomcat logs in Eclipse Console.*
