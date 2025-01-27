import 'package:flutter/material.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/profile/profileItems/wallet/transaction_details.dart';
import 'package:health_care/view/profile/profileItems/wallet/withdraw_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: commonText('Wallet', size: 20, isBold: true),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Balance Card
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.primaryColorLight, // Example color
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      "assets/icons/walet.png",
                      color: const Color.fromARGB(255, 187, 158, 158),
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText('Your Balance',
                          size: 16, color: AppColor.white),
                      const SizedBox(height: 10),
                      commonText('\$1000',
                          color: AppColor.white, size: 32, isBold: true),
                      const SizedBox(height: 20),
                      commonButton(
                        "Withdraw",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WithdrawPage()),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Recent Transactions Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonText(
                  'Recent Transactions',
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // Transactions List
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: DataTable(
                  columnSpacing: 20,
                  headingRowColor: WidgetStateProperty.all(
                      AppColor.primaryColor), // Header color
                  columns: [
                    DataColumn(
                      label: Expanded(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: commonText('#Sl', color: AppColor.white)),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                                commonText('Full Name', color: AppColor.white)),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: commonText('Acc Number',
                                color: AppColor.white)),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: commonText('Date',
                                      color: AppColor.white)),
                            ),
                            const Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: commonText('Amount', color: AppColor.white)),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    10,
                    (index) => DataRow(
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionDetails()),
                        );
                      },
                      cells: [
                        DataCell(Expanded(
                          child: FittedBox(
                              fit: BoxFit.scaleDown, child: commonText('01')),
                        )),
                        DataCell(Expanded(
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://th.bing.com/th/id/OIP.dn9Uotj60sgmAu6tN555FwAAAA?rs=1&pid=ImgDetMain'), // Your image
                                radius: 12,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: commonText('Robert Fox')),
                              ),
                            ],
                          ),
                        )),
                        DataCell(Expanded(
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: commonText('516) 831-1111')),
                        )),
                        DataCell(Expanded(
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: commonText('02-24-2024')),
                        )),
                        DataCell(Expanded(
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: commonText('\$200')),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
