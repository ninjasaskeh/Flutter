import 'dart:ui';

import 'package:book_app/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matcher/matcher.dart';

class Detailpage extends StatelessWidget {
  final Book book;
  const Detailpage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail page"),
        ),
        body: ListView(
          children: [
            //Gambar
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              )),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Center(
                    child: Image.asset(
                      book.image,
                      width: 130,
                    ),
                  )),
            ),

            //JUDUL BUKU
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  book.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            //Info Buku
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bookInfo(book.rate.toString(), "Rating"),
                bookInfo(book.page.toString(), "Page"),
                bookInfo(book.language, "Language")
              ],
            ),
            //Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                book.description,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ));
  }

  bookInfo(String value, String bookType) {
    return Column(children: [
      Text(value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      const SizedBox(
        height: 5,
      ),
      Text(
        bookType,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      )
    ]);
  }
}
