// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  topTrending,
  allNews,
}

enum SortByEnum {
  relevancy, // articles more closely related to q come first.
  popularity, // articles from popular sources and publishers come first.
  publishedAt, // newest articles come first.
}

TextStyle smallTextStyle = GoogleFonts.montserrat(fontSize: 15);

const List<String> searchKeywords = [
  "Football",
  "Flutter",
  "Python",
  "Weather",
  "Crypto",
  "Bitcoin",
  "Youtube",
  "Netflix",
  "Meta"
];