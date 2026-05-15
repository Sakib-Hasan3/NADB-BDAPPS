void main() {
  List numbers = [1, 2, 3, 4, 5];
  // print(numbers);
  List<String> names = ["Arko", "prianka Nandi", "Noor"];
  // print(names);
  names.add("mirajul");
  // print(names);
  names.remove("Noor");
  // print(names);
  names.addAll(["abul", "motiur", "sifat"]);
  // print(names);

  // for (int i = 1; i <= 5; i++) {
  //   print("$i");
  // }
  // for (var name in names) {
  //   print(name);
  // }
  int i = 0;
  // while (i <= 5) {
  //   print("$i");
  //   i++;
  // }
  // do {
  //   print("$i");
  // } while (i <= 5);

  Map<String, dynamic> student = {
    'name': 'sakib',
    'age': 23,
    'department': 'CSE',
    'subjects': "math",
  };

  student["present addrees"] = "Narsingdi";
  student.forEach((key, value) {
    print("$key is $value");
  });
  // print(student['name']);
  // print(student['contact'] ?? "warning");
  // student.remove("department");
  // student.containsKey("name");
  // print(student.containsKey("department"));
  Set<String> language = {"dart", "python", "C#", "C", "C++"};
  language.add("flutter");
  print(language.contains("java") ? "java is found" : "not found");
  print(language);

  var a = [1, 2, 3, 4];
  var b = [5, 6, 7, 8];
  var merged = [...a, ...b];
  print(merged);
}
