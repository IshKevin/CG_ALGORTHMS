import 'package:dda/dda.dart' as dda;
import 'dart:math';

void main() {
  // Get the starting and ending coordinates of the line from the user
  print("Enter starting coordinates (x1 y1): ");
  int x1 = int.parse(stdin.readLineSync());
  int y1 = int.parse(stdin.readLineSync());
  print("Enter ending coordinates (x2 y2): ");
  int x2 = int.parse(stdin.readLineSync());
  int y2 = int.parse(stdin.readLineSync());

  // Calculate the difference between the starting and ending coordinates
  int dx = x2 - x1;
  int dy = y2 - y1;

  // Calculate the number of steps required to draw the line
  int steps = max(abs(dx), abs(dy));

  // Calculate the increment in x and y for each step
  double xInc = dx / steps;
  double yInc = dy / steps;

  // Set the starting point
  double x = x1;
  double y = y1;

  // Create a list to store the points of the line
  List<Offset> points = [];

  // Draw the line one pixel at a time
  for (int i = 0; i <= steps; i++) {
    points.add(Offset(x, y));
    x += xInc;
    y += yInc;
  }

  // Create a canvas and draw the line
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          child: CustomPaint(
            painter: LinePainter(points),
            size: Size.infinite,
          ),
        ),
      ),
    ),
  );
}

// Custom painter to draw the line on the canvas
class LinePainter extends CustomPainter {
  final List<Offset> points;

  LinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
