import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/models/message_model.dart';
import 'package:my_mentor/view/widgets/custom_icon.dart';
import 'package:my_mentor/view/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_icon.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';
import 'package:my_mentor/utils/constants/app_scroll_direction.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';
import 'package:my_mentor/utils/helpers/go.dart';

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

class _MessagesPageState extends State<MessagesPage> {
  final TextEditCont _controller = TextEditCont();
  final ScrollController _scrollController = ScrollController();

  //Mesaj gondermek
  void sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      AppText.messageList.add(
        Message(
          text: _controller.text.trim(),
          time: TimeOfDay.now(),
          isMe: true,
        ),
      );
    });
    _controller.clear();

    //Mesaj asai dussun
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void bottomPopUpMenu() {
    showModalBottomSheet(
      //surusdurub baxlamaq
      enableDrag: true,
      context: context,
      //qalan hisseye toxun close et
      isDismissible: true,
      builder: (context) {
        return Column(
          children: [
            AppSizes.s15.vertical,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomIcon(
                  icon: Icon(AppIcon.close),
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 200), () {
                      if (mounted) {
                        Go.pop(context);
                      }
                    });
                  },
                ),
                CustomText(
                  text: AppText.shareContent,
                  color: AppColor.black,
                  fontSize: AppSizes.s25,
                ),
                AppSizes.s15.horizontal,
                CustomText(
                  text: AppText.empty,
                  color: AppColor.transparent,
                  fontSize: AppSizes.s10,
                ),
              ],
            ),
            AppSizes.s20.vertical,
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: AppText.modalTitleList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: AppColor.black,
                    child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: AppSizes.s30,
                        backgroundColor: AppColor.greyShade300,
                        child: Icon(
                          AppIcon.modalBottomIcons[index],
                          size: AppSizes.s25,
                        ),
                      ),
                      title: CustomText(
                        text: AppText.modalTitleList[index],
                        color: AppColor.black,
                        fontSize: AppSizes.s22,
                        fontWeight: AppTextFontWeight.bold,
                      ),
                      subtitle: Text(AppText.modalSubtitleleList[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSizes.s15.horizontalSpace,
            Row(
              children: [
                Padding(
                  padding: AppPadding.all8,
                  child: CustomIcon(
                    icon: Icon(AppIcon.arrowBackIos),
                    onPressed: () {
                      Go.pop(context);
                    },
                  ),
                ),
                widget.profileIcon, //Home page den aliriq
                AppSizes.s15.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.profileName, //Home page den gelir
                    AppSizes.s1.verticalSpace,
                    CustomText(
                      text: AppText.activeNow,
                      color: AppColor.grey,
                      fontSize: AppSizes.s12,
                    ),
                  ],
                ),
                Spacer(),
                CustomIcon(
                  icon: Icon(AppIcon.callIcon),
                  onPressed: () {
                    log(AppText.callClicked);
                    //Go.to(context, SettingPage());
                  },
                ),
                Padding(
                  padding: AppPadding.r15l8,
                  child: CustomIcon(
                    icon: Icon(AppIcon.videoCam),
                    onPressed: () {
                      log(AppText.videoCamClicked);
                    },
                  ),
                ),
              ],
            ),
            AppSizes.s30.verticalSpace,
            SizedBox(
              height: AppSizes.s30.h,
              width: AppSizes.s70.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppRadius.all15,
                  color: AppColor.greyShade100,
                ),
                child: Center(
                  child: CustomText(
                    text: AppText.today,
                    color: AppColor.greyShade900,
                    fontSize: AppSizes.s15,
                  ),
                ),
              ),
            ),
            AppSizes.s20.verticalSpace,
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                //shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: AppScrollDirection.v,
                itemCount: AppText.messageList.length,
                itemBuilder: (context, index) {
                  final message = AppText.messageList[index];
                  Color bubbleColor =
                      message.isMe ? AppColor.teal : AppColor.greyShade300;
                  Color textColor =
                      message.isMe ? AppColor.white : AppColor.black;
                  return Column(
                    crossAxisAlignment:
                        message.isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                    children: [
                      if (!message.isMe)
                        Padding(
                          padding: AppPadding.l12b2,
                          child: Row(
                            children: [
                              widget.profileIcon,
                              AppSizes.s6.horizontalSpace,
                              widget.profileName,
                            ],
                          ),
                        ),
                      if (!(message.isVoice))
                        Padding(
                          padding: AppPadding.all5,
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: AppSizes.s40,
                              maxWidth: AppSizes.s220,
                              minHeight: AppSizes.s35,
                              maxHeight: AppSizes.s40,
                            ),
                            decoration: BoxDecoration(
                              color: bubbleColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(
                                  message.isMe ? 0 : 20,
                                ),
                                topLeft: Radius.circular(message.isMe ? 20 : 0),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                //Text Align
                                text: message.text,
                                color: textColor,
                                fontSize: AppSizes.s13,
                              ),
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: AppPadding.l15R10B7,
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: AppSizes.s50.w,
                              maxWidth: AppSizes.s220.w,
                            ),
                            padding: AppPadding.h12V8,
                            margin: AppPadding.v4,
                            decoration: BoxDecoration(
                              color: bubbleColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(message.isMe ? 20 : 0),
                                topRight: Radius.circular(
                                  message.isMe ? 0 : 20,
                                ),
                                bottomLeft: const Radius.circular(20),
                                bottomRight: const Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(AppIcon.playArrow, color: textColor),
                                AppSizes.s8.horizontalSpace,
                                SizedBox(
                                  width: AppSizes.s60.w,
                                  height: AppSizes.s4.h,
                                  child: LinearProgressIndicator(
                                    stopIndicatorColor: AppColor.tealShade700,
                                    backgroundColor: Colors.grey.shade400,
                                    value: AppSizes.s0_7,
                                    color: AppColor.black54,
                                  ),
                                ),
                                AppSizes.s8.horizontalSpace,
                                CustomText(
                                  text: AppText.second12,
                                  color: textColor,
                                  fontSize: AppSizes.s12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding: AppPadding.h20,
                        child: CustomText(
                          //!  (.format) => TimeOfDay -> String
                          text: message.time.format(context),
                          color: AppColor.grey,
                          fontSize: AppSizes.s12,
                        ),
                      ),
                      AppSizes.s25.verticalSpace,
                    ],
                  );
                },
              ),
            ),
            AppSizes.s10.horizontalSpace,
            Row(
              children: [
                AppSizes.s10.horizontalSpace,
                CustomIcon(icon: Icon(AppIcon.attachFile), onPressed: () {
                  bottomPopUpMenu();
                }),
                AppSizes.s10.horizontalSpace,
                Expanded(
                  child: SizedBox(
                    height: AppSizes.s40.h,
                    width: AppSizes.s400.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.greyShade200,
                        borderRadius: AppRadius.all15,
                      ),
                      child: TextField(
                        onSubmitted: (value) => sendMessage(), //Enter
                        controller: _controller,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        textAlign: TextAlign.start, //Baslangicdan baslasin
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            //Biraz sagdan baslasin Padding ile
                            horizontal: AppSizes.s10.w,
                            vertical: AppSizes.s8.h,
                          ),
                          border: InputBorder.none,
                          hint: Center(
                            child: CustomText(
                              text: AppText.writeMessage,
                              color: AppColor.grey,
                              fontSize: AppSizes.s12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AppSizes.s10.horizontalSpace,
                CustomIcon(
                  icon: Icon(AppIcon.send),
                  onPressed: sendMessage,
                  iconColor: AppColor.tealShade700,
                ),
                CustomIcon(
                  icon: Icon(AppIcon.camera),
                  onPressed: () {
                    log(AppText.cameraClicked);
                  },
                ),
                Padding(
                  padding: AppPadding.all4,
                  child: CustomIcon(
                    icon: Icon(AppIcon.microphone),
                    onPressed: () {
                      log(AppText.voiceCLicked);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
