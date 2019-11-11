import 'package:flutter/material.dart';


/// 添加 overlayEntry
class OverlayView {
  static OverlayEntry _overlayEntry;
  static Widget _overlayView;

  //创建overlayEntry
  static void addOverlayEntry(Widget view){
    _overlayView = view;
    if (_overlayEntry==null) {
      _overlayEntry =  OverlayEntry(builder:(BuildContext context) => _overlayView);
      OverlayRoot.createView(_overlayEntry);
    }else{
      _overlayEntry?.markNeedsBuild();
    }
  }

  //清理overlayEntry
  static void clean(){
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      print('remove');
    }
  }

  //更新overlayEntry
  static void updata(Widget view){
    _overlayView = view;
    if (_overlayEntry != null) {
      _overlayEntry.markNeedsBuild();
    }
  }
}


/// 获取 overlayState 的状态
class OverlayRoot {

  //配置静态环境
  static BuildContext context;

  //创建OverlayEntry
  static void createView(OverlayEntry overlayEntry)async{
    if (context != null) {
      OverlayState overlayState =  Overlay.of(context);
      overlayState.insert(overlayEntry);
      print('OverlayView');
    }else{
      throw ('请添加BuildContext');
    }
  }
}