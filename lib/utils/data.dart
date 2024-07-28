class Data {
  static Set<String> bookURL = {};
  static List<String> bookMarkURL = [];

  static void covertUniqueData() {
    bookMarkURL = bookURL.toList();
  }

  static List<Map<String, String>> dataBrows = [
    {"title": "Google", "browsLink": "https://www.google.com/"},
    {"title": "Yahoo",
      "browsLink": "https://in.search.yahoo.com/"},
    {"title": "Bing",
      "browsLink": "https://www.bing.com/"},
    {"title": "Duck Duck Go",
      "browsLink": "https://duckduckgo.com/"},
  ];
}
