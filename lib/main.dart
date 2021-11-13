import 'package:flutter/material.dart';
import 'package:fluttercamp1/models/students.dart';
import 'package:fluttercamp1/screens/students_add.dart';


import 'ogrenciler.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj1 = 'Öğrenci Takip Sistemi';

  Students selectedStudent=Students.withId(0,'','',0,'');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj1),
      ),
      body: buildBody(students, context),
    );
  }

  Widget buildBody(List<Students> students, BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg'),
              ),
              title: Text(
                  students[index].firstName + ' ' + students[index].lastName),
              subtitle: Text('Sınavdan aldığı not: ' +
                  ' ' +
                  students[index].grade.toString()+' ['+students[index].getStatus+']'),
              trailing: buildStatusIcon(students[index].grade),
              onTap: (){
                setState(() {
                  selectedStudent=students[index];
                });
                
                
              },
            );
          },
          itemCount: students.length,
        )),
        Text('Seçili öğrenci: '+selectedStudent.firstName +' '+selectedStudent.lastName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd()));
                },
                child: Row(
                  
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5,),
                    Text('Yeni Öğrenci'),
                  ],
                ),
              ),
            ),
            
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  
                  String mesaj = 'Silindi : '+selectedStudent.firstName+' '+selectedStudent.lastName;
                  mesajGoster(context, mesaj);
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5,),
                    Text('Sil'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  

  Widget buildStatusIcon(int grade) {
    if (grade >= 50)
      return Icon(Icons.done);
    else if (grade >= 40)
      return Icon(Icons.album);
    else
      return Icon(Icons.clear);
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text('İşlem Sonucu'),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}