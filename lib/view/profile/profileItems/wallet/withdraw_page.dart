import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_button.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';
import 'package:health_care/view/profile/profileItems/wallet/withdraw_successfull_page.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final TextEditingController expirationController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  String selectedPaymentMethod = 'Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: commonText('Withdraw', size: 21, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        commonText('Your Balance',
                            size: 16, color: AppColor.white),
                        const SizedBox(height: 10),
                        commonText('\$1000',
                            color: AppColor.white, size: 32, isBold: true),
                        const SizedBox(height: 20),
                        commonButton("Enter withdraw amount")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            buildPaymentUI(),
            const SizedBox(height: 20),
            commonButton("Proceed to withdraw", isBold: false, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WithdrawSuccessfullPage()),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentUI() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Payment Method Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPaymentMethod = 'Card'),
                  child: buildPaymentTab('Card', FontAwesomeIcons.creditCard,
                      selectedPaymentMethod == 'Card'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      setState(() => selectedPaymentMethod = 'Google Pay'),
                  child: buildPaymentTab(
                      'Google Pay',
                      FontAwesomeIcons.googlePay,
                      selectedPaymentMethod == 'Google Pay'),
                ),
              ),
              const SizedBox(width: 10),
              // Expanded(
              //   child: GestureDetector(
              //     onTap: () =>
              //         setState(() => selectedPaymentMethod = 'Apple Pay'),
              //     child: buildPaymentTab('Apple Pay', FontAwesomeIcons.applePay,
              //         selectedPaymentMethod == 'Apple Pay'),
              //   ),
              // ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 20),
          // Card Number Field
          commonTextfieldWithTitle(
            "Card number",
            numberController,
            hintText: '1234 1234 1234 1234',
            suffinxIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.ccVisa,
                  color: Colors.grey.shade800,
                ),
                const SizedBox(width: 5),
                const Icon(FontAwesomeIcons.ccMastercard),
                const SizedBox(width: 5),
                const Icon(FontAwesomeIcons.ccAmex),
                const SizedBox(width: 5),
                const Icon(FontAwesomeIcons.ccDiscover),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Expiration and CVC Fields
          Row(
            children: [
              Expanded(
                child: commonTextfieldWithTitle(
                  "Expiration",
                  expirationController,
                  hintText: 'MM / YY',
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: commonTextfieldWithTitle(
                  "CVC",
                  cvcController,
                  hintText: 'CVC',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Country Dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Country',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            items: const [
              DropdownMenuItem(value: 'US', child: Text('United States')),
              DropdownMenuItem(value: 'CA', child: Text('Canada')),
              DropdownMenuItem(value: 'UK', child: Text('United Kingdom')),
            ],
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget buildPaymentTab(String title, IconData icon, bool isSelected) {
    return Card(
      elevation: isSelected ? 0 : 3,
      color: AppColor.white,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected ? AppColor.primaryColor : Colors.white,
              width: 4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon,
                color: isSelected ? AppColor.primaryColor : AppColor.black),
            const SizedBox(height: 5),
            commonText(
              title,
              color: isSelected ? AppColor.primaryColor : AppColor.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
