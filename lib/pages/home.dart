import 'package:flutter_dbms/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'showShelters.dart';
import 'showVets.dart';
//my own imports
import 'package:flutter_dbms/componets/horizontal_listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'searchservice.dart';
import 'home.dart';
import 'details.dart';
import 'petUpload.dart';
import 'pages.dart';
import 'cats.dart';
import 'dogs.dart';
import 'showShelters.dart';
import 'all_pets.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentTab=0;

  HomePage one;
  PageTwo two;
  PageThree three;
  PageFour four;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState(){
    one= new HomePage();
    two= PageTwo();
    three= PageThree();
    four= PageFour();

    pages = [one, two, three,four];
    super.initState();
    currentPage = one;
    _getUserDetails();
  }


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

  

   void _getUserDetails() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(user.uid);
    print(user.email);
    
    final _userEmail = user.email; 
  }

  
  
  
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/carousel_1.jpg'),
          AssetImage('images/carousel_2.jpg'),
          AssetImage('images/carousel_3.jpg'),
          AssetImage('images/carousel_4.jpg'),
          AssetImage('images/carousel_5.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red.shade900,
        title: Text('Barkery'),
        actions: <Widget>[
          
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push
                  (
                    context,
                    MaterialPageRoute(builder: (context)
                    {
                      return new CartPage();
                    })
                  );
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              
              accountName: Text('Sai'),
              accountEmail: FutureBuilder(
                future: FirebaseAuth.instance.currentUser(),
                builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.email);
                  }
                  else {
                    return Text('Loading...');
                  }
                },
              ),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.red.shade900
              ),
            ),

//            body

            

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){
                 Navigator.push
                  (
                    context,
                    MaterialPageRoute(builder: (context)
                    {
                      return new CartPage();
                    })
                  );
              },
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push
                  (
                    context,
                    MaterialPageRoute(builder: (context)
                    {
                      return new SheltersPage();
                    })
                  );
              },
              child: ListTile(
                title: Text('Shelters'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push
                  (
                    context,
                    MaterialPageRoute(builder: (context)
                    {
                      return new VetsPage();
                    })
                  );
              },
              child: ListTile(
                title: Text('Veterinaries'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),



            

            InkWell(
              onTap: (){
                Navigator.push
                  (
                    context,
                    MaterialPageRoute(builder: (context)
                    {
                      return new UploadPhotoPage();
                    })
                  );
              },
              child: ListTile(
                title: Text('Add a pet'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),

          ],
        ),
      ),

      body: new Column(
        children: <Widget>[
          
          //image carousel begins here
          image_carousel,

          //padding widget
        
          //Horizontal list view begins here
         // HorizontalList(),

          Container(
            height: 80.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push
                                (
                                  context,
                                  MaterialPageRoute(builder: (context)
                                  {
                                    return new DogsPage();
                                  })
                              );
                    },
                    child: Container(
                      width: 80.0,
                      child: ListTile(
                        title: Image.asset(
                          'images/categories/dog.png',
                          width: 65.0,
                          height: 60.0,
                        ),
                        subtitle: Container(
                          alignment: Alignment.topCenter,
                          child: Text("dog", style: new TextStyle(fontSize: 12.0),),
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
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
                          'images/categories/cat.png',
                          width: 65.0,
                          height: 60.0,
                        ),
                        subtitle: Container(
                          alignment: Alignment.topCenter,
                          child: Text("Cat", style: new TextStyle(fontSize: 12.0),),
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
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
                          'images/categories/bird.png',
                          width: 65.0,
                          height: 60.0,
                        ),
                        subtitle: Container(
                          alignment: Alignment.topCenter,
                          child: Text("Bird", style: new TextStyle(fontSize: 12.0),),
                        )
                      ),
                    ),
                  ),
                ),

                
              ],
            ),
          ),

          SizedBox(height: 10.0,),

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Recent products')),),

          //grid view
          
          Flexible(
            child: new StreamBuilder(
              stream: Firestore.instance.collection('Pets').snapshots(),
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




class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    AllpetsPage(),
    DogsPage(),
  ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('Home'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.pets),
           title: Text('Pets'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     ),
   );
 }
 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}
