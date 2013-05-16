CREATE TABLE Customer
( 
  customer_id int not null,
  customer_name varchar(50) not null,
  address varchar(50),
  city varchar(50),
  state varchar(25),
  zip_code varchar(10),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE Department
( department_id int not null,
  department_name varchar(50) not null,
  CONSTRAINT departments_pk PRIMARY KEY (department_id)
);

CREATE TABLE Employee
( 
  employee_number int not null,
  employee_name varchar(50) not null,
  department_id int,
  salary int,
  CONSTRAINT employees_pk PRIMARY KEY (employee_number),
  CONSTRAINT fk_departments
    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);