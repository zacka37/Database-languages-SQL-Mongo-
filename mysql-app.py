#query ClassicModels database
import mysql.connector

def getEmployeesPerRegion(mycursor):
    #create query
    employeesPerRegion = input("Enter region name for specific region or (ALL) to view all regions: ")
    if (employeesPerRegion.capitalize() == 'All'):
        sql_query = "SELECT * FROM EmployeesPerRegion;"
    elif(employeesPerRegion == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        sql_query = f"SELECT * FROM EmployeesPerRegion WHERE region_name = '{employeesPerRegion}';"
    mycursor.execute(sql_query)
    query_result = mycursor.fetchall()
    row_count = len(query_result)
    #execute the query
    if row_count == 0:
        print(f"There are no employees in {employeesPerRegion}")
    else:
        #get the query result
        # if(query_result !=  {employeesPerRegion}):
        #     print(f"There are no employees in the {employeesPerRegion} region")
        #loop through results
        for record in query_result:
            print('----------------')
            print(f"region_name: {record[0]}, Number of Employees: {record[1]}\n")
        
    return
def getManagers(mycursor):
    #create query
    managers = input("Enter department name for specific department or (ALL) to view all departments: ")
    if(managers.capitalize() == 'All'):
        sql_query = f"SELECT department_name, COUNT(first_name) FROM managers GROUP BY department_name;"
    elif(managers == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        sql_query = f"SELECT department_name, COUNT(first_name) FROM managers WHERE department_name = '{managers}' GROUP BY department_name;"
    mycursor.execute(sql_query)
    query_result = mycursor.fetchall()
    row_count = len(query_result)
    #execute the query
    if row_count == 0:
        print(f"There are no managers in the {managers} department")
    else:
        for record in query_result:
            print('----------------')
            print(f"department_name: {record[0]}, Number of Managers: {record[1]}\n")
    return

def getDependentsByDepartment(mycursor):
    #create query
    dependentsByDepartment = input("Enter department name or (All) to view data for all departments: ")
    if(dependentsByDepartment.capitalize() == 'All'):
        sql_query = "SELECT * FROM DependentsByDepartment ORDER BY dependent_number DESC;"
    elif(dependentsByDepartment == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        sql_query = f"SELECT * FROM DependentsByDepartment WHERE departmentName = '{dependentsByDepartment}' ORDER BY dependent_number DESC;"
    #execute the query
    mycursor.execute(sql_query)
    #get the query result
    query_result = mycursor.fetchall()
    row_count = len(query_result)
    if(row_count == 0):
        print(f"There are no dependents in the {dependentsByDepartment} department")
    else:
        #loop through results
        for record in query_result:
            print('----------------')
            print(f"dependent_number: {record[0]}, departmentName: {record[1]}\n")
    
    return

def getHiresByYear(mycursor):
    hiresByYear = input("Enter year or (ALL) to view hiring data for all years: ")
    #create query
    if(hiresByYear.capitalize() == 'All'):
        sql_query = "SELECT * FROM HiresByYear;"
    elif(hiresByYear == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        sql_query = f"SELECT * FROM HiresByYear WHERE Year = {hiresByYear};"
    #execute the query
    try:
        mycursor.execute(sql_query)
        #get the query result
        query_result = mycursor.fetchall()
        row_count = len(query_result)
        if(row_count == 0):
            print(f"There is no hiring data for year {hiresByYear}")
        else:
            #loop through results
            for record in query_result:
                print('----------------')
                print(f"Employees Hired: {record[0]}, Year {record[1]}\n")
    except:
        print("[ERROR] you must enter a value at the prompt")
    return

def getSalaryByDepartment(mycursor):
    salaryByDepartment = input("Enter Department name or (ALL) for salary data for department(s): ")
    #create query
    if(salaryByDepartment.capitalize() == 'All'):
        sql_query = "SELECT * FROM SalaryByDepartment;"
    elif(salaryByDepartment == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        sql_query = f"SELECT * FROM SalaryByDepartment WHERE department_name = '{salaryByDepartment}';"
    #execute the query
    mycursor.execute(sql_query)
    #get the query result
    query_result = mycursor.fetchall()
    row_count = len(query_result)
    if(row_count == 0):
        print(f"There is no salary data for the {salaryByDepartment} department")
    #loop through results
    for record in query_result:
        print('----------------')
        print(f"Salary: {record[0]}, Department_name: {record[1]}\n")
    return

def getSalaryByJobTitle(mycursor):
    salaryByJobTitle = input("Enter Job Title or (All) to view salary data by job title(s): ")
    #create query
    if(salaryByJobTitle.capitalize() == 'All'):
        sql_query = "SELECT * FROM SalaryByJobTitle ORDER BY Job_Title ASC;"
    elif(salaryByJobTitle == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        sql_query = f"SELECT * FROM SalaryByJobTitle WHERE Job_Title = '{salaryByJobTitle}' ORDER BY Job_Title ASC;"
    #execute the query
    mycursor.execute(sql_query)
    #get the query result
    query_result = mycursor.fetchall()
    row_count = len(query_result)
    if(row_count == 0):
        print(f"There is no salary data for the {salaryByJobTitle} job title")
    else:
        #loop through results
        for record in query_result:
            print('----------------')
            print(f"Total Salary: {record[0]}, Job Title: {record[1]}\n")
    return

def getEmployeeDependents(mycursor):
    employeeDependents = input("Enter the employee's first name or (All) to see dependents data for employee(s): ")
    #create query
    if(employeeDependents.capitalize() == 'All'):
        sql_query = "SELECT * FROM EmployeeDependents;"
    
    elif(employeeDependents == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        employeeDependentsLastName = input("Enter the employee's last name: ")
        sql_query = f"SELECT * FROM EmployeeDependents WHERE first_name = '{employeeDependents}' AND last_name = '{employeeDependentsLastName}';"
    #execute the query
    mycursor.execute(sql_query)
    #get the query result
    query_result = mycursor.fetchall()
    row_count = len(query_result)
    if(row_count == 0):
        print(f"{employeeDependents} does not have any dependents")
    else:
        #loop through results
        for record in query_result:
            print('----------------')
            print(f"First Name: {record[0]}, Last Name: {record[1]}, Email: {record[2]}, Phone Number: {record[3]}, Number of Dependents: {record[4]},\n")
    return

def getCountryLocation(mycursor):
    countryLocation = input("Enter country name or (All) to see location data for countries(s): ")
    #create query
    if(countryLocation.capitalize() == 'All'):
        sql_query = "SELECT * FROM CountryLocation;"
    elif(countryLocation == ""):
        print("[ERROR] you must enter a value at the prompt")
        return
    else:
        sql_query = f"SELECT * FROM CountryLocation WHERE country_name = '{countryLocation}';"
    #execute the query
    mycursor.execute(sql_query)
    #get the query result
    query_result = mycursor.fetchall()
    row_count = len(query_result)
    if(row_count == 0):
        print(f"There is no location data for {countryLocation}")
    else:
        #loop through results
        for record in query_result:
            print('----------------')
            print(f"Country Name: {record[0]}, Number of Locations: {record[1]}\n")
    return

def getAddADependent(mycursor):
    
    dependent_first_name = input("What is the dependent's first name: ")
    dependent_last_name = input("What is the dependent's last name: ")
    relationship = input("What is the dependent's relationship to the employee: ")
    employee_id = input("What is the employee id that the dependent is registered with: ")
    #create query
    sql_query = f"INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('{dependent_first_name}','{dependent_last_name}','{relationship}',{employee_id});" 
    try:
        #execute the query
        mycursor.execute(sql_query)
        print(f"Success: You have added {dependent_first_name} {dependent_last_name} to the dependents table")
        # print(f"{mycursor.rowcount}")
    except:
        print(f"Failed to add {dependent_first_name} {dependent_last_name} to the dependents table")
    return

def getAddAJob(mycursor):
    job_title = input("What is the job title: ")
    min_salary = input("Enter minimum salary with ONLY 2 decimals: ")
    max_salary = input("Enter maximum salary with ONLY 2 decimals: ")
    #create query
    sql_query = f"INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('{job_title}',{min_salary},{max_salary})"
    try:
        #execute the query
        mycursor.execute(sql_query)
        print(f"Success: You have added {job_title} to the jobs table")
    except:
        print(f"Failed to add {job_title} to the jobs table")
    return
# --------DELETE---------
def getDeleteAnEmployee(mycursor):
    employee_id = input("Enter the employee id that you want to delete: ")
    #create query
    sql_query = f"DELETE FROM employees WHERE employee_id = {employee_id}"
    try:
        #execute query
        mycursor.execute(sql_query)
        print(f"Success: You have deleted employee id {employee_id} from the employees table.")
    except:
        print(f"Failed to delete employee id {employee_id}, might me a manager.")
    return

def getDeleteADependent(mycursor):
    dependent_id = input("Enter the dependent id that you want to delete: ")
    #create query
    sql_query = f"DELETE FROM dependents WHERE dependent_id = {dependent_id}"
    try:
        #execute query
        mycursor.execute(sql_query)
        print(f"Success: You have deleted dependent id {dependent_id} from the dependents table.")
    except:
        print(f"Failed to delete employee id {dependent_id}")
    return

# --------UPDATE-----------
def getUpdateEmployeeFirstName(mycursor):
    employeeId = input("Enter the employee's id number that you would like to update: ")
    employeeFirstName = input("Enter the updated first name: ")
    sql_query = f"UPDATE employees SET first_name = '{employeeFirstName}' WHERE employee_id = {employeeId}"
    try:
        #execute query
        mycursor.execute(sql_query)
        print(f"Success: The first name of employee id {employeeId} has been changed to {employeeFirstName}")
    except:
        print("Failed to change first name.")
    return

def getUpdateEmployeeLastName(mycursor):
    employeeId = input("Enter the employee's id number that you would like to update: ")
    employeeLastName = input("Enter the updated last name: ")
    sql_query = f"UPDATE employees SET last_name = '{employeeLastName}' WHERE employee_id = {employeeId}"
    try:
        #execute query
        mycursor.execute(sql_query)
        print(f"Success: The last name of employee id {employeeId} has been changed to {employeeLastName}")
    except:
        print("Failed to change last name.")
    return

def getUpdateMinSalary(mycursor):
    jobId = input("What is the job id: ")
    minSalary = input("Enter the new minimum salary: ")
    sql_query = f"UPDATE jobs SET min_salary = {minSalary} WHERE job_id = {jobId}"
    try:
        #execute query
        mycursor.execute(sql_query)
        print("Success: The minimum salary has been changed.")
    except:
        print("Failed to change minimum salary")
    return

def getUpdateMaxSalary(mycursor):
    jobId = input("What is the job id: ")
    maxSalary = input("Enter the new maximum salary: ")
    sql_query = f"UPDATE jobs SET max_salary = {maxSalary} WHERE job_id = {jobId}"
    try:
        #execute query
        mycursor.execute(sql_query)
        print("Success: The maximum salary has been changed.")
    except:
        print("Failed to change maximum salary")
    return
# def get_order_totals(mycursor):
#     months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
#     sql_query = "select * from orderTotalsByMonth;" #create query
#     mycursor.execute(sql_query)          #execute the query
#     query_result = mycursor.fetchall()  #get the query result

#     print("\n-----------Order Totals By Month-------------\n")
#     for record in query_result:
#         print(f"{months[record[1] - 1]} {record[0]}: {record[2]}")

#     return
def print_menu():
    print("Choose an option")
    print("--------------------------")
    print("----------- VIEW DATA -----------")
    print("1. Display # of Employees by Regions")
    print("2. List # of Managers by Departments")
    print("3. List # of Dependents by Departments")
    print("4. List # of Employees hired by year")
    print("5. List Salaries by Departments")
    print("6. List Salaries by Job Titles")
    print("7. Display Dependents by Employees")
    print("8. List Locations by Countries")
    print("\n----------- ADD DATA -----------")
    print("9.  Add a dependent")
    print("10. Add a job")
    print("\n----------- DELETE DATA -----------")
    print("11. Delete an employee")
    print("12. Delete a dependent")
    print("\n----------- UPDATE DATA -----------")
    print("13. Update employee first name")
    print("14. Update employee last name")
    print("15. Update job minimum salary")
    print("16. Update job maximum salary")
    print("\n----------- EXIT DATA -----------")
    print("17. Exit Application")
    return

def get_user_choice():
    print_menu()
    choice = int(input("Enter Choice: "))
    return choice


def main():
#create a connector object
    try:
        mydb = mysql.connector.connect(
            host="mysql-container",
            user="root",
            passwd="root",
            database="project2"
        )
        print("Successfully connected to the database!")
    except Exception as err:
        print(f"Error Occured: {err}\nExiting program...")
        quit()
    #create database cursor
    mycursor = mydb.cursor()

    while(True):
        try:
            user_choice = get_user_choice()
        except:
            print("Enter a valid option")
            continue
        if(user_choice > 17):
            print("Enter a valid option between 1 - 17")
            continue
        if(user_choice == 1):
            #call the function to query the managers
            getEmployeesPerRegion(mycursor)
        elif(user_choice == 2):
            getManagers(mycursor)
        elif(user_choice == 3):
            getDependentsByDepartment(mycursor)
        elif(user_choice == 4):
            getHiresByYear(mycursor)
        elif(user_choice == 5):
            getSalaryByDepartment(mycursor)
        elif(user_choice == 6):
            getSalaryByJobTitle(mycursor)
        elif(user_choice == 7):
            getEmployeeDependents(mycursor)
        elif(user_choice == 8):
            getCountryLocation(mycursor)
        elif(user_choice == 9):
            getAddADependent(mycursor)
            mydb.commit()
        elif(user_choice == 10):
            getAddAJob(mycursor)
            mydb.commit()
        elif(user_choice == 11):
            getDeleteAnEmployee(mycursor)
            mydb.commit()
        elif(user_choice == 12):
            getDeleteADependent(mycursor)
            mydb.commit()
        elif(user_choice == 13):
            getUpdateEmployeeFirstName(mycursor)
            mydb.commit()
        elif(user_choice == 14):
            getUpdateEmployeeLastName(mycursor)
            mydb.commit()
        elif(user_choice == 15):
            getUpdateMinSalary(mycursor)
            mydb.commit()
        elif(user_choice == 16):
            getUpdateMaxSalary(mycursor)
            mydb.commit()
        elif(user_choice == 17):
            print("Bye Bye!!!")
            break
main()


