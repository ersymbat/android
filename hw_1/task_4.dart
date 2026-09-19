void main(){
  List<int> numbers = [14, 88, 3, 42, 99, 12, 67]; //-> max: 99, min: 3
List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67]; //-> max: 949, min: 34
int first = numbers[0];
int last = numbers[numbers.length - 1];
int first1 = numbers1[0];
int last1 = numbers1[numbers1.length - 1];
// TASK4
// Manual min & max finder
for (int i = 0; i < numbers.length; i++) {
  if (numbers[i] > first) {
    first = numbers[i];
  }
  if (numbers[i] < last) {
    last = numbers[i];
  }
}
for (int i = 0; i < numbers1.length; i++) {
  if (numbers1[i] > first1) {
    first1 = numbers1[i];
  }
  if (numbers1[i] < last1) {
    last1 = numbers1[i];
  }
}
print("Max: $first, Min: $last");
print("Max: $first1, Min: $last1");
}