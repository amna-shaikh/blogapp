import 'package:blogapp/models/blogmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
  final BlogList = Provider<List<blogModel>>((ref) =>  [
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
  ]);
final userList = Provider<List<blogModel>>((ref) => [

]);
