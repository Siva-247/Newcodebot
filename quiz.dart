import 'dart:io';
void main() {
  print("🧠 Welcome to the Dart CLI Quiz App!");
  print("------------------------------------\n");

  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'question': 'Which of the following is NOT a valid data type in Dart?',
      'options': ['a) int', 'b) String', 'c) char', 'd) double'],
      'answer': 'c'
    },
    {
      'question': 'Which data type is used to store decimal numbers?',
      'options': ['a) int', 'b) double', 'c) float', 'd) num'],
      'answer': 'b'
    },
    {
      'question': 'Which function is used to print output in Dart?',
      'options': ['a) echo()', 'b) println()', 'c) print()', 'd) printf()'],
      'answer': 'c'
    },
    {
      'question': 'How do you write a multi line comment in Dart?',
      'options': ['a) # comment', 'b) // comment', 'c) <!-- comment -->', 'd) /*comment*/'],
      'answer': 'd'
    },
    {
      'question': ' How do you define an asynchronous function in Dart?',
      'options': ['a) Using the async keyword', 'b) Using the await keyword', 'c) Using async and await together','d) Using future keyword'],
      'answer': 'a'
    },
  ];

  for (var i = 0; i < questions.length; i++) {
    score += askQuestion(i + 1, questions[i]);
  }

  print("\n🎯 Quiz Completed!");
  print("Your final score is: $score / ${questions.length}");
  if (score == questions.length) {
    print("🏆 Excellent work!");
  } else if (score >= 3) {
    print("👍 Good job!");
  } else {
    print("📘 Keep practicing!");
  }
}

int askQuestion(int qNum, Map<String, dynamic> question) {
  print("Question $qNum: ${question['question']}");
  for (var option in question['options']) {
    print(option);
  }

  stdout.write("Enter your answer (a/b/c/d): ");
  String? userAnswer = stdin.readLineSync();

  if (userAnswer != null && userAnswer.toLowerCase() == question['answer']) {
    print("✅ Correct!\n");
    return 1;
  } else {
    print("❌ Incorrect! The correct answer is '${question['answer']}'.\n");
    return 0;
  }
}