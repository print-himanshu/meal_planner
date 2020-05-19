import 'package:flutter/material.dart';

class StepsList extends StatelessWidget {
  final mealDetailData;
  final partitionHeight;
  final partitionWidth;
  final id;

  StepsList({
    @required this.mealDetailData,
    @required this.partitionHeight,
    @required this.partitionWidth,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: partitionHeight,
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Steps",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            height: partitionHeight * 0.8,
            width: partitionWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 3,
              ),
            ),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Text(
                      "#${index + 1}",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                  title: Text('${mealDetailData.steps[index]}',
                      style: Theme.of(context).textTheme.subtitle),
                );
              },
              itemCount: mealDetailData.steps.length,
            ),
          ),
        ],
      ),
    );
  }
}
