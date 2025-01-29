import 'package:flutter/material.dart';
import 'package:health_care/view/components/custom_text.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: commonText('Transactions Details', isBold: true, size: 20),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Profile Image
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.dn9Uotj60sgmAu6tN555FwAAAA?rs=1&pid=ImgDetMain'), // Your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // User Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTransactionDetailRow('Full name :', 'Jane Cooper',
                          isbold: true),
                      buildTransactionDetailRow('Phone number :', '555-0115',
                          isbold: true),
                      buildTransactionDetailRow('Email :', 'abc@example.com',
                          isbold: true),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Transaction Details Header
            commonText('Transaction details :', size: 18, isBold: true),
            const SizedBox(height: 16),
            // Transaction Details
            buildTransactionDetailRow('Transaction ID :', '12345678'),
            buildTransactionDetailRow('A/C holder name:', 'Wade Warren'),
            buildTransactionDetailRow('A/C number:', '**** **** *456'),
            buildTransactionDetailRow('Received amount:', '\$ 500'),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionDetailRow(String label, String value,
      {isbold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(label, size: 14),
          commonText(value, size: 14, isBold: isbold),
        ],
      ),
    );
  }
}
