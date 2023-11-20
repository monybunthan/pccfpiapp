// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

import 'post.dart';

class Pagination extends StatefulWidget {
  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  @override
  void initState() {
    super.initState();

    uploadRandom();
  }

  void uploadRandom() async {
    final postCollection =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: ((snapshot, _) => Post.fromJson(snapshot.data()!)),
              toFirestore: (post, _) => post.toJson(),
            );
    final numbers = List.generate(10, (index) => index);

    for (final number in numbers) {
      final post = Post(
        title: 'Random Title $number',
        likes: Random().nextInt(1000),
        createdAt: DateTime.now(),
        imageUrl: 'https://source.unsplash.com/random?sig=10',
      );

      postCollection.add(post);
    }
  }

  final queryPost = FirebaseFirestore.instance
      .collection('posts')
      // .orderBy('createAt')
      .withConverter<Post>(
        fromFirestore: ((snapshot, _) => Post.fromJson(snapshot.data()!)),
        toFirestore: (user, _) => user.toJson(),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Pagination'),
          centerTitle: true,
        ),
        body: FirestoreQueryBuilder<Post>(
          query: queryPost,
          pageSize: 2,
          builder: ((context, snapshot, _) {
            if (snapshot.isFetching) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Something wrong ${snapshot.error}');
            } else {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: snapshot.docs.length,
                  itemBuilder: ((context, index) {
                    final hasEndReached = snapshot.hasMore &&
                        index + 1 == snapshot.docs.length &&
                        !snapshot.isFetchingMore;

                    if (hasEndReached) {
                      snapshot.fetchMore();
                    }
                    final post = snapshot.docs[index].data();
                    return buildPost(post);
                  }));
            }
          }),
        ),
      );
  Widget buildPost(Post post) => Card(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                post.title,
                style: TextStyle(
                  fontFamily: 'DG',
                ),
              ),
              // Text(post.likes.toString()),
              // Text(post.createdAt.toString())
            ],
          ),
        ),
      );
}
