import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EmployeePage(),
  ));
}

class Employee {
  String name;
  String mobile;
  String city;
  String workType;
  String email;
  String address;

  Employee(this.name, this.mobile, this.city, this.workType,this.email,this.address);
}

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  List<Employee> employees = [
    Employee('Ajith Kumar', '+91 9876543456', 'Kovilpatti', 'Cleaning','kavin@gmail.com','3/105,middle street'),
    Employee('Peter John', '+91 6754378908', 'Satur', 'Cleaning','kavin@gmail.com','3/105,middle street'),
    Employee('Prasath', '+91 7678654389', 'Tirunelveli', 'Receptionist','kavin@gmail.com','3/105,middle street'),
    Employee('Yuvaraj', '+91 5678907530', 'Sivagasi', 'Receptionist','kavin@gmail.com','3/105,middle street'),
    Employee('Karthik', '+91 7865439876', 'Kovilpatti', 'Receptionist','kavin@gmail.com','3/105,middle street'),
    Employee('Senthil', '+91 6798765423', 'SangaranKovil', 'Cleaning','kavin@gmail.com','3/105,middle street'),
  ];

  final _formKey = GlobalKey<FormState>();
  String? _editName;
  String? _editEmail;
  String? _editCity;
  String? _editWorkType;
  String? _editAddress;
  String? _editMobile;
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left Side Menu
          Container(
            color: Colors.blue.shade700,
            width: 250,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.business, size: 50, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        'TechLamdas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Divider()
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(22, 16, 22, 16),
                      backgroundColor: Colors.white.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.logout, color: Colors.white, size: 16),
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Employee',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Search Field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 330,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Employee Name / Mobile Number',
                            suffixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(22, 16, 22, 16),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          _showEditDialog(
                              context, -1); // -1 for adding new employee
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 16,
                        ),
                        label: const Text(
                          'Add New',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Employee Table
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columnSpacing: 100,
                              headingRowHeight: 60,
                              dividerThickness: 0,
                              dataRowHeight: 60,
                              columns: const [
                                DataColumn(
                                    label: Text('S.No',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Employee Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Mobile Number',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('City',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Work Type',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Action',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ],
                              rows: employees
                                  .asMap()
                                  .map((index, employee) => MapEntry(
                                      index,
                                      DataRow(
                                        color: MaterialStateColor.resolveWith(
                                          (states) => index % 2 == 0
                                              ? Colors.purple.shade50
                                              : Colors.white,
                                        ),
                                        cells: [
                                          DataCell(Text('${index + 1}')),
                                          DataCell(Text(employee.name)),
                                          DataCell(Text(employee.mobile)),
                                          DataCell(Text(employee.city)),
                                          DataCell(Text(employee.workType)),
                                          DataCell(Center(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.edit_document,
                                                      color: Colors.purple),
                                                  onPressed: () {
                                                    _showEditDialog(
                                                        context, index);
                                                  },
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.red),
                                                  onPressed: () {
                                                    _showDeleteConfirmation(
                                                        context, index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      )))
                                  .values
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 void _showEditDialog(BuildContext context, int index) {
  final isEditing = index >= 0;
  if (isEditing) {
    final employee = employees[index];
    _editName = employee.name;
    _editMobile = employee.mobile;
    _editCity = employee.city;
    _editWorkType = employee.workType;
    _editEmail=employee.email;
    _editAddress=employee.address;
    
  } else {
    _editName = '';
    _editMobile = '';
    _editCity = '';
    _editWorkType = '';
    _editEmail ='';
    _gender='';

  }

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          width: 700,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, isEditing),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _buildLeftColumn()),
                    const SizedBox(width: 20),
                    Expanded(child: _buildRightColumn()),
                  ],
                ),
                const SizedBox(height: 14),
                _buildActionButtons(context, isEditing, index),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildHeader(BuildContext context, bool isEditing) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        isEditing ? 'Edit Employee' : 'New Employee',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      IconButton(
        icon: const Icon(Icons.close, color: Colors.grey, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  );
}

Widget _buildLeftColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildTextField(
        label: 'Employee Name *',
        initialValue: _editName,
        icon: Icons.person_outline,
        hintText: 'Ex. Ajith Kumar',
        onSaved: (value) => _editName = value,
      ),
      const SizedBox(height: 8),
      _buildTextField(
        label: 'Employee Type *',
        initialValue: _editWorkType,
        icon: Icons.arrow_drop_down,
        hintText: 'Select',
        onSaved: (value) => _editWorkType = value,
      ),
      const SizedBox(height: 8),
      _buildGenderSelection(),
      const SizedBox(height: 8),
      _buildTextField(
        label: 'Mobile Number *',
        initialValue: _editMobile,
        hintText: '+918756934290',
        onSaved: (value) => _editMobile = value,
      ),
    ],
  );
}

Widget _buildRightColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildTextField(
        label: 'Email Address *',
        initialValue: _editEmail,
        icon: Icons.email_outlined,
        hintText: 'Ex. AjithKumar@gmail.com',
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          final emailRegExp = RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
          if (!emailRegExp.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        onSaved: (value) => _editEmail = value,
      ),
      const SizedBox(height: 12),
      _buildTextField(
        label: 'City *',
        initialValue: _editCity,
        icon: Icons.arrow_drop_down,
        hintText: 'Select',
        onSaved: (value) => _editCity = value,
      ),
      const SizedBox(height: 20),
      _buildTextField(
        label: 'Address *',
        maxLines: 5,
        hintText: 'Type here..',
        onSaved: (value) => _editAddress = value,
      ),
    ],
  );
}

Widget _buildGenderSelection() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender *', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        Row(
          children: [
            Radio(
              value: 'Male',
              groupValue: _gender,
              onChanged: (value) => setState(() => _gender = value!),
            ),
            const Text('Male'),
            Radio(
              value: 'Female',
              groupValue: _gender,
              onChanged: (value) => setState(() => _gender = value!),
            ),
            const Text('Female'),
          ],
        ),
      ],
    ),
  );
}

Widget _buildTextField({
  required String label,
  String? initialValue,
  IconData? icon,
  String? hintText,
  int maxLines = 1,
  FormFieldValidator<String>? validator,
  FormFieldSetter<String>? onSaved,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        TextFormField(
          initialValue: initialValue,
          maxLines: maxLines,
          decoration: InputDecoration(
            suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.grey),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          validator: validator ?? (value) => value!.isEmpty ? 'This field is required' : null,
          onSaved: onSaved,
        ),
      ],
    ),
  );
}

Widget _buildActionButtons(BuildContext context, bool isEditing, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _buildButton(
        label: 'Cancel',
        color: Colors.white,
        textColor: Colors.black,
        borderColor: Colors.blue,
        onPressed: () => Navigator.of(context).pop(),
      ),
      const SizedBox(width: 8),
      _buildButton(
        label: 'Save',
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            if (isEditing) {
              setState(() {
                employees[index] = Employee(
                  _editName!,
                  _editMobile!,
                  _editCity!,
                  _editWorkType!,
                  _editEmail! ,_editAddress!
                );
              });
            } else {
              setState(() {
                employees.add(Employee(
                  _editName!,
                  _editMobile!,
                  _editCity!,
                  _editWorkType!, _editEmail! ,_editAddress!
                ));
              });
            }
            Navigator.of(context).pop();
          }
        },
      ),
    ],
  );
}

Widget _buildButton({
  required String label,
  required Color color,
  required Color textColor,
  Color? borderColor,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: textColor,
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: borderColor != null ? BorderSide(color: borderColor) : BorderSide.none,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
    child: Text(label),
  );
}


  

void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog( shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero),
          child: Container(
            width: 400,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.delete,color: Colors.blue,size: 30,),
                const SizedBox(height: 20,),
                const Text(
                  "Are you sure you want to Delete this?",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              Colors.white, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: Colors.blue),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text('No'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                setState(() {
                  employees.removeAt(index);
                });
                Navigator.of(context).pop();
              },
                        
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.blue, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text('yes'),
                      ),
                    ],
                  ),
                
              ],
            ),
          ),
        );
      },
    );
  }}//end