
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';



class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipPath(
              clipper:Customshape(),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.green,
              ),
            ), ClipPath(
              clipper:Customshape1(),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.green,
              ),
            ), ClipPath(
              clipper:Customshape2(),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.green,
              ),
            ),
            ClipPath(
              clipper:Customshape3(),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.green,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // isDismissible: true,
      useSafeArea: true,
     // enableDrag: true,
      showDragHandle: true,
      constraints: BoxConstraints(maxHeight: 500,minHeight: 300),
      isScrollControlled: true, // Set to true to allow scrolling
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 1,
          initialChildSize: 0.4,
          minChildSize: 0.39,
          builder:(context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Scrollable Bottom Sheet',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Add your scrollable content here
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}



class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path
      // ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
      ..lineTo(width -20 , 0)
      ..lineTo(width, height/2)
      ..lineTo(width-20, height)
      ..lineTo(20, height)
      ..lineTo(0, height/2)
      ..lineTo(20, 0)



      // ..lineTo(size.width, size.height * .25)
      // ..lineTo(size.width, size.height * .75)
      // ..lineTo(size.width * .5, size.height)
      // ..lineTo(0, size.height * .75)
      // ..lineTo(0, size.height * .25)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

class Customshape1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path
      ..lineTo(width  , 0)
      ..lineTo(width, height-10)
      ..lineTo(width-10, height)
      ..lineTo(10, height)
      ..lineTo(0, height-10)

    ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

class Customshape2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path
      ..lineTo(width -20 , 0)
      ..lineTo(width, height *.20)
     ..lineTo(width, height)
      ..lineTo(0, height)
      ..lineTo(0, height *.20)
      ..lineTo(20, 0)
      // ..lineTo(width, 0)

    ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
class Customshape3 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path
      ..lineTo(width -20 , 0)
      ..lineTo(width, height /2)
     ..lineTo(width-20, height)
      ..lineTo(0, height)
      ..lineTo(20, height /2)
      // ..lineTo(0, 0)
      // ..lineTo(width, 0)

    ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}


