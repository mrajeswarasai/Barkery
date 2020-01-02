import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsPage extends StatefulWidget
{
  DocumentSnapshot document;
//  String document;
//  List document;
  DetailsPage(@required this.document, {Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _DetailsPageState();
//  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
{
  
  void saveToDatabase()
  {
  

    

   

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
        title: Text('Details'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },),
      
      ),
      body:Stack( 
        children: <Widget>[
          Container(
            child:Image.network(widget.document['image_url'],
              fit: BoxFit.cover,
              ),
          ),

          Container(
            margin: EdgeInsets.only(top:240),
            child: Material(
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(90.0),
            ),
            
            child: Container(
              padding: EdgeInsets.only(left: 30.0,top:50.0,right: 10.0,bottom:10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                       Text('Breed Of the pet is  ',style: TextStyle(
                     color:Colors.teal,
                     fontSize: 16.0,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                      Text(widget.document['breed'],style: TextStyle(
                      color:Colors.redAccent,
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                  
                      ),),
                      
                      ],
                      ),
                  SizedBox(height: 10,),
               
                  Row(
                  
                  
                 children: <Widget>[
                    Text('Category Of pet is  ',style: TextStyle(
                     color:Colors.teal,
                     fontSize: 16.0,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   Text(widget.document['category'],style: TextStyle(
                     color:Colors.teal,
                     fontSize: 18.0,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   
                 ],
                ),
                 Padding(
                  padding: EdgeInsets.only(top:10.0),
                ),

                 Row(
                  
                  
                 children: <Widget>[
                    Text('Age Of the pet is ',style: TextStyle(
                     color:Colors.teal,
                     fontSize: 16.0,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   Text(widget.document['age'],style: TextStyle(
                     color:Colors.teal,
                     fontSize: 18.0,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   
                 ],
                 
                ),

                 Row(
                  
                  
                  
                 children: <Widget>[
                    Text('Sex of pet is  ',style: TextStyle(
                     color:Colors.teal,
                     fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  
                   ),),
                   Text(widget.document['sex'],style: TextStyle(
                     color:Colors.teal,
                     fontSize: 18.0,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   
                 ],
                 
                ),
                 Row(
                  
                  
                  
                 children: <Widget>[
                    Text('Any queries about pet you can contact  ',style: TextStyle(
                     color:Colors.teal,
                     fontSize: 16.0,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   Text(widget.document['seller_info'],style: TextStyle(
                     color:Colors.teal,
                     fontSize: 18.0,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   
                 ],
                 
                ),
                 Row(
                  
                  
                  
                 children: <Widget>[
                   Text('Seller described the pet as : ',style: TextStyle(
                     color:Colors.teal,
                     fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  
                   ),),
                   Text(widget.document['description'],style: TextStyle(
                     color:Colors.teal,
                     fontSize: 18.0,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic,
                  
                   ),),
                   
                 ],
                 
                ),
                

                Padding(
                  padding: EdgeInsets.only(top: 30,),
                ),
                Column(
                  
                   
                    children: <Widget>[
                     
                    RaisedButton(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.redAccent,    
                          padding: EdgeInsets.all(4),
                          child: Text('Like',style: TextStyle(
                            color: Colors.white,
                            
                          ),),
                          onPressed: () {}

                        ),
                      

                      SizedBox(height: 7,),

                      RaisedButton(
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.redAccent,
                          padding: EdgeInsets.all(10),
                          child: Text('Buy now',style: TextStyle(
                            color: Colors.white,
                          ),),
                          onPressed: () {
                            Firestore.instance.collection('Pets').document(widget.document.documentID).setData(
                              {'is_in_cart': true},
                            );
                          }
                        ),
                      



                    ],
                ),

                
              ],
            ),
          ),
          ),
        ),

        ],
      ) 
        //child: _buildListItem1(context, widget.document),
        //_buildListItem1(context, widget.document)
      //  child: Image.network(widget.document['image_url']),
      
    );
  }

}