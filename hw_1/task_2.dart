bool isLeapYear(int year) {
  if (year % 400 == 0) {
    return true;
  }

  if (year % 100 == 0) {
    return false;
  }

  if (year % 4 == 0) {
    return true;
  }

  return false;
}
// фыаца

int daysInMonth(int month, int year) {
  if (month == 2) {
    if (isLeapYear(year)) {
      return 29;
    } else {
      return 28;
    }
  }

  if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  }

  return 31;
}

String nextDate(int day, int month, int year) {
  if (month < 1 || month > 12) {
    return "invalid date";
  }

  if (day < 1 || day > daysInMonth(month, year)) {
    return "$day.$month.$year --> invalid date";
  }

  day++;

  if (day > daysInMonth(month, year)) {
    day = 1;
    month++;

    if (month > 12) {
      month = 1;
      year++;
    }
  }

  return "$day.$month.$year";
}

void main() {
  print(nextDate(28, 2, 2024));
  print(nextDate(05,09,2026));
  print(nextDate(28,02,2024));
  print(nextDate(28,02,2026));
  print(nextDate(29,02,2026));
  print(nextDate(28,02,2100));
  print(nextDate(28,02,2100));
  print(nextDate(31,12,2025));

  
}