import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zefyr/zefyr.dart';

class CreateArtikel extends StatefulWidget {
  @override
  _CreateArtikelState createState() => _CreateArtikelState();
}

class _CreateArtikelState extends State<CreateArtikel> {
  TextEditingController controller = TextEditingController();
  TextEditingController headerController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _headerNode = FocusNode();

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigh = MediaQuery.of(context).size.height;

    Widget _toolbar = Container(
      height: heigh * 7 / 100,
      width: double.infinity,
      color: Colors.grey[900],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.text_fields,
              color: Colors.grey,
            ),
            onPressed: null,
            tooltip: 'disable',
          ),
          IconButton(
            icon: Icon(
              Icons.format_bold,
              color: Colors.grey,
            ),
            onPressed: null,
            tooltip: 'disable',
          ),
          IconButton(
            icon: Icon(
              Icons.format_italic,
              color: Colors.grey,
            ),
            onPressed: null,
            tooltip: 'disable',
          ),
          IconButton(
            icon: Icon(
              Icons.format_underlined,
              color: Colors.grey,
            ),
            onPressed: null,
            tooltip: 'disable',
          ),
          IconButton(
            icon: Icon(
              Icons.format_list_bulleted,
              color: Colors.grey,
            ),
            onPressed: null,
            tooltip: 'disable',
          ),
        ],
      ),
    );

    final imageForm = IconButton(
      icon: Icon(Icons.add_a_photo),
      onPressed: () {},
    );

    final headerForm = TextFormField(
      autofocus: true,
      controller: headerController,
      focusNode: _headerNode,
      style: TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          hintText: 'Title. . . ',
          hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0)),
      onFieldSubmitted: (term) {
        _headerNode.unfocus();
        FocusScope.of(context).requestFocus(_focusNode);
      },
    );

    final bodyForm = TextFormField(
      focusNode: _focusNode,
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Description here. . .',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0)),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.orangeAccent,
                ),
                onPressed: () {},
              ),
              backgroundColor: Colors.grey[900],
              elevation: 1.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "Post",
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            resizeToAvoidBottomPadding: false,
            body: Stack(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: imageForm,
                        ),
                        headerForm,
                        bodyForm
                      ],
                    )),
                Align(
                  child: _toolbar,
                  alignment: FractionalOffset.bottomCenter,
                )
              ],
            )),
      ),
    );
  }
}
