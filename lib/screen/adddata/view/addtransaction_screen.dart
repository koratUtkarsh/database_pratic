import 'package:database_pratic/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../transaction/controller/transaction_controller.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TransactionController transactionController = Get.put(TransactionController());

  TextEditingController txtcategory = TextEditingController();
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtnotes = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txttime = TextEditingController();
  TextEditingController txtpaytypes = TextEditingController();
  TextEditingController txtstatus = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Transaction"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtcategory,
              decoration: InputDecoration(
                hintText: "Enter Category",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtamount,
              decoration: InputDecoration(
                hintText: "Enter amouunt",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtnotes,
              decoration: InputDecoration(
                hintText: "Enter Notes",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtdate,
              decoration: InputDecoration(
                hintText: "Enter Date",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txttime,
              decoration: InputDecoration(
                hintText: "Enter Time",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtpaytypes,
              decoration: InputDecoration(
                hintText: "Enter Paytypes",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtstatus,
              decoration: InputDecoration(
                hintText: "Enter Statuscode",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),


          ElevatedButton(onPressed: () async {
            DbHelper.helper.insertDb(category: txtcategory.text, amount: txtamount.text, notes: txtnotes.text, date: txtdate.text, time: txttime.text, paytypes: txtpaytypes.text, status: txtstatus.text);
            transactionController.transactionlist.value = await DbHelper.helper.readDb();
            Get.back();
          }, child: const Text("Click"),),
        ],
      ),
    ),);
  }
}
