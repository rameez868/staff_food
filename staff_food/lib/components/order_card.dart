import 'package:flutter/material.dart';
import 'package:staff_food/modal/order_task.dart';
class OrderCard extends StatefulWidget {
  //const OrderCard({Key? key}) : super(key: key);
  final OrderTask orderTask;
  OrderCard({required this.orderTask});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool? _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.transparent.withOpacity(0.50),
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Theme(
                data: ThemeData(
                  primarySwatch: Colors.lightGreen,
                  unselectedWidgetColor: Colors.deepOrange
                ),
                child: Checkbox(
                  value: widget.orderTask.isDone,
                  onChanged: (value){
                    setState(() {
                      widget.orderTask.isDone = value!;
                    });
                  },
                ),
            ),
            const SizedBox(width: 15.0,),
            Flexible(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title: ${widget.orderTask.name.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.greenAccent,
                  ),
                ),
                Text(
                  'Desc.: ${widget.orderTask.order.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'Amount: RS ${widget.orderTask.amount}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
