import 'dart:convert';

class OrderTask{
  String name; // title of an order
  String order; // desc of an order
  String amount;
  bool isDone;

  OrderTask({required this.name, required this.order, required this.amount, required this.isDone});


  /// serialization code will be done in future
  ///JSON Encode
  static Map<String,dynamic> toMap(OrderTask ot)=>{
    "name": ot.name,
    "order": ot.order,
    "amount": ot.amount,
    "isDone": ot.isDone
  };
  static String encodeList(List<OrderTask> Ilist) => json.encode(
    Ilist.map<Map<String,dynamic>>((Ilist)=>OrderTask.toMap(Ilist)).toList(),);

  factory OrderTask.fromJsonList(Map<String,dynamic> jsonData){
    return OrderTask(
      name: jsonData['name'],
      order: jsonData['order'],
      amount: jsonData['amount'],
      isDone: jsonData['isDone']
    );
  }

  static List<OrderTask> decodeList(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
      .map<OrderTask>((item) => OrderTask.fromJsonList(item))
          .toList();

}