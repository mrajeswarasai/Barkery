import 'package:flutter_dbms/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'showShelters.dart';
import 'showVets.dart';
//my own imports
import 'package:flutter_dbms/componets/horizontal_listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'searchservice.dart';
import 'details.dart';
import 'dogs.dart';
import 'cats.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();
var queryResultSet = [];
var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['businessName'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _getUserDetails();    
    
  }

   void _getUserDetails() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(user.uid);
    print(user.email);
    
    final _userEmail = user.email; 
  }

  
  
  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: new AppBar
      (
        elevation: 0.1,
        backgroundColor: Colors.red.shade900,
        title: Text('My Cart'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },),
      
      ),
      
      body: new Column(
        children: <Widget>[
          
          
          //image carousel begins here
          

          //padding widget
          

          //Horizontal list view begins here
          
          

          //padding widget
          
          //grid view
          
          Flexible(
            child: new StreamBuilder(
              stream: Firestore.instance.collection('Pets').where("is_in_cart", isEqualTo:true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return new GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: snapshot.data.documents.length,
                  padding: const EdgeInsets.all(4.0),
                  itemBuilder: (context, index) =>
                      _buildListItem1(context, snapshot.data.documents[index]),
                );
          }),
          ),

        ],
      ),
    );
  }


  _buildListItem1(context, document) {
    return Card(
      key: ValueKey(document.documentID),
      child: Hero(
          tag: Text(document['breed'].toString()),
          child: Material(
            child: InkWell(
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(document),
                    ));
              },
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Text(
                          document['breed'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          document['sex'].toString(),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          document['category'].toString(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              ),
                        ),
                    ),
                  ),
                  child: Image.network(
                    document['image_url'].toString(),
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}


Widget buildResultCard(data) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 2.0,
    child: Container(
      child: Center(
        child: Text(data['businessName'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        )
      )
    )
  );
}