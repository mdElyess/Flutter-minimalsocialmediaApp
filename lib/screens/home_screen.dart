import 'package:flutter/material.dart';

// databases
import '../database/firestore.dart';

// components
import '../components/my_drawer.dart';
import '../components/my_textfield.dart';
import '../components/my_post_button.dart';
import '../components/my_list_tile.dart';

class HomeScreen extends StatelessWidget {
  static String screenId = '/home_screen';

  // text controller
  final TextEditingController newPostController = TextEditingController();

  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  HomeScreen({super.key});

  // post message method
  void postMessage() {
    // only post message if there is something in the textfield
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    // clear the controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("W A L L"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          // textfield box for user to type
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                // textfield
                Expanded(
                  child: MyTextField(
                    hintText: "Say Something...",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),

                // post button
                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),

          // posts
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // show loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // get all posts
              final posts = snapshot.data!.docs;

              // no data
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No posts.. Post something!"),
                  ),
                );
              }

              // return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // get each individual post
                    final post = posts[index];

                    // get data from each post
                    String message = post["PostMessage"];
                    String userEmail = post["UserEmail"];
                    // Timestamp timestamp = post['Timestamp']; //

                    // return as a list tile
                    return MyListTile(
                      title: message,
                      subTitle: userEmail,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
