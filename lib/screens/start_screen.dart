import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentSlide = 0; // Track the current slide index
  final CarouselController _carouselController =
      CarouselController(); // Carousel controller

  final List<String> images = [
    'assets/images/start1.png', // Replace with your actual image paths
    'assets/images/start2.png',
    'assets/images/start3.png',
  ];

  final List<String> descriptions = [
    "BISOU : L'ambiance chaleureuse et élégante de nos cafés parisiens vous accueille pour une expérience unique.",
    "Découvrez l'art et la créativité qui définissent BISOU, un lieu où la culture et le café se rencontrent.",
    "Un mélange subtil de l'esprit parisien et des inspirations internationales. Rejoignez-nous pour vivre cette expérience.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Carousel
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: images.length,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              enableInfiniteScroll: false, // Disable infinite scrolling
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSlide = index;
                });
              },
              scrollPhysics: _currentSlide == images.length
                  ? const NeverScrollableScrollPhysics() // Disable swiping on the last slide
                  : const BouncingScrollPhysics(), // Allow swiping otherwise
            ),
            itemBuilder: (context, index, realIndex) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5), // Translucent overlay
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        descriptions[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'GianottenLTW04-Regular',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Next button on the last slide
          if (_currentSlide == images.length - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 120, 26, 29),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          // Dots indicator
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentSlide == entry.key
                            ? const Color(0xFFC52127)
                            : Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
