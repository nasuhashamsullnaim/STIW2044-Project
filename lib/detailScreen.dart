import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'book.dart';

void main() => runApp(DetailScreen());

class DetailScreen extends StatefulWidget {
  final Book book;
  const DetailScreen({Key key, this.book}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double screenHeight, screenWidth;
  List book;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Book with Details'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Container(
              height: screenHeight / 3,
              width: screenWidth / 1.1,
              child: CachedNetworkImage(
                fit: BoxFit.fitHeight,
                imageUrl:
                    "https://itsmelele.com/DeafZone3/assets/images/books/${widget.book.image}.jpg",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    new Icon(Icons.broken_image),
              ),
            ),
            SizedBox(height: 3),
            Container(
              width: screenWidth / 1.1,
              height: screenHeight / 2,
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(children: <Widget>[
                    Table(defaultColumnWidth: FlexColumnWidth(1.0), children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 65,
                              child: Text("Book ID: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 65,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.bookid,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("Title: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.bookname,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("Price (RM): ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.bookprice,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("Quantity: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.quantity,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("Type: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.type,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text("Status: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ))),
                        ),
                        TableCell(
                            child: Container(
                          height: 30,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                ":  " + widget.book.status,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                        )),
                      ]),
                    ]),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
