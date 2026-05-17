import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];
  Set<String> contacts = {};

  for (int i = 1; i <= 5; i++) {
    print("\nStudent $i Information");

    stdout.write("Name: ");
    String name = stdin.readLineSync()!;

    stdout.write("About: ");
    String about = stdin.readLineSync()!;

    stdout.write("Present Address: ");
    String present = stdin.readLineSync()!;

    stdout.write("Permanent Address: ");
    String permanent = stdin.readLineSync()!;

    stdout.write("Contact Number: ");
    String contact = stdin.readLineSync()!;

    stdout.write("Age: ");
    int age = int.parse(stdin.readLineSync()!);

    contacts.add(contact);

    students.add({
      "Name": name,
      "About": about,
      "Present Address": present,
      "Permanent Address": permanent,
      "Contact": contact,
      "Age": age,
    });
  }

  print("\n===== Student Information =====");

  for (var student in students) {
    print(student);
  }

  print("\nUnique Contacts:");
  print(contacts);
}