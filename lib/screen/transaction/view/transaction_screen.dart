import 'package:database_pratic/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transaction_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactionController.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("All Transaction"),
          actions: [
            IconButton(onPressed: () {
              Get.toNamed('/addtransaction');
            }, icon: Icon(Icons.add),),
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: transactionController.transactionlist.length,
            itemBuilder: (context, index) {
              return ListTile(

                leading: Text(
                    "${transactionController.transactionlist[index]['id']}",style: TextStyle(fontWeight: FontWeight.bold)),
                title: Text(
                    "${transactionController.transactionlist[index]['category']}",style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "${transactionController.transactionlist[index]['amount']}",style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      Get.toNamed('/update',arguments: index);
                    }, icon: Icon(Icons.edit,color: Colors.green),),

                    IconButton(onPressed: () {
                      transactionController.deleteid(id: transactionController.transactionlist[index]['id']);
                      transactionController.readData();
                    }, icon: Icon(Icons.delete,color: Colors.red),),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
