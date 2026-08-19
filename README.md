# Library Database Project (MySQL)

A relational database project implementing a library management system schema (`biblioteka`), test data population, and 20 analytical & reporting SQL queries.

---

## 📁 Repository Contents

* `library_database.sql` – Main SQL script containing database creation, table schemas, seed data, and queries 1–20.

  
<img width="1024" height="772" alt="image" src="https://github.com/user-attachments/assets/675fc35a-9fe4-4acc-8041-6f383e041582" />


## 📋 Query Tasks (1–20)

| No. | Task Description |
|:---|:---|
| **1** | Display concatenated reader and employee names for each loan (deduplicated, ordered descending). |
| **2** | List reader full name alongside the total count of distinct books borrowed. |
| **3** | Retrieve distinct book titles borrowed by reader ID=3 from specific staff members. |
| **4** | Readers who borrowed books from publisher 'PWN' (custom column alias, ascending order). |
| **5** | Books borrowed 5 or more times. |
| **6** | Books that have never been borrowed. |
| **7** | Readers currently holding overdue books (loan duration > 14 days, unreturned). |
| **8** | Readers who have ever held books overdue beyond the 14-day limit. |
| **9** | Total books per publisher published after 2000. |
| **10** | Loan history per reader including titles and loan dates. |
| **11** | First-week monthly loan report formatted as complete sentences. |
| **12** | Employee with the highest salary. |
| **13** | Ceiling-rounded average employee salary formatted with text prefix. |
| **14** | Text formatting: first 2 letters capitalized, reversed first name, uppercase city. |
| **15** | Mathematical expression evaluated using `SELECT` and rounded to 2 decimals. |
| **16** | Aggregated book acquisitions summary grouped by publication year. |
| **17** | Most popular library department by total borrow count. |
| **18** | Difference between employee salary and their position's average salary. |
| **19** | Details of the most recently hired employee. |
| **20** | Gender breakdown of users who have returned all borrowed books without pending loans. |
