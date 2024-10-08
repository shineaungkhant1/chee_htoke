import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenSize = MediaQuery.of(context).size;

    // Determine if the device is a small screen (mobile)
    bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFF7F7F),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFF7F7F),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display Lottie animation and title adaptively
            // if (!isSmallScreen)
              Lottie.asset("assets/lotties/heart.json", height: 40, fit: BoxFit.contain),
            Flexible(
              child: Text(
                title,
                style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                // Scale text based on screen size
                textScaleFactor: isSmallScreen ? 1.2 : 1.58,
              ),
            ),
            // if (!isSmallScreen)
              Lottie.asset("assets/lotties/heart.json", height: 40, fit: BoxFit.contain),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "One month down, a lifetime to go. Every moment with you is a treasure.",
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF333333),
                  ),
                  // Adjust text size based on screen size
                  textScaleFactor:  1.5,
                ),
              ),
              const SizedBox(height: 20),
              // Use LayoutBuilder to adapt widget arrangement based on screen width
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    // For larger screens (web/tablets), show images in a row
                    return Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipPath(
                              clipper: HeartClipper(),
                              child: Image.asset(
                                'assets/images/sak.jpeg',
                                height: 250,
                                width: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Lottie.asset("assets/lotties/couple_bird.json",
                                fit: BoxFit.contain, height: 180),
                            ClipPath(
                              clipper: HeartClipper(),
                              child: Image.asset(
                                'assets/images/babe.jpeg',
                                height: 250,
                                width: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Text("""Happy one-month anniversary! It’s hard to believe how quickly this month has flown by. Every moment we’ve shared has brought so much joy and laughter into my life.

                        Your youthful energy and perspective inspire me every day. I love how we connect and support each other, making even the simplest moments special.

                        I’m excited for all the memories we have yet to create together. Here’s to many more months of love and adventures!""", style: GoogleFonts.oswald(
                          fontWeight: FontWeight.w800,
                          color: Colors.grey[800],
                        ),
                          // Adjust text size based on screen size
                          textScaleFactor:  1.5,),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Lottie.asset("assets/lotties/dog_kiss.json",
                              fit: BoxFit.contain, height: 180),
                        ),
                      ],
                    );
                  } else {
                    // For smaller screens (mobile), show images in a column
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Centers the items vertically in the Column
                        crossAxisAlignment: CrossAxisAlignment.center, // Centers the items horizontally in the Column
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 58.0),
                            child: ClipPath(
                              clipper: HeartClipper(),
                              child: Image.asset(
                                'assets/images/sak.jpeg',
                                height: 200,
                                width: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Lottie.asset(
                            "assets/lotties/couple_bird.json",
                            fit: BoxFit.contain,
                            height: 150,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 58.0),
                            child: ClipPath(
                              clipper: HeartClipper(),
                              child: Image.asset(
                                'assets/images/babe.jpeg',
                                height: 200,
                                width: 400,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),

                          Text("""Happy one-month anniversary! It’s hard to believe how quickly this month has flown by. Every moment we’ve shared has brought so much joy and laughter into my life.

                        Your youthful energy and perspective inspire me every day. I love how we connect and support each other, making even the simplest moments special.

                        I’m excited for all the memories we have yet to create together. Here’s to many more months of love and adventures!""", style: GoogleFonts.oswald(
                            fontWeight: FontWeight.w800,
                            color: Colors.grey[800],
                          ),
                            // Adjust text size based on screen size
                            textScaleFactor:  1.5,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Lottie.asset("assets/lotties/dog_kiss.json",
                                fit: BoxFit.contain, height: 180),
                          ),
                        ],
                      ),
                    );

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;

    // Maintain a proper aspect ratio for the heart (you can tweak this ratio if needed)
    final double aspectRatio = 0.8; // Adjust the value for a more refined heart shape
    final double adjustedWidth = width * aspectRatio;

    // Define the path for a well-proportioned heart
    final Path path = Path();
    path.moveTo(adjustedWidth * 0.5, height * 0.3);

    // Left curve of the heart
    path.cubicTo(
      adjustedWidth * 0.1,   // control point 1 x
      height * 0.05, // control point 1 y
      0,             // control point 2 x
      height * 0.4,  // control point 2 y
      adjustedWidth * 0.5,   // end point x
      height,        // end point y
    );

    // Right curve of the heart
    path.moveTo(adjustedWidth * 0.5, height);
    path.cubicTo(
      adjustedWidth,         // control point 1 x
      height * 0.4,  // control point 1 y
      adjustedWidth * 0.9,   // control point 2 x
      height * 0.05, // control point 2 y
      adjustedWidth * 0.5,   // end point x
      height * 0.3, // end point y
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


