import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> sampleImages = [
    'resimler/hillbilly.jpeg',
    'resimler/hitman.jpeg',
    'resimler/hunger.jpeg',
    'resimler/nieve.jpeg',
    'resimler/punisher.jpeg',
    'resimler/purplehearts.jpeg',
    'resimler/rednotice.jpeg',
    'resimler/thecourier.jpeg',
    'resimler/thegrayman.jpeg',
    'resimler/union.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            RecommendedSection(imageUrl: 'resimler/netflix.jpg'),
            CategorySection(
                title: 'Trending Now', imageUrls: getRandomImages()),
            CategorySection(
                title: 'Popular on MyStream', imageUrls: getRandomImages()),
            CategorySection(
                title: 'New Releases', imageUrls: getRandomImages()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
            backgroundColor: Colors.black54,
          ),
        ],
      ),
    );
  }

  List<String> getRandomImages() {
    List<String> shuffledImages = List.from(sampleImages);
    shuffledImages.shuffle();
    return shuffledImages.take(5).toList();
  }
}

class RecommendedSection extends StatelessWidget {
  final String imageUrl;

  RecommendedSection({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.133,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 27, 27, 27).withOpacity(0.3),
                      const Color.fromARGB(255, 27, 27, 27).withOpacity(1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: MediaQuery.of(context).size.width * 0.5 - 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.play_arrow, color: Colors.black),
                label: Text(
                  'Play',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: MediaQuery.of(context).size.width * 0.5 - 50,
              child: Image.asset(
                'resimler/logonetflix.png',
                width: 100,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<String> imageUrls;

  CategorySection({required this.title, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageUrls[index],
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
