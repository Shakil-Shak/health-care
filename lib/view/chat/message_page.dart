import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/const/assets/icons.dart';
import 'package:health_care/const/assets/images.dart';
import 'package:health_care/const/color.dart';
import 'package:health_care/view/components/custom_text.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                AppImages.dummyPerson,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            commonText('Maya', size: 18, isBold: true),
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          SvgPicture.asset(
            AppIcons.video,
            color: AppColor.black,
          ),
          const SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            AppIcons.audio,
            color: AppColor.black,
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              reverse: true,
              children: const <Widget>[
                MessageTile(isMe: true, messageContent: "Hi"),
                MessageTile(isMe: true, messageContent: "How Are You?"),
                MessageTile(isMe: false, messageContent: "Hi"),
                MessageTile(
                    isMe: false, messageContent: "I'm Fine. What about you?"),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  AppIcons.attachment,
                  color: AppColor.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.red, width: 2)),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        hintStyle: TextStyle(
                            fontSize: 16, color: AppColor.primaryColorLight),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  AppIcons.sendMessage,
                  color: AppColor.primaryColor,
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final bool isMe;
  final String messageContent;

  const MessageTile(
      {super.key, required this.isMe, required this.messageContent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: isMe ? AppColor.primaryColor : AppColor.primaryColorLight2,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isMe ? const Radius.circular(12) : const Radius.circular(0),
            bottomRight:
                isMe ? const Radius.circular(0) : const Radius.circular(12),
          ),
        ),
        child: Text(
          messageContent,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
