import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_food/modal/order_task.dart';
class PreferencesService{

  static Future saveData(List<OrderTask> list) async{
    final preferences = await SharedPreferences.getInstance();
    final String encodeData = OrderTask.encodeList(list);
    await preferences.setString("oListKey", encodeData);
  }

  static Future <List<OrderTask>> _getData() async{
    final preferences = await SharedPreferences.getInstance();
    String decodedList = preferences.getString("oListKey").toString();
    return OrderTask.decodeList(decodedList);
  }

  static List<OrderTask> getList(){
    List<OrderTask> fList = [];
    _getData().then((value){
      for(var item in value){
        fList.add(item);
      }
    });
    return fList;
  }
}