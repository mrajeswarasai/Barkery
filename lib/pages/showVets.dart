import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'Vets.dart';
import 'showShelters.dart';
class VetsPage extends StatefulWidget
{

  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VetsPageState();
  }
}


class _VetsPageState extends State<VetsPage>
{

  List<Vets> vetsList = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DatabaseReference vetsRef = FirebaseDatabase.instance.reference().child("Vets");

    vetsRef.once().then((DataSnapshot snap)
    {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      vetsList.clear();

      for(var individualKey in KEYS)
      {
        Vets vets = new Vets
        (
          DATA[individualKey]['image'],
          DATA[individualKey]['vet_name'],
          DATA[individualKey]['vet_location'],
          DATA[individualKey]['vet_city'],
          DATA[individualKey]['vet_contact_no'],
          DATA[individualKey]['vet_email'],
        );

        vetsList.add(vets);
      }

      setState(() 
      {
        print('Length : $vetsList.length');
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold
    (
      appBar: new AppBar
      (
        elevation: 0.1,
        backgroundColor: Colors.red.shade900,
        title: Text('Veternaries'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },),
      
      ),

      body: new Container
      (
        child: vetsList.length == 0? new Text('No Post available') : new ListView.builder
        (
          itemCount: vetsList.length,
          itemBuilder: (_, index)
          {
            return PostUI(vetsList[index].image,vetsList[index].name,vetsList[index].location,vetsList[index].city,vetsList[index].contact,vetsList[index].email);
          },

        ),
      ),

      
    );
  }

  Widget PostUI(String image, String name, String location, String city, String contact, String email)
  {
    return new Card
    (
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),


      child: new Container
      (
        padding: new EdgeInsets.all(14.0),

        child: new Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>
          [
            new Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>
              [
                new Text
                (
                  name,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10.0,),

            new Image.network(image, fit:BoxFit.cover),

            SizedBox(height: 10.0,),

             new Row
            (
              children: <Widget>
              [
                new Icon(Icons.location_on),
                new SizedBox
                (
                  width: 5.0,
                ),
                new Text
                (
                  location,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),

              ],
            ),
            SizedBox(height: 10.0,),
            
             new Row
            (
              children: <Widget>
              [
                new Icon(Icons.phone),
                new SizedBox
                (
                  width: 5.0,
                ),
                new Text
                (
                  contact,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),

              ],
            ),

            SizedBox(height: 10.0,),
            
             new Row
            (
              children: <Widget>
              [
                new Icon(Icons.email),
                new SizedBox
                (
                  width: 5.0,
                ),
                new Text
                (
                  email,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}