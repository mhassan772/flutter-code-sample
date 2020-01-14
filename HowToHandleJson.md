# Load a Json from local directory
```
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}
//loading the raw json String from the assets.
String jsonString = await _loadAStudentAsset();

//Decoding this raw json String we got.
final jsonResponse = json.decode(jsonString);
```

# How to parse 

## Simple Json
*Json:*
```
{
  "id":"487349",
  "name":"Pooja Bhaumik",
  "score" : 1000
}
```
*How to parse it*
//flutter_json/student_model.dart
```
class Student{
  String studentId;
  String studentName;
  int studentScores;

  Student({
    this.studentId,
    this.studentName,
    this.studentScores
 });
 
 factory Student.fromJson(Map<String, dynamic> parsedJson){
    return Student(
      studentId: parsedJson['id'],
      studentName : parsedJson['name'],
      studentScores : parsedJson ['score']
    );
  }
 }
```
  //student_services.dart
```
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_json/student_model.dart';

//load Json
Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

//load the responce
Future loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Student student = new Student.fromJson(jsonResponse);
  print(student.studentScores);
}
```  


## Simple structure with arrays
```
{
  "city": "Mumbai",
  "streets": [
    "address1",
    "address2"
  ]
}
```
**Parsing**
https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/model/address_model.dart

## Simple Nested structures
```
{
  "shape_name":"rectangle",
  "property":{
    "width":5.0,
    "breadth":10.0
  }
}
```
**Parsing**
https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/model/shape_model.dart

## Nested structures with Lists
```
{
  "id":1,
  "name":"ProductName",
  "images":[
    {
      "id":11,
      "imageName":"xCh-rhy"
    },
    {
      "id":31,
      "imageName":"fjs-eun"
    }
  ]
}
```
**Parsing**
https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/model/product_model.dart

## List of Maps
```
[
  {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "http://placehold.it/600/92c952",
    "thumbnailUrl": "http://placehold.it/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "http://placehold.it/600/771796",
    "thumbnailUrl": "http://placehold.it/150/771796"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "officia porro iure quia iusto qui ipsa ut modi",
    "url": "http://placehold.it/600/24f355",
    "thumbnailUrl": "http://placehold.it/150/24f355"
  }
]
```
**Parsing**
https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/model/photo_model.dart

# Good resources
https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
