
abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem({
    required this.id,
    required this.title,
    required this.price,
  });

  String getDetails();
}

mixin Downloadable {
  void download(String title) {
    print("Downloading: $title");
  }
}

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook({
    required String id,
    required String title,
    required double price,
    required this.durationHours,
    required this.narrator,
  }) : super(
          id: id,
          title: title,
          price: price,
        );

  @override
  String getDetails() {
    return "$title - $price\$ - ${durationHours}h - Narrator: $narrator";
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook({
    required String id,
    required String title,
    required double price,
    required this.fileSizeMB,
    required this.author,
  }) : super(
          id: id,
          title: title,
          price: price,
        );

  @override
  String getDetails() {
    return "$title - $price\$ - ${fileSizeMB}MB - Author: $author";
  }
}

class ShoppingCart {
  List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  double calculateTotalWithTax({double taxRate = 0.12}) {
    double total = _items.fold(0, (sum, item) => sum + item.price);

    return total + total * taxRate;
  }

  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }

 void printReceipt() {
  print("Receipt:");

  for (var item in _items) {
    print(item.getDetails());

    if (item is Audiobook) {
      item.download(item.title);
    }

    if (item is EBook) {
      item.download(item.title);
    }
  }

  print("Total with tax: ${calculateTotalWithTax()}");
}
}

void main() {
  ShoppingCart cart = ShoppingCart();

  Audiobook audiobook = Audiobook(
    id: "1",
    title: "Harry Potter",
    price: 15.0,
    durationHours: 8.5,
    narrator: "Stephen Fry",
  );

  EBook ebook = EBook(
    id: "2",
    title: "The Hobbit",
    price: 10.0,
    fileSizeMB: 5.5,
    author: "J.R.R. Tolkien",
  );

  cart.addItem(audiobook);
  cart.addItem(ebook);

  cart.printReceipt();

  print("Books under 12\$:");

  for (var item in cart.filterByMaxPrice(12)) {
    print(item.getDetails());
  }
}

