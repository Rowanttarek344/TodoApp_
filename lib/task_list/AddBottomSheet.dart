import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text('Add New Task',style: Theme.of(context).primaryTextTheme.subtitle1,),
          SizedBox(height: 18,),
          Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter task title',
                      hintStyle: Theme.of(context).primaryTextTheme.subtitle2
                    ),
                  ),
                  SizedBox(height: 18,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter task description',
                        hintStyle: Theme.of(context).primaryTextTheme.subtitle2,
                    ),
                    minLines: 4,
                    maxLines: 4,
                  ),
                  SizedBox(height: 25,),
                  Text('Select Date',style: Theme.of(context).primaryTextTheme.subtitle1,),
                  SizedBox(height: 18,),
                  Text('7/25/2023',style: Theme.of(context).primaryTextTheme.subtitle1,textAlign: TextAlign.center,),
                  SizedBox(height: 18,),
                  ElevatedButton(
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Add',style: Theme.of(context).primaryTextTheme.headline1,),
                      ),
                  )
                ],
              )
          ),








        ],
      ),
    );
  }
}
