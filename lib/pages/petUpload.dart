import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UploadPhotoPage extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return _UploadPhotoPageState();
  }
}


class _UploadPhotoPageState extends State<UploadPhotoPage>
{
  File sampleImage;
  File _imageFile;
  String _petType, _petBreed, _petAge, _petSex, _petSellerInfo, _petDescription;

  String url;
  final formKey = new GlobalKey<FormState>();

  Future getImage() async
  {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() 
    {
      sampleImage = tempImage; 
    });
  }


  bool validateAndSave()
  {
    final form = formKey.currentState;

    if(form.validate())
    {
      form.save();
      return true;
    }
    else
    {
      return false;
    }
  }



  Future _pickImageFromGallery() async {
    final File _sampleImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() 
    {
      sampleImage = _sampleImage; 
    });
  }

  Future _pickImageFromCamera() async {
    final File _sampleImage =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() 
    {
      sampleImage = _sampleImage; 
    });
  }






  void uploadStatusImage() async
  {
    if(validateAndSave())
    {
      final StorageReference postImageRef = FirebaseStorage.instance.ref().child("Pet Images");

      var timeKey = new DateTime.now();

      final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);

      var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();

      url = Imageurl.toString();

      print("Image Url = " + url);

      goToHomePage();

      saveToDatabase(url);



    }
  }

  void saveToDatabase(url)
  {
    var dbTimeKey = new DateTime.now();
    var formatDate = new DateFormat('yyyy');
    var formatTime = new DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    

    var data = 
    {
      "image_url": url,
      "breed": _petBreed,
      "category": _petType,
      "age": _petAge,
      "sex": _petSex,
      "seller_info": _petSellerInfo,
      "description": _petDescription,
      "is_in_cart": false,
      "since":date,
    };

    Firestore.instance.collection('Pets').add(data);

  }


  void goToHomePage()
  {
    Navigator.push
    (
      context,
      MaterialPageRoute(builder: (context)
      {
        return new HomePage();
      })
    );
  }






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text("Upload Pet"),
        centerTitle: true,
      ),

      body: new Center
      (
        child: sampleImage == null ? RaisedButton(
          child: Text("Capture an Image"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),

          onPressed: _pickImageFromCamera,
        ): enableUpload(),
      ),

      floatingActionButton: new FloatingActionButton
      (
        onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }


  Widget enableUpload()
  {
    return Container
    (
      child: new Form
      (
        key: formKey,

        child: new Theme(
          data: new ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red[400],
            inputDecorationTheme: new InputDecorationTheme(
            labelStyle: new TextStyle(
              color: Colors.teal,fontSize: 20.0))),

        child: new ListView
        (
          children: <Widget>
          [
            Image.file(sampleImage, height: 330.0, width: 660.0,),

            SizedBox(height: 15.0,),
            TextFormField(
              maxLength: 20,
              cursorColor: Colors.redAccent,
              style: TextStyle(
                color: Colors.redAccent,
              ),
              decoration: new InputDecoration(
                labelStyle: TextStyle(color: Colors.redAccent),
                labelText: "Enter pet type",
              ),
              validator: (value)
                {
                  return value.isEmpty ? 'Pet type required' : null;
                },
            
                onSaved: (value)
                {
                  return _petType = value;
                },
            ),
            SizedBox(height: 15.0,),
            TextFormField(
              maxLength: 20,
              cursorColor: Colors.redAccent,
              style: TextStyle(
                color: Colors.redAccent,
              ),
              decoration: new InputDecoration(
                labelStyle: TextStyle(color: Colors.redAccent),
                labelText: "Enter pet Breed",
              ),
              validator: (value)
                {
                  return value.isEmpty ? 'Pet Breed required' : null;
                },
            
                onSaved: (value)
                {
                  return _petBreed = value;
                },
            ),
            SizedBox(height: 15.0,),
            TextFormField(
              maxLength: 20,
              cursorColor: Colors.redAccent,
              style: TextStyle(
                color: Colors.redAccent,
              ),
              decoration: new InputDecoration(
                labelStyle: TextStyle(color: Colors.redAccent),
                labelText: "Enter pet Age",
              ),
              validator: (value)
                {
                  return value.isEmpty ? 'Pet Age required' : null;
                },
            
                onSaved: (value)
                {
                  return _petAge = value;
                },
            ),
            SizedBox(height: 15.0,),
            TextFormField(
              maxLength: 20,
              cursorColor: Colors.redAccent,
              style: TextStyle(
                color: Colors.redAccent,
              ),
              decoration: new InputDecoration(
                labelStyle: TextStyle(color: Colors.redAccent),
                labelText: "Enter Sex",
              ),
              validator: (value)
                {
                  return value.isEmpty ? 'Pet Sex required' : null;
                },
            
                onSaved: (value)
                {
                  return _petSex = value;
                },
            ),
            SizedBox(height: 15.0,),
            TextFormField(
              maxLength: 20,
              cursorColor: Colors.redAccent,
              style: TextStyle(
                color: Colors.redAccent,
              ),
              decoration: new InputDecoration(
                labelStyle: TextStyle(color: Colors.redAccent),
                labelText: "Enter Seller's Info",
              ),
              validator: (value)
                {
                  return value.isEmpty ? "Seller's Info required" : null;
                },
            
                onSaved: (value)
                {
                  return _petSellerInfo = value;
                },
            ),
            SizedBox(height: 15.0,),
            TextFormField(
              maxLength: 20,
              cursorColor: Colors.redAccent,
              style: TextStyle(
                color: Colors.redAccent,
              ),
              decoration: new InputDecoration(
                labelStyle: TextStyle(color: Colors.redAccent),
                labelText: "Enter pet Description",
              ),
              validator: (value)
                {
                  return value.isEmpty ? 'Pet Description required' : null;
                },
            
                onSaved: (value)
                {
                  return _petDescription = value;
                },
            ),
            

              SizedBox(height: 15.0,),

              RaisedButton(
                child: Text(
                  'Upload',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.redAccent,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),

                onPressed: uploadStatusImage,
              )

            ],

          ),
        ),
      ),
      );
  }
}