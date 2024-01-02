import 'package:database_pratic/screen/addData/view/addtransaction_screen.dart';
import 'package:database_pratic/screen/transaction/view/transaction_screen.dart';
import 'package:database_pratic/screen/update/view/update_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => TransactionScreen()),
        GetPage(name: '/addtransaction', page: () => AddTransactionScreen()),
        GetPage(name: '/update', page: () => UpdateScreen()),
      ],
    )
  );
}