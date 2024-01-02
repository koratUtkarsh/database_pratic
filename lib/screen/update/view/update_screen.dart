import 'package:database_pratic/screen/transaction/controller/transaction_controller.dart';
import 'package:database_pratic/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  TextEditingController txt_ucategory = TextEditingController( );
  TextEditingController txt_uamount = TextEditingController();
  TextEditingController txt_unotes = TextEditingController();
  TextEditingController txt_udate = TextEditingController();
  TextEditingController txt_utime = TextEditingController();
  TextEditingController txt_upaytypes = TextEditingController();
  TextEditingController txt_ustatus = TextEditingController();

  TransactionController transactionController =
  Get.put(TransactionController());

  int index = Get.arguments;

  @override
  void initState() {
    super.initState();
    txt_ucategory.text = "${transactionController.transactionlist[index]['category']}";
    txt_uamount.text = "${transactionController.transactionlist[index]['amount']}";
    txt_unotes.text = "${transactionController.transactionlist[index]['notes']}";
    txt_udate.text = "${transactionController.transactionlist[index]['date']}";
    txt_utime.text = "${transactionController.transactionlist[index]['time']}";
    txt_upaytypes.text = "${transactionController.transactionlist[index]['paytypes']}";
    txt_ustatus.text = "${transactionController.transactionlist[index]['status']}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Update Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt_ucategory,
              decoration: InputDecoration(
                hintText: "Enter Category",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt_uamount,
              decoration: InputDecoration(
                hintText: "Enter amouunt",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt_unotes,
              decoration: InputDecoration(
                hintText: "Enter Notes",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt_udate,
              decoration: InputDecoration(
                hintText: "Enter Date",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt_utime,
              decoration: InputDecoration(
                hintText: "Enter Time",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt_upaytypes,
              decoration: InputDecoration(
                hintText: "Enter Paytypes",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt_ustatus,
              decoration: InputDecoration(
                hintText: "Enter Statuscode",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(width: 1),),
              ),
            ),
          ),

          ElevatedButton(onPressed: () async {
            transactionController.updateid(id: transactionController.transactionlist[index]['id'], category: txt_ucategory.text, amount: txt_uamount.text, notes: txt_unotes.text, date: txt_udate.text, time: txt_utime.text, paytypes: txt_upaytypes.text, status: txt_ustatus.text);
            transactionController.transactionlist.value = await DbHelper.helper.readDb();
            Get.back();
          }, child: const Text("Update"),),
        ],
      ),
    ),);
  }
}
