import "dart:io";
import 'package:blogapp/helper/notifier.dart';
import 'package:blogapp/pages/addblog.dart';
import 'package:blogapp/models/blogmodel.dart';
import 'package:blogapp/pages/commentpage.dart';
import 'package:blogapp/user/userprofile.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
/*class HomePage extends StatefulWidget {
 static  String url="";
 static String username="amna" ;

  static List<blogModel> BlogList = [
    blogModel(
        username: "amnashaikh121",
        title: "This is Panda",
        description: "Panda is me",
        imageURL: "https://tinypng.com/images/social/website.jpg",
        userProfile:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
    blogModel(
        username: "aqsashaikh121",
        title: "This is nature",
        description: "A beautiful Atmosphere",
        imageURL:
            "https://www.metoffice.gov.uk/binaries/content/gallery/metofficegovuk/hero-images/advice/maps-satellite-images/satellite-image-of-globe.jpg",
        userProfile:
            'https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?w=2000'),
    blogModel(
        username: "helo123",
        title: "This is ballons",
        description: "ballon is me",
        imageURL:
            "https://www.akamai.com/site/im-demo/perceptual-standard.jpg?imbypass=true",
        userProfile: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
  ];
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "User Blogs",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>userprofile()));
          }, child: Text("View Profile",style: TextStyle(color: Colors.black),))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: HomePage.BlogList.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleItem(
              description: HomePage.BlogList[index].description,
              title: HomePage.BlogList[index].title,
              username: HomePage.BlogList[index].username,
              imageURL:HomePage.BlogList[index].imageURL,
              userProfile: HomePage.BlogList[index].userProfile,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddBlog()));
        },
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}*/

class SingleItem extends ConsumerStatefulWidget {
  String username;
  String title;
  String description;
  String imageURL;
  String? userProfile;

  SingleItem(
      {required this.username,
      required this.title,
      required this.description,
      required this.imageURL,
      this.userProfile});

  @override
  ConsumerState<SingleItem> createState() => _SingleItemState();
}
class _SingleItemState extends ConsumerState<SingleItem> {
  bool isfav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            leading:ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: widget.userProfile!.contains("https")?
              Image.network(
                widget.userProfile!,
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ): Image.file(File(widget.userProfile!),
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              )
            ),
            title:Text(
              widget.username,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ) ,
          ),

          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.circular(20),
                  child: widget.imageURL.contains("https") ?
                     Image(
                       image: NetworkImage(widget.imageURL),
                       width: MediaQuery.of(context).size.width,

                       fit: BoxFit.cover,
                       filterQuality: FilterQuality.high,
    )
                 : Image.file(File(widget.imageURL),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),

                ),
                /*  Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black87],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                )*/
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                         isfav = !isfav;
                            });
                  },
                  child: Icon(
                    isfav ? Icons.favorite  : Icons.favorite_border_outlined,
                    size: 30,
                    color: isfav ? Colors.red : Colors.black,

                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => commentPage()));
                    });
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => commentPage()));
                  },
                  child:  Icon(
                    Icons.comment_rounded,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.share,
                  size: 30,
                ),
              ],
            ),
          ),
          Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ])),
        ]));
  }
}
