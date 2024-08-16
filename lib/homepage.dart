import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final List<String> imgList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfaWn5LsbQWyIAx7EdfX8px5jqW7H2wrPY6A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkvjU4YPjwggKZFQ6oO9jhPWruiY8SiVmOjw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjhBjB3Glhv9_xaXeQr_o7aYg36EsVFktEM-8cQxCDBLdtCODPCQMwYEVkEnvLSbJ7M8c&usqp=CAU"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SlideBar DEMO',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: imgList.map((item) {
              return GestureDetector(
                onTap: () {
                  print('Image tapped: $item');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('CLICKED ON IMAGE')),
                  );
                },
                onDoubleTap: () {
                  print('Image double-tapped: $item');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('CLICKED ON IMAGE')),
                  );
                },
                onLongPress: () {
                  print('Image long-pressed: $item');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('CLICKED ON IMAGE')),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 500, // Adjust the height of the image container
                      width: double.infinity,
                    ),
                    SizedBox(height: 10), // Space between image and text
                    Text(
                      'Hello Abhishek',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 650.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          SizedBox(height: 10.0),
          CarouselIndicator(
            count: imgList.length,
            index: _current,
          ),
        ],
      ),
    );
  }
}
