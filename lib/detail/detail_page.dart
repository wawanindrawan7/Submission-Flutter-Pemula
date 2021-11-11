import 'package:flutter/material.dart';
import 'package:submission_flutter/model/lombok_place.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.place}) : super(key: key);
  final LombokPlace place;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: height * .5,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    image: DecorationImage(
                        image: AssetImage(widget.place.imageAsset),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    height: height * .5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 280,
              right: 118,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.place.imageAsset),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      blurRadius: 2,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 450,
              left: 128,
              child: Column(
                children: [
                  Text(
                    widget.place.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xffEE684A),
                      ),
                      Text(widget.place.location),
                    ],
                  ),
                  Row(
                    children: [
                      Text(widget.place.rate),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffEE684A),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffEE684A),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffEE684A),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffEE684A),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffEE684A),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 520),
              child: Divider(
                color: Colors.grey,
                height: 20,
                thickness: 4,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Positioned(
              top: 540,
              left: 12,
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 570, left: 12, right: 12, bottom: 8),
              child: Text(
                widget.place.description,
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  BookmarkButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });

          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Text('Show SnackBar');
        },
      ),
    );
  }
}
