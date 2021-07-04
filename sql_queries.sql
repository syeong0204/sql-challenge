DROP TABLE  "Department"
CREATE TABLE "Department" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);
DROP TABLE  "Department_Employee"
CREATE TABLE "Department_Employee" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department_Employee" PRIMARY KEY (
        "emp_no","dept_no"
     )
);
DROP TABLE  "Department_Manager"
CREATE TABLE "Department_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);
DROP TABLE  "Employee"
CREATE TABLE "Employee" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "dob" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);
DROP TABLE  "Salary"
CREATE TABLE "Salary" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "emp_no"
     )
);
DROP TABLE  "Titles"
CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title" FOREIGN KEY("emp_title")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

SELECT * FROM "Department"
SELECT * FROM "Department_Employee"
SELECT * FROM "Department_Manager"
SELECT * FROM "Employee"
SELECT * FROM "Salary"
SELECT * FROM "Titles"
1
SELECT e.emp_no, e.last_name, e.first_name,e.sex, s.salary FROM "Employee" as e 
Inner Join "Salary" as s
on s.emp_no = e.emp_no;
2
SELECT e.first_name, e.last_name, e.hire_date FROM "Employee" as e
WHERE e.hire_date BETWEEN '1986-01-01' and '1986-12-31'
3
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Department" as d
Inner join "Department_Manager" as dm on dm.dept_no = d.dept_no
Inner join "Employee" as e on e.emp_no = dm.emp_no;

4
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employee" as e
JOIN "Department_Employee" as de ON de.emp_no = e.emp_no
JOIN "Department" as d on d.dept_no = de.dept_no;
5

SELECT last_name, first_name, sex 
FROM "Employee"
WHERE first_name = "%H" and last_name = "%B";

6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employee" as e
INNER JOIN "Department_Employee" as de on de.emp_no = e.emp_no
Inner Join "Department" as d on d.dept_no = de.dept_no
WHERE dept_name = 'Sales';

7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employee" as e
INNER JOIN "Department_Employee" as de on de.emp_no = e.emp_no
Inner Join "Department" as d on d.dept_no = de.dept_no
WHERE dept_name IN ('Sales', 'Development');

8
SELECT last_name, count(last_name)
FROM "Employee"
GROUP BY last_name
ORDER BY COUNT(last_Name) DESC;