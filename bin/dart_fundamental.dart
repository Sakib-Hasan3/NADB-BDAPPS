import 'dart:ffi';

void main() {
  int age = 10;
  double height = 1.75;
  String name = "";
  String? nickname = null;
  print("Nickname: ${nickname ?? "Taj"}");
  print("");
  String descripttion = """
mroshed is a software engineer with expertise in Dart programming. He has a passion for developing efficient and scalable applications. With a strong background in computer science, Morshed is dedicated to creating innovative solutions and contributing to the tech community.
""";
  bool isStudent = true;

  var path = r"C:\Users\morshed\Desktop\dart_fundamental.dart";
  '';
  print(
    "Name: $name, Age: $age, Height: $height, Is Student: $isStudent his description is $descripttion $path",
  );
  var temperature = 20;

  if (temperature > 25) {
    print("It's a hot day");
  } else {
    print("It's a pleasant day");
  }
  var day = "thursday";
  switch (day) {
    case "Monday":
      print("Its a monday");
      break;
    case "Sunday":
      print("Its a sunday");
    case "Tuesday":
      print("Its a Tuesday");
    case "Wednesday":
      print("Its a wednesday");
    case "Thursday":
      print("Its a thursday");
    default:
      print("Its a weekend");
  }
}
