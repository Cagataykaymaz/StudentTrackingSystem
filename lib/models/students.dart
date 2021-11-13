class Students{
 late int id;
 late String firstName;
 late String lastName;
 late int grade;
 late String _status;
 
 Students.withId(int id,String firstName,String lastName,int grade,String _status,)
 {
   this.id=id;
   this.firstName=firstName;
   this.lastName=lastName;
   this.grade=grade;

 }
  Students(String firstName,String lastName,int grade,String _status,)
 {
   this.firstName=firstName;
   this.lastName=lastName;
   this.grade=grade;
  

 }
 Students.withoutInfo();

 String get getStatus{

   String message='';
   if(this.grade>=50)
   message='Geçti';
   else if(this.grade>=40)
   message='Bütünlemeye kaldı';
   else
   message='Kaldı';
  return message;
 }


}