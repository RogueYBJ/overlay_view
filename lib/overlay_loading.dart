
import 'package:flutter/material.dart';
import 'package:overlay_view/overlay_root.dart';

class OverlayLoading {
  
  static void show({String msg = ''}){
    OverlayView.addOverlayEntry(_pushView(msg));
  }

  static void dismiss(){
    OverlayView.clean();
  }

  static Widget _pushView(String msg){
    return new GestureDetector(
      onTap: ()=>dismiss(),
      child: new Stack(
        alignment : AlignmentDirectional.center,
        children: <Widget>[
          new Container(
            color: Color(0x80000000),
            
          ),
          new Container(
            color: Colors.white,
            height: 100,
            width: 100,
            child: new Row(
              mainAxisAlignment : MainAxisAlignment.center,
              children: <Widget>[
                new Column(
              mainAxisAlignment : MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.ac_unit,size: 50,),
                new Text(msg)
              ],
            )
              ],
            ),
          )
        ],
      ),
    );
  }


}