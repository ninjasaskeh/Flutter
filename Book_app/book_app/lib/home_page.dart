import 'package:book_app/book.dart';
import 'package:book_app/detail_page.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            //Banner
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upgrade your skill\n Upgrade your life",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Image.asset(
                    "images/banner.png",
                    width: 100,
                  )
                ],
              ),
            ),

            //Text Books
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Books",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),

            //List Books
            buildListBook()
          ],
        ),
      ),
    );
  }

  buildListBook() {
    return ListView.builder(
      itemCount: listBook.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final book = listBook[index];
        return GestureDetector(
          onTap: () {
            final route = MaterialPageRoute(
                builder: (context) => Detailpage(
                      book: book,
                    ));
            Navigator.push(context, route);
          },
          child: Container(
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.0,
                    offset: const Offset(0, 1), //change position of shadow
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    book.image,
                    width: 64,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(book.categoryBook,
                          style: const TextStyle(fontSize: 20))
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}
