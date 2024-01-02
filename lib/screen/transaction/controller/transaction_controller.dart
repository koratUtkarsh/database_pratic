import 'package:database_pratic/utils/db_helper.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  RxList<Map>transactionlist = <Map>[].obs;

  Future<void> readData() async {
    transactionlist.value = await DbHelper.helper.readDb();
  }

  void deleteid({required id}) {
    DbHelper.helper.deleteDb(id: id);
  }

  Future<void> updateid({required id,
    required category,
    required amount,
    required notes,
    required date,
    required time,
    required paytypes,
    required status}) async {
    DbHelper.helper.updateDb(id: id,
        category: category,
        amount: amount,
        notes: notes,
        date: date,
        time: time,
        paytypes: paytypes,
        status: status);

    readData();
  }
}