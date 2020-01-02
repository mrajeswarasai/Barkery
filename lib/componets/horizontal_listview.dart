import 'package:flutter/material.dart';
import 'package:flutter_dbms/pages/cats.dart';
import 'package:flutter_dbms/pages/dogs.dart';



class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/categories/dog.png',
            image_caption: 'dog',
            
          ),

          Category(
            image_location: 'images/categories/cat.png',
            image_caption: 'cat',
          ),

          Category(
            image_location: 'images/categories/bird.png',
            image_caption: 'bird',
          ),

          
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  DogsPage dog;
  CatsPage cat;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () {
          Navigator.push
                    (
                      context,
                      MaterialPageRoute(builder: (context)
                      {
                        return new CatsPage();
                      })
                  );
        },
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 65.0,
              height: 60.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text("cat", style: new TextStyle(fontSize: 12.0),),
            )
          ),
        ),
      ),
    );
  }
}
