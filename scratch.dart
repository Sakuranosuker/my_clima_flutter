import 'dart:io';

void main() {
  runTasks();
  tryCatch();
}

void runTasks() async {
  taskOne();
  String task2result = await taskTwo(); //waits for taskTwo() to complete.
  taskThree(task2result);
}

void taskOne() {
  print("Task One complete");
}

Future<String> taskTwo() async {
  Duration time = Duration(seconds: 5);
  String result = '';
  await Future.delayed(time, () {
    result = 'taskTwo data';
    print("Task Two complete");
  });
  return result;
}

void taskThree(String task2data) {
  print("Task Three complete with $task2data");
}

void tryCatch() {
  try {
    alwaysLessThanTen(15);
  } catch (e) {
    print(e);
  }
}

void alwaysLessThanTen(int n) {
  if (n > 10) {
    throw 'the given value is greater than 10. it should be always smaller than 10.';
  }
}
