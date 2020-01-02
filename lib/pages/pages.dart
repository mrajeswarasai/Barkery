import 'package:flutter/material.dart';

class PageOne extends StatelessWidget{
  @override
  Widget build(BuildContext context){
          return Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
             new Image(
            image: new AssetImage("assets/pet2.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
            Padding(
              padding: EdgeInsets.all(9.0),
              child: TextField(
                cursorColor: Colors.tealAccent,
                style: TextStyle(
                          color: Colors.tealAccent,
                        ),
              
               
                decoration: InputDecoration(
                    
                    labelText: "Search",
                    labelStyle: new TextStyle(
                      color: Colors.tealAccent,fontSize: 20.0),
                    
                    prefixIcon: Icon(Icons.search,color: Colors.tealAccent,),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.tealAccent),
                        borderRadius: BorderRadius.all(Radius.circular(25.0),
                        ),
                        
                        )),
              ),
            ),
            
            
           
          


            new Container(
                  alignment: Alignment.topLeft,
                  margin: new EdgeInsets.only(top: 90, left: 0.0),
              child: Text(
                '     Life is better with a pet.',
                style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 28.0,
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.normal,)
              ),
            ),

           

      
           new Container(
             
             margin: new EdgeInsets.only(top: 140.0, left: 15.0,right:15.0),
             child: Image(
               
                image: new AssetImage("assets/petlogo.png"),
                color: Colors.black12,
                colorBlendMode: BlendMode.darken,
 
                
              ),
           ),


          ],

        ),
 
      );
  }
}

class PageTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    

    
    return Container(
      
      
      color: Colors.lime[100],
    );
  }
}

class PageThree extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
     
      color: Colors.tealAccent,
    );
  }
}

class PageFour extends StatelessWidget{
  @override
  Widget build(BuildContext context){
          return Stack(
            
         
        children: <Widget>[
          Container(
            child:Image.asset(
                'assets/friends.jpg',
              ),
            
            
          ),

        Container(
          color: Colors.black87,

         
         margin: EdgeInsets.only(top:240),
          child: Material(
            
            
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100.0),
            ),

          child: Container(
            
       
            padding: EdgeInsets.only(left: 30.0,top:30.0,right: 10.0,bottom:10.0),
            child: Column(
              children: <Widget>[
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("Contributors",style: TextStyle(
                     color:Colors.white,
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                  
                   ),),
                   Icon(Icons.group_work,color: Colors.white,)
                 ],
                ),
                SizedBox(height: 30,),
               
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                 children: <Widget>[
                   Text(" Baddam Kalyan ",style: TextStyle(
                     color:Colors.white,
                     fontSize: 14.0,
                     fontWeight: FontWeight.bold,
                     
                  
                   ),),
                  Text(" Sai Rajeswar ",style: TextStyle(
                     color:Colors.white,
                     fontSize: 14.0,
                     fontWeight: FontWeight.bold,
                     
                  
                   ),),
                 ],
                ),
                 Padding(
                  padding: EdgeInsets.only(top:10.0),
                ),

                 Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                 children: <Widget>[
                   Text("Aniket Raj ",style: TextStyle(
                     color:Colors.white,
                     fontSize: 14.0,
                     fontWeight: FontWeight.bold,
                  
                   ),),
                  Text(" Shashwat Gupta ",style: TextStyle(
                     color:Colors.white,
                     fontSize: 14.0,
                     fontWeight: FontWeight.bold,
                     
                  
                   ),),
                   
                 ],
                ), 
                 Padding(
                  padding: EdgeInsets.only(top:10.0),
                ),
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                 children: <Widget>[
                   Text("Suvarat Trivedi ",style: TextStyle(
                     color:Colors.white,
                     fontSize: 14.0,
                     fontWeight: FontWeight.bold,
                     
                  
                   ),),
                  Text(" Dhruv Nair ",style: TextStyle(
                     color:Colors.white,
                     fontSize: 14.0,
                     fontWeight: FontWeight.bold,
                     
                  
                   ),),
                   
                 ],
                ), 
                
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                   
                  
                              
              ],
            ),
          ),
          ),
        ),

        ],
      );
  }
}
