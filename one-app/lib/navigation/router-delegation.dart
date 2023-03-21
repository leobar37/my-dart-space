import 'package:flutter/material.dart';
// Book class

class Book {
  final String title;

  final String description;

  // constructors
  Book.withTitle(this.title) : description = "No description available";
  Book.withDescription(this.description) : title = "No title available";
  Book(this.title, this.description);
}

class BooksApp extends StatefulWidget {
  const BooksApp({super.key});
  @override
  State<BooksApp> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Books App",
      routerDelegate: BookRouterDelegate(),
      routeInformationParser: BookRouteInformationParser(),
    );
  }
}

// Books Router Path

class BookRouterPath {
  final int? id;
  final bool isUknown;

  BookRouterPath.home()
      : id = null,
        isUknown = false;

  BookRouterPath.details(this.id) : isUknown = false;

  BookRouterPath.unknown()
      : id = null,
        isUknown = true;

  bool get isHomePage => id == null;
  bool get isDetailsPage => id != null;
}

// router delegate

class BookRouterDelegate extends RouterDelegate<BookRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRouterPath> {
  late Book? _selectedBook = null;
  bool show404 = false;

  List<Book> books = [
    Book("One", "oneDescription"),
    Book("Two", "TwoDescription"),
    Book("Three", "ThreeDescription"),
    Book("Four", "FourDescription"),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
            child: BookListScreen(
          books: this.books,
          key: ValueKey("ListPage"),
          onTapped: (book) {
            _selectedBook = book;
            notifyListeners();
          },
        )),
        if (show404)
          MaterialPage(child: UnknownScreen(), key: ValueKey("UnknownPage")),
        if (_selectedBook != null) BookDetailPage(book: _selectedBook as Book),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedBook = null;
        show404 = false;
        notifyListeners();
        return true;
      },
    );
  }

  BookRouterPath get currentInformation {
    if (show404) {
      return BookRouterPath.unknown();
    }
    return _selectedBook == null
        ? BookRouterPath.unknown()
        : BookRouterPath.details(books.indexOf(_selectedBook as Book));
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  /**
   * When a new route has been pushed 
   * to the application, Router calls setNewRoutePath,
   * which gives our app the opportunity to update  
   * the app state based on the changes to the route
   */
  @override
  Future<void> setNewRoutePath(BookRouterPath configuration) async {
    if (configuration.isUknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }
    if (configuration.isDetailsPage) {
      _selectedBook = books[configuration.id as int];
      if (_selectedBook == null) {
        show404 = true;
      }
    }
    show404 = false;
  }
}

// Router Information Parser
/**
 *  The router information parser provides a hook to parse 
 * incoming routes(RouterInformation) and convert it into 
 * a used defined type (BookRouterPath)  
 */

class BookRouteInformationParser
    extends RouteInformationParser<BookRouterPath> {
  @override
  Future<BookRouterPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "");

    // home
    if (uri.pathSegments.length == 0) {
      return BookRouterPath.home();
    }
    // details /book/:id
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != "book") return BookRouterPath.unknown();
      var maybeBookId = uri.pathSegments[1];
      final bookId = int.tryParse(maybeBookId);
      if (bookId == null) return BookRouterPath.unknown();
      return BookRouterPath.details(bookId);
    }
    // hanlde unknown routes
    return BookRouterPath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(BookRouterPath configuration) {
    if (configuration.isHomePage) {
      return RouteInformation(location: "/");
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(location: "/book/${configuration.id}");
    }
    if (configuration.isUknown) {
      return RouteInformation(location: "/404");
    }
    return null;
  }
}
// book detail page

class BookDetailPage extends Page {
  final Book book;

  BookDetailPage({required this.book}) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return BookScreen(book: book);
        });
  }
}

// Book screen

class BookScreen extends StatelessWidget {
  final Book book;

  BookScreen({required this.book}) : super(key: ValueKey(book));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("your book is ${book.title}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(book.description,
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}

// Unknown screen
class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '404!',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

// Book list screen

class BookListScreen extends StatelessWidget {
  final List<Book> books;

  final ValueChanged<Book> onTapped;

  BookListScreen({super.key, required this.books, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: ListView(
        children: [
          for (Book book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.description),
              onTap: () {
                onTapped(book);
              },
            )
        ],
      ),
    );
  }
}
