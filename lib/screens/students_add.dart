import 'package:flutter/material.dart';
import 'package:fluttercamp1/models/students.dart';
import 'package:fluttercamp1/ogrenciler.dart';

class StudentAdd extends StatefulWidget {
  @override
  _StudentAddState createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
  final _formKey = GlobalKey<FormState>();

  var student = Students.withoutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Yeni öğrenci ekle'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                buildNameField(),
                buildLastNameField(),
                buildGradleField(),
                ElevatedButton(
                  child: Text('KAYDET'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                     students.add(student);
                     Navigator.pop(context);
                    }
                    
                    
                  },
                )
              ],
            ),
          ),
        ));
  }

  TextFormField buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Öğrenci Adı',
        hintText: 'Engin',
      ),
      validator: (value) {
        if (value!.length < 2) {
          return 'İsim en az iki karakter olmalıdır. ';
        }
        return null;
      },
      onSaved: (value) {
        student.firstName = value!;
      },
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Öğrenci Soyadı',
        hintText: 'DEMİROĞ',
      ),
      validator: (value) {
        if (value!.length < 2) {
          return 'İsim en az iki karakter olmalıdır. ';
        }
        return null;
      },
      onSaved: (value) {
        student.lastName = value!;
      },
    );
  }

  TextFormField buildGradleField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Aldığı not',
        hintText: '85',
      ),
      validator: (value) {
        if (int.parse(value!) > 100 || int.parse(value) < 0) {
          return 'Not 0 ile 100 arasında olmalıdır.';
        }
        return null;
      },
      onSaved: (value) {
        student.grade = int.parse(value!);
      },
    );
  }
}
