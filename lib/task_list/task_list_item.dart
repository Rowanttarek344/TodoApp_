import 'package:flutter/material.dart';
import 'package:todo/MyTheme.dart';

class task_list_item extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyTheme.white_color,
        borderRadius: BorderRadius.circular(14)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: MyTheme.blue_color,
            width: 5,
            height: 50,
          ),
          SizedBox(width: 18,),
          Column(
            children: [
              Text('Task Title'),
              SizedBox(height: 10,),
              Text('Task Description')
            ],
          ),
          SizedBox(width: 28,),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 18
            ),
            decoration: BoxDecoration(
                color: MyTheme.blue_color,
                borderRadius: BorderRadius.circular(8)
            ),
            child: IconButton(
              icon:Icon(Icons.check,size: 35,
              color: MyTheme.white_color),
              onPressed: () {  },
            ),

          )




        ],
      ),
    );
  }
}
