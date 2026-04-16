# User Ticket Management System

A web-based **User Ticket Management System** developed during my internship as a **Java/Windchill Intern**.
This application allows users to raise support tickets and enables administrators to manage, update, and resolve them efficiently.

---

## Tech Stack

* **Java (JSP & Servlets)**
* **JDBC**
* **MySQL**
* **HTML, CSS, Bootstrap**
* **Apache Tomcat**

---

## Features
      |
      V
### User Module

* User Registration & Login
* Create Support Tickets
* View Ticket Status
* Track Updates
* Profile Management

### Admin Module

* Secure Admin Login
* View All Tickets
* Update Ticket Status & Priority
* Delete Tickets
* Manage Ticket Workflow

---

## Key Highlights

* Role-based authentication (**Admin & User**)
* Session management for secure access
* MVC architecture (Servlets + JSP)
* Dynamic ticket handling
* Clean and responsive UI

---

## How to Run

1. Clone the repository
2. Import project into **Eclipse / IntelliJ**
3. Configure **Apache Tomcat Server**
4. Setup **MySQL Database**
5. Update database credentials in -> DBUtil.java
6. Run the project

---

## Database

* MySQL database used
* Tables:
  
  * users
  * tickets
  * form_fields (for dynamic dropdowns)

---

## Purpose

This project demonstrates real-world implementation of:

* Java Web Development
* Database Integration
* Role-based Access Control
* Full-stack application structure

---

## Author

**Arav Panwar**

Java / Windchill Intern

---

## Future Improvements

* Password encryption (security)
* Email notifications
* File attachments in tickets
* Dashboard analytics
