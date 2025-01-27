import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/chat/message_page.dart';
import 'package:health_care/view/components/custom_text.dart';
import 'package:health_care/view/components/custom_textfield.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _HomePageState();
}

class _HomePageState extends State<ChatPage> {
  TextEditingController chatSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Chats",
            color: AppColor.primaryColor, size: 24, isBold: true),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            commonTextfield(
              chatSearchController,
              hintText: "Search",
              prifixIconWidget: SvgPicture.asset(
                AppIcons.search,
                height: 15,
                width: 15,
                fit: BoxFit
                    .scaleDown, // This ensures the entire image is shown correctly
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: AppColor.white,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MessagePage()),
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            AppImages.dummyPerson,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title:
                            commonText("Maya Thompson", size: 18, isBold: true),
                        subtitle: commonText("Hey! How's it going?",
                            size: 14, fontWeight: FontWeight.w500),
                        trailing: commonText("04:04AM",
                            color: AppColor.primaryColor, size: 13),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
