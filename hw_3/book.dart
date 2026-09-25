class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });
  
}

class Library {
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => book.isBorrowed == false).toList();
  }

  double getTotalValue() {
    return _books.fold(0, (sum, book) => sum + book.price);
  }
}

void main() {
  Library library = Library();

  library.addBook(Book(
    title: "Harry Potter",
    author: "J.K. Rowling",
    price: 25.0,
  ));

  library.addBook(Book(
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    price: 20.0,
    isBorrowed: true,
  ));

  library.addBook(Book(
    title: "Baqytsyz Zhamal",
    author: "Mirzhakyp Dulatuly",
    price: 45.0,
  ));

  library.addBook(Book(
    title: "The way of the Abai",
    author: "Mukhtar Auezov",
    price: 56.0,
  ));

  print("Available books:");

  for (var book in library.getAvailableBooks()) {
    print("${book.title} - ${book.author}");
  }

  print("Total value: ${library.getTotalValue()}");
}

