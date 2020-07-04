import 'package:flutter/material.dart';


/*
* StatelessWidget 静态，Widget只渲染一次
* 默认Widget被渲染出来，就是不可变的(无论是StatefulWidget还是StatelessWidget)
* 如果要改变State必须有一个状态管理的对象
* 状态管理器发生变化的时候，会重新渲染界面
* */
class StateManagerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
//    throw UnimplementedError();

    return  _SMDState();
  }
//StateManagerDemo 只对外暴露接口

}

/*
* State要管理状态,状态改变需要重新渲染界面，所以需要实现build方法
* _SMDState与StateManagerDemo 关联，
*   1、需要通过范型来实现<StateManagerDemo>
*   2、StateManagerDemo中实现createState方法
*
* StatefulWidget状态改变时候会重新渲染整个界面，所以要尽可能的少用StatefulWidget
* 局部使用即可
* */
class _SMDState extends State<StateManagerDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Center(child: Chip(label: Text('$count'),),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //setState()会自动找哪些内容发生变化，然后重新渲染
          setState(() {
            count++;
          });
          print("count=$count");
        },
      ),
    );
  }
}

/*
class StateManagerDemo  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/