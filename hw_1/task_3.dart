
    // TASK3
// Vowel Counter in a String -> "flutter mobile development" -> 8

void main() {
    String text = "flutter mobile development";

  List<String> dauysty = ['a', 'e', 'i', 'o', 'u'];

    int count = 0;
     for (int i = 0; i < text.length; i++) {
    String letter = text[i];

        if (dauysty.contains(letter)) {
      count++;
    }
  }

      print(count);
}


