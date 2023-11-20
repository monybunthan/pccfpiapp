// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, use_build_context_synchronously, camel_case_types, library_private_types_in_public_api, prefer_const_constructors, duplicate_ignore, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../widget/theme/themes.dart';

class Crud_Page extends StatefulWidget {
  const Crud_Page({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Crud_Page> {
  // text fields' controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('news');

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _titleController.text = documentSnapshot['title'];
      _subtitleController.text = documentSnapshot['subtitle'];
      _dataController.text = documentSnapshot['data'];
      _contentController.text = documentSnapshot['content'];
      _imageController.text = documentSnapshot['image'];
      _idController.text = documentSnapshot['id'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: 'id',
                  ),
                ),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'title'),
                ),
                TextField(
                  controller: _subtitleController,
                  decoration: const InputDecoration(labelText: 'subtitle'),
                ),
                TextField(
                  controller: _dataController,
                  decoration: const InputDecoration(labelText: 'data'),
                ),
                TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(labelText: 'content'),
                ),
                TextField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'Url Image'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? title = _titleController.text;
                    final String? subtitle = _subtitleController.text;
                    final String? data = _dataController.text;
                    final String? content = _contentController.text;
                    final String? image = _imageController.text;
                    final double? id = double.tryParse(_idController.text);
                    if (title != null &&
                        subtitle != null &&
                        data != null &&
                        content != null &&
                        id != null &&
                        image != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss.add({
                          "title": title,
                          "subtitle": subtitle,
                          "data": data,
                          "content": content,
                          "id": id,
                          "image": image
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You have successfully Add a product')));
                      }

                      if (action == 'update') {
                        // Update the product
                        await _productss.doc(documentSnapshot!.id).update({
                          "title": title,
                          "subtitle": subtitle,
                          "data": data,
                          "content": content,
                          "id": id,
                          "image": image
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You have successfully Update a product')));
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _subtitleController.text = '';
                      _dataController.text = '';
                      _contentController.text = '';
                      _idController.text = '';
                      _imageController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    String _orderBy =
        'defaultSort'; //? HERE YOU PUT WHAT YOUR SORTING FIELD NAME IS
    bool _isDescending = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'មុខវិជ្ជាសិក្សា',
          style: TextStyle(fontFamily: 'DG', color: color_rgb),
        ),
        leading: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.transparent, width: 0.8),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: color_rgb,
            )),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
          // stream: _productss.snapshots(),
          stream: FirebaseFirestore.instance
              .collection("news")
              .orderBy("id", descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: color_rgb, width: 0.8),
                        // ignore: prefer_const_constructors
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    margin: const EdgeInsets.only(right: 7, left: 7, top: 7),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(documentSnapshot['id'].toString() +
                              documentSnapshot['title']),
                          subtitle: Text(documentSnapshot['subtitle']),
                          trailing: Text(documentSnapshot['data']),
                        ),
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  color_rgb, //                   <--- border color
                              width: 1,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                documentSnapshot['image'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: null /* add child content here */,
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            //Phone call
                            Text(
                              documentSnapshot["content"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'DG',
                                color: Colors.grey[800],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  // Press this button to edit a single product
                                  IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () =>
                                          _createOrUpdate(documentSnapshot)),
                                  // This icon button is used to delete a single product
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () =>
                                          _deleteProduct(documentSnapshot.id)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),

      // Add new product
      floatingActionButton: FloatingActionButton(
        backgroundColor: color_rgb,
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
