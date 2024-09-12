import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robot Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RobotGrid(),
    );
  }
}

class RobotGrid extends StatefulWidget {
  @override
  _RobotGridState createState() => _RobotGridState();
}

class _RobotGridState extends State<RobotGrid> {
  final int numRows = 5;
  final int numCols = 5;

  
  int robotRow = 2; 
  int robotCol = 2; 

  
  void moveRobot(String direction) {
    setState(() {
      if (direction == 'up' && robotRow > 0) {
        robotRow--;
      } else if (direction == 'down' && robotRow < numRows - 1) {
        robotRow++;
      } else if (direction == 'left' && robotCol > 0) {
        robotCol--;
      } else if (direction == 'right' && robotCol < numCols - 1) {
        robotCol++;
      }
    });
  }

  
  Widget buildGrid() {
    List<Row> rows = [];
    for (int i = 0; i < numRows; i++) {
      List<Container> cols = [];
      for (int j = 0; j < numCols; j++) {
        cols.add(Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
          ),
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              i == robotRow && j == robotCol ? 'R' : '', 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ));
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: cols,
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Robot'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildGrid(), 
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => moveRobot('up'),
                child: Text('Up'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => moveRobot('down'),
                child: Text('Down'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => moveRobot('left'),
                child: Text('Left'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => moveRobot('right'),
                child: Text('Right'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
