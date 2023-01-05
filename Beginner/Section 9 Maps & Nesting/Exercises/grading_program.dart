// A program that calculates student grades.
void main() {
  var studentScores = {
    "Harry": 81,
    "Ron": 78,
    "Hermione": 99,
    "Draco": 74,
    "Neville": 62,
  };

  Map<String, String> studentGrades = {};
  int? grade;
  for (final student in studentScores.keys) {
    grade = studentScores[student];
    if (grade != null) {
      if (grade > 90) {
        studentGrades[student] = "Outstanding";
      } else if (grade > 80) {
        studentGrades[student] = "Exceeds Expectations";
      } else if (grade > 70) {
        studentGrades[student] = "Acceptable";
      } else {
        studentGrades[student] = "Fail";
      }
    }
  }
  print(studentGrades);
}
