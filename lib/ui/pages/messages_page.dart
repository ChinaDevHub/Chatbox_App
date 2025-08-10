import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/ui/widgets/custom_icon.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';

typedef CallBack = VoidCallback;
typedef TextEditCont = TextEditingController;

class MessagesPage extends StatefulWidget {
  const MessagesPage({
    super.key,
    required this.profileIcon,
    required this.profileName,
  });

  //Home Page den gelir
  final Widget profileIcon;
  final Widget profileName;
  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class Message {
  final String text;
  final TimeOfDay time;
  final bool isMe;
  final bool isVoice;

  Message({
    required this.text,
    required this.time,
    required this.isMe,
    this.isVoice = false,
  });
}

var messageList = <dynamic>[
  Message(text: 'Salam ', time: TimeOfDay.now(), isMe: false),
  Message(text: 'Bir sual vermeliyem', time: TimeOfDay.now(), isMe: false),
  Message(
    text: 'Sesime qulaq as ',
    time: TimeOfDay.now(),
    isMe: false,
    isVoice: true,
  ),
  Message(text: 'Salam ', time: TimeOfDay.now(), isMe: true),
  Message(text: 'Buyurun ', time: TimeOfDay.now(), isMe: true, isVoice: true),
  Message(
    text: 'Isim var idi dostum',
    time: TimeOfDay.now(),
    isMe: false,
    isVoice: true,
  ),
];

class _MessagesPageState extends State<MessagesPage> {
  final TextEditCont _controller = TextEditCont();

  //Mesaj gondermek
  void sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      messageList.add(
        Message(
          text: _controller.text.trim(),
          time: TimeOfDay.now(),
          isMe: true,
        ),
      );
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            15.horizontalSpace,
            buildHeader(widget.profileIcon, widget.profileName, context),
            30.verticalSpace,
            buildTodayLabel(),
            20.verticalSpace,
            buildMessageList(widget.profileIcon, widget.profileName),
            10.horizontalSpace,
            buildFooter(_controller, sendMessage),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(
  Widget profileIcon,
  Widget profileName,
  BuildContext context,
) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomIcon(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      profileIcon, //Home page den aliriq
      SizedBox(width: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileName, //Home page den gelir
          SizedBox(height: 1),
          Text(
            'Active now',
            style: CustomTextEdit.NORMAL_TEXT_STYLE(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
      Spacer(),
      CustomIcon(
        icon: Icon(Icons.call_rounded),
        onPressed: () {
          log('Call clicked...');
        },
      ),
      //SizedBox(width: 20),
      Padding(
        padding: const EdgeInsets.only(right: 15, left: 8),
        child: CustomIcon(
          icon: Icon(Icons.videocam_outlined),
          onPressed: () {
            log('Video call clicked...');
          },
        ),
      ),
    ],
  );
}

Widget buildTodayLabel() {
  return SizedBox(
    height: 30.h,
    width: 70.w,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade100,
      ),
      child: Center(
        child: Text(
          'Today',
          style: CustomTextEdit.NORMAL_TEXT_STYLE(
            color: Colors.grey.shade900,
            fontSize: 15,
          ),
        ),
      ),
    ),
  );
}

Widget buildMessageList(Widget profileIcon, Widget profileName) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: messageList.length,
      itemBuilder: (context, index) {
        final message = messageList[index];
        return Column(
          crossAxisAlignment:
              message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!message.isMe)
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 2),
                child: Row(
                  children: [profileIcon, 6.horizontalSpace, profileName],
                ),
              ),
            if (!(message.isVoice))
              messagePart(message)
            else
              voicePart(message.isMe),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message.time.format(context), //TimeofDay-> String
                style: CustomTextEdit.NORMAL_TEXT_STYLE(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            //---
            25.verticalSpace,
          ],
        );
      },
    ),
  );
}

Widget buildFooter(TextEditCont controller, CallBack sendMessage) {
  return Row(
    children: [
      10.horizontalSpace,
      CustomIcon(
        icon: Icon(Icons.attach_file_rounded),
        onPressed: () {
          log('File is cliscked...');
        },
      ),
      10.horizontalSpace,
      Expanded(
        child: SizedBox(
          height: 40.h,
          width: 400.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onSubmitted: (value) => sendMessage(), //Enter
              controller: controller,
              autofocus: true,
              keyboardType: TextInputType.text,
              maxLines: 1,
              textAlign: TextAlign.start, //Baslangicdan baslasin
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  //Biraz sagdan baslasin Padding ile
                  horizontal: 10.w,
                  vertical: 8.h,
                ),
                border: InputBorder.none,
                hint: Center(
                  child: Text(
                    'Write your message',
                    style: CustomTextEdit.NORMAL_TEXT_STYLE(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      10.horizontalSpace,
      CustomIcon(
        icon: Icon(Icons.send),
        onPressed: sendMessage,
        iconColor: Colors.teal.shade700,
      ),
      CustomIcon(
        icon: Icon(Icons.camera_alt_outlined),
        onPressed: () {
          log('Camera is clicked...');
        },
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: CustomIcon(
          icon: Icon(Icons.mic_none_rounded),
          onPressed: () {
            log('Voice is clicked...');
          },
        ),
      ),
    ],
  );
}

Widget messagePart(Message message) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      constraints: BoxConstraints(
        minWidth: 40,
        maxWidth: 220,
        minHeight: 35,
        maxHeight: 40,
      ),
      decoration: BoxDecoration(
        color: message.isMe ? Colors.teal : Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(message.isMe ? 0 : 20),
          topLeft: Radius.circular(message.isMe ? 20 : 0),
        ),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          message.text,
          style: CustomTextEdit.NORMAL_TEXT_STYLE(
            color: message.isMe ? Colors.white : Colors.black,
            fontSize: 13,
          ),
        ),
      ),
    ),
  );
}

Widget voicePart(bool isMe) {
  Color bubbleColor = isMe ? Colors.teal : Colors.grey.shade300;
  Color textColor = isMe ? Colors.white : Colors.black;
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 10, bottom: 7),
    child: Container(
      constraints: BoxConstraints(minWidth: 50.w, maxWidth: 250.w),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isMe ? 20 : 0),
          topRight: Radius.circular(isMe ? 0 : 20),
          bottomLeft: const Radius.circular(20),
          bottomRight: const Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow, color: textColor),
          const SizedBox(width: 8),
          SizedBox(
            width: 60.w,
            height: 4.h,
            child: LinearProgressIndicator(
              stopIndicatorColor: Colors.teal.shade700,
              backgroundColor: Colors.grey.shade400,
              value: 0.70,
              color: Colors.black54,
            ),
          ),
          // Container(
          //   width: 100,
          //   height: 4,
          //   decoration: BoxDecoration(
          //     color: textColor.withOpacity(0.5),
          //     borderRadius: BorderRadius.circular(2),
          //   ),
          // ),
          const SizedBox(width: 8),
          Text("0:12", style: TextStyle(color: textColor, fontSize: 12)),
        ],
      ),
    ),
  );
}
