<<<<<<< HEAD
# Normalized SQL Database

This project demonstrates **relational database normalization** up to the **Third Normal Form (3NF)**.  
It is designed to show clean schema design, proper relationships, and efficient query structuring.

---

## Project Structure
| File | Description |
|------|--------------|
| `schema.sql` | Creates the database and normalized tables |
| `seed_data.sql` | Inserts sample data for testing |
| `README.md` | Overview of the project |

---

## Normalization Principles
The database follows normalization from:
1. **1NF (First Normal Form)** – Eliminates repeating groups, ensures atomic columns.  
2. **2NF (Second Normal Form)** – Removes partial dependencies on composite keys.  
3. **3NF (Third Normal Form)** – Eliminates transitive dependencies.
---

## Entities Overview
- **Departments** → basic Department info  
- **Professors** → info about professors 
- **Students** → info about students                                                 
- **Courses** → General info about courses 
- **Prerequisites** → pairs rows from Courses table, each making a unique combination 
- **Enrollments** → connects student table with course table
- **CourseSchedule** → an academic calendar, contains info about schedule 

---

## Relationships
- One-to-Many → `Departments` → `Students` 
- One-to-Many → `Courses` → `Enrollments`                                        
- Many-to-Many → `Students` ↔ `Courses` (via `Enrollments`)

---

## Setup Instructions
1. Open SQL Server Management Studio (SSMS).  
2. Run the `schema.sql` file to create the database and tables.  
3. Run the `seed_data.sql` file to insert sample data.                                    
4. Optionally, explore with custom `SELECT`, `JOIN`, and `GROUP BY` queries.

---
## Example Queries
- See `queries.sql` for sample JOINs demonstrating the relationships
=======
# Normalized_DB
A normalized SQL Server database model built to demonstrate relational design principles (1NF–3NF). Includes: - schema.sql → creates database and normalized tables - seed_data.sql → inserts sample data for testing - README.txt → explains setup and relationships
>>>>>>> db75352282880fed6457bbc6993cb0a7d6d32dae
