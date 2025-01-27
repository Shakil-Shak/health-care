import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';

class WithdrawSuccessfullPage extends StatelessWidget {
  const WithdrawSuccessfullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: SizedBox(
            height: 500,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipPath(
                    clipper: TicketClipper(),
                    child: Container(
                      width: 300,
                      height: 500,
                      color: AppColor.primaryColorLight2,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/confetti.png',
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Icon(
                                Icons.verified_user_outlined,
                                color: AppColor.primaryColor,
                                size: 40,
                              ),
                            ),
                            Column(
                              children: [
                                commonText('Withdraw Successful',
                                    size: 20, isBold: true),
                                const SizedBox(height: 4),
                                commonText(
                                  'Your top up has been successful done',
                                  textAlign: TextAlign.center,
                                  size: 14,
                                ),
                              ],
                            ),

                            // Amount Paid
                            Column(
                              children: [
                                commonText(
                                  'Total Withdraw',
                                  size: 14,
                                ),
                                const SizedBox(height: 5),
                                commonText('\$200.00', size: 24, isBold: true),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DottedDivider(),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              commonText("Total Top Up", size: 14),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Icon(FontAwesomeIcons.creditCard),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonText(
                                      'Standard Chartered Card',
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    commonText(
                                      '1234 5678 2345',
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Close Button
                          commonButton("Close"),
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = 15.0;
    double circleRadius = 15.0;

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height / 2 - circleRadius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + circleRadius),
      radius: Radius.circular(circleRadius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);

    int numberOfCircles = 6;
    double spacing = size.width / (numberOfCircles + 1);

    for (int i = 1; i <= numberOfCircles; i++) {
      double centerX = spacing * i;
      path.lineTo(centerX + circleRadius, size.height);
      path.arcToPoint(
        Offset(centerX - circleRadius, size.height),
        radius: Radius.circular(circleRadius),
        clockwise: false,
      );
    }

    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, size.height / 2 + circleRadius);
    path.arcToPoint(
      Offset(0, size.height / 2 - circleRadius),
      radius: Radius.circular(circleRadius),
      clockwise: false,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 1),
      painter: DottedDividerPainter(),
    );
  }
}

class DottedDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5.0;
    double dashSpace = 3.0;
    double startX = 0.0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
