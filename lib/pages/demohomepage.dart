import 'package:blogapp/helper/statedemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../user/userprofile.dart';
import 'addblog.dart';
import 'homepage.dart';

class home extends ConsumerWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final blogslist = ref.watch(BlogList);
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        title: const Text(
        "User Blogs",
        style: TextStyle(fontSize: 25, color: Colors.white),
    ),
    centerTitle: true,
    actions: [
    TextButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>userprofile()));
    }, child: Text("View Profile",style: TextStyle(color: Colors.white),))
    ],
    ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: blogslist.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleItem(
              description: blogslist[index].description,
              title: blogslist[index].title,
              username: blogslist[index].username,
              imageURL:blogslist[index].imageURL,
              userProfile: blogslist[index].userProfile,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddBlog()));
        },
        child: const Icon(
          Icons.add,
          size: 27,
          color: Colors.white,
        ),
      ),
    );
  }
}
