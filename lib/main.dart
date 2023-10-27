import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> images = [
    'image1.jpg',
    'image2.jpg',
    'image3.jpg',
    'image4.jpg',
    'image5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
        centerTitle: true,
        backgroundColor: Colors.grey[500],
      ),
      body: ListView.builder(
        itemCount: (images.length / 2).ceil(),
        itemBuilder: (BuildContext context, int index) {
          final firstImageIndex = index * 2;
          final secondImageIndex = firstImageIndex + 1;
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showImage(context, images[firstImageIndex]);
                      },
                      child: Image.asset(
                        'assets/${images[firstImageIndex]}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0), // Espace entre les images
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (secondImageIndex < images.length) {
                          _showImage(context, images[secondImageIndex]);
                        }
                      },
                      child: secondImageIndex < images.length
                          ? Image.asset(
                        'assets/${images[secondImageIndex]}',
                        fit: BoxFit.cover,
                      )
                          : Container(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0), // Espace vertical entre les paires d'images
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[500],
        onPressed: () {
          // Ajoutez ici le code à exécuter lorsque le bouton "+" est cliqué
        },
        child: Icon(Icons.add), // Affiche l'icône "+"
      ),
    );
  }

  void _showImage(BuildContext context, String image) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset('assets/$image'),
            ),
          ),
        );
      },
    ));
  }
}
