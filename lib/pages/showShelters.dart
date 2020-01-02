import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Shelters.dart';
import 'showVets.dart';
import 'petUpload.dart';

class SheltersPage extends StatefulWidget
{

  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SheltersPageState();
  }
}


class _SheltersPageState extends State<SheltersPage>
{

  List<Shelters> sheltersList = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DatabaseReference sheltersRef = FirebaseDatabase.instance.reference().child("Shelters");

    sheltersRef.once().then((DataSnapshot snap)
    {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      sheltersList.clear();

      for(var individualKey in KEYS)
      {
        Shelters shelters = new Shelters
        (
          DATA[individualKey]['image'],
          DATA[individualKey]['shelter_type'],
          DATA[individualKey]['shelter_name'],
          DATA[individualKey]['shelter_location'],
          DATA[individualKey]['shelter_city'],
          DATA[individualKey]['shelter_contact_no'],
          DATA[individualKey]['shelter_email'],
        );

        sheltersList.add(shelters);
      }

      setState(() 
      {
        print('Length : $sheltersList.length');
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
        title: Text('Shelters'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },),
      
      ),
      body: new Container
      (
        child: sheltersList.length == 0? new Text('No Post available') : new ListView.builder
        (
          itemCount: sheltersList.length,
          itemBuilder: (_, index)
          {
            return PostUI(sheltersList[index].image,sheltersList[index].name,sheltersList[index].type,sheltersList[index].location,sheltersList[index].city,sheltersList[index].contact,sheltersList[index].email);
          },

        ),
      ),




      
    );
  }

  Widget PostUI(String image, String name, String type, String location, String city, String contact, String email)
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

            new Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>
              [
                new Text
                (
                  type,
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