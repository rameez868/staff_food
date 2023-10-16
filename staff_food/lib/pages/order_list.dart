import 'package:flutter/material.dart';
import 'package:staff_food/components/order_card.dart';
import 'package:staff_food/modal/order_task.dart';
import 'package:staff_food/dataAcces/preference_service.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<OrderTask> ftask = <OrderTask>[
    // OrderTask(name: "Muhammad Umer", order: "Biryani", amount: "220", isDone: false),
    // OrderTask(name: "Muhammad Umer", order: "Biryani", amount: "220", isDone: false)
  ];
  final TextEditingController _txtfldTitle = TextEditingController();
  final TextEditingController _txtfldDesc = TextEditingController();
  final TextEditingController _txtfldAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Staff order list')),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/phinex.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.builder(
            itemCount: ftask.length,
            itemBuilder: (context,index){
              final item = ftask[index];
              return Dismissible(
                key: ValueKey(item),
              onDismissed: (direction){
                  setState(() {
                    ftask.removeAt(index);
                    PreferencesService.saveData(ftask);
                  });
                  ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('${item.name}\'s order is removed')));
              },
              child: OrderCard(orderTask:item),
              );
            },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()=>_displayDialog(),
      //   child: Icon(Icons.add),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: ()=>_displayDialog(),
              heroTag: "btn1",
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
            ),
            SizedBox(width: 40,),
            FloatingActionButton(
              onPressed: ()=>setState((){
                if(ftask.isNotEmpty){
                  PreferencesService.saveData(ftask);
                  ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Orders is saved in memory')));
                }else{
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Orders list is Empty')));
                }
              }),
              heroTag: "btn2",
              backgroundColor: Colors.purple,
              child: Icon(Icons.save),
            ),
            SizedBox(width: 40,),
            FloatingActionButton(
              onPressed: ()=>setState((){
                ftask = PreferencesService.getList();
              }),
              heroTag: "btn3",
              backgroundColor: Colors.red,
              child: Icon(Icons.memory),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _displayDialog()async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.white70,
          title: Text('add food order to list'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _txtfldTitle,
                  decoration: InputDecoration(hintText: 'Enter Name'),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _txtfldDesc,
                  decoration: InputDecoration(hintText: 'Enter Food Order'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _txtfldAmount,
                  decoration: InputDecoration(hintText: 'Enter Amount'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
              TextButton(onPressed: (){
                _addTodoItem();
                Navigator.of(context).pop();
              }, child: Text('add')),
              TextButton(onPressed: (){
                _txtfldTitle.clear();
                _txtfldAmount.clear();
                _txtfldDesc.clear();
                Navigator.of(context).pop();
              }, child: Text('cancel'))
          ],
        );
      }
    );
  }
  void _addTodoItem(){
    setState(() {
      String title = _txtfldTitle.text;
      String desc = _txtfldDesc.text;
      String amount = _txtfldAmount.text;
      OrderTask order =  OrderTask(name: title, order: desc, amount: amount, isDone: false);
      ftask.add(order);
      PreferencesService.saveData(ftask);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Order is saved in memory')));
    });
    _txtfldTitle.clear();
    _txtfldAmount.clear();
    _txtfldDesc.clear();
  }

}
