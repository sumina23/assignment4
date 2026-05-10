import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  String gender = 'Male';

  List<EmployeeModel> employeeList = [];

  void saveEmployee() {

    EmployeeModel employee = EmployeeModel(
      employeeID: idController.text,
      fname: nameController.text,
      gender: gender,
      department: departmentController.text,
      username: '',
      password: '',
    );

    setState(() {
      employeeList.add(employee);
    });

    idController.clear();
    nameController.clear();
    departmentController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Employee Screen'),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: idController,

              decoration: const InputDecoration(
                hintText: 'Employee ID',
              ),
            ),

            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                hintText: 'Full Name',
              ),
            ),

            TextField(
              controller: departmentController,

              decoration: const InputDecoration(
                hintText: 'Department',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Radio(
                  value: 'Male',
                  groupValue: gender,

                  onChanged: (value) {

                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                const Text('Male'),

                Radio(
                  value: 'Female',
                  groupValue: gender,

                  onChanged: (value) {

                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                const Text('Female'),
              ],
            ),

            ElevatedButton(
              onPressed: saveEmployee,

              child: const Text('Save'),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: employeeList.length,

                itemBuilder: (context, index) {

                  final emp = employeeList[index];

                  return Card(
                    child: ListTile(
                      title: Text(emp.fname),
                      subtitle: Text(emp.department),
                      trailing: Text(emp.gender),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
