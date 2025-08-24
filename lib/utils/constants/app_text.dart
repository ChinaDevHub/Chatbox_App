import 'package:flutter/material.dart';
import 'package:my_mentor/models/message_model.dart';

class AppText {
  AppText._();
  //OnBoard Page
  static const String connectFriend = 'Connect friends';
  static const String onboardDescription =
      'Our chat app is the perfect way to stay\nconnected with friends and family.';
  static const String buttonText = 'Sign up with mail';
  static const String existAccount = 'Existing account?';
  static const String loginText = 'Log In';

  //SignIn Page
  static const String loginToChatBox = 'Log in to Chatbox';
  static const String welcomeBack =
      'Welcome back! Sign in using your social account or email to continue us';
  static const String yourEmail = 'Your Email';
  static const String yourPassword = 'Your password';
  static const String pleaseFill = 'Please fill in all fields correctly.';

  //SignUp Page
  static const String signUpEmail = 'Sign up with Email';
  static const String signUpDesc =
      'Get chatting with friends and family today by signing up for our chat app!';
  static const String yourName = 'Your name';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String createAccount = 'Create an account';

  //Home Page
  static const String home = 'Home';
  static const List<String> statusNames = [
    'My Status',
    'Fuad',
    'Marina',
    'John',
    'Sabila',
    'Alney',
    'Murad',
    'Murad',
    'Senan',
    'You',
  ];
  static const String notificationClicked = 'Notification is clicked...';
  static const String notifications = 'Notifications';
  static const String deleteClicked = 'Delete is clicked...';
  static const String delete = 'Delete';
  static const String callClicked = 'Call clicked...';
  static const String videoCamClicked = 'Video call clicked...';
  static const String fileClicked = 'File is cliscked...';
  static const String cameraClicked = 'Camera is clicked...';
  static const String voiceCLicked = 'Voice is clicked...';
  static const String forgetClicked = 'Forget clicked...';
  static const List<String> messageTitle = [
    'Chingiz Zaidov',
    'Fuad Atashov',
    'Team Align',
    'John Ahraham',
    'Sabila Sayma',
    'Alney Budovski',
    'Murad Kahayev',
    'Murad Shukurov',
    'Senan Seferov',
    'You',
  ];
  static const List<String> messageSubTitle = [
    'How are you today?',
    "Don't miss to attend the meeting.",
    'Hey!Can you join the meeting?',
    'How are you today?',
    'Have a good day!',
    'can you come here?',
    "Don't forget the file!",
    'Can we talk now?',
    'Good luck today!',
    'Message yourself',
  ];
  static const String twoMinAgo = '2 min ago';
  static const String four = '4';
  static const String activeNow = 'Active now';
  static const String today = 'Today';
  static const String second12 = '0:12';

  static List<Message> messageList = [
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
  static const String writeMessage = 'Write your message';
  static const String messages = 'Messages';
  static const String calls = 'Calls';
  static const String contacts = 'Contacts';
  static const String settings = 'Settings';
  static const String forgotPassword = 'Forgot password?';
  static const String or = 'OR';
  static const String shareContent = 'Share Content';
  static const String empty = '';
  static const List<String> modalTitleList = [
    'Camera',
    'Documents',
    'Create a poll',
    'Media',
    'Contact',
    'Location',
  ];

  static const List<String> modalSubtitleleList = [
    '',
    'Share your files',
    'Create a poll for ant querry',
    'Share photos and videos',
    'Share your contacts',
    'Share your location',
  ];
  static const String cingizZaidov = 'Chingiz Zaidov';
  static const String nazrulIslam = 'Nazrul Islam';
  static const String neverGiveUp = 'Never give up 💪';
  static const List<String> settingTitleList = [
    'Account',
    'Chat',
    'Notifications',
    'Help',
    'Storage and data',
    'Invite a friend',
  ];
  static const List<String> settingSubtitleList = [
    'Privacy,security,change number',
    'Chat history,theme,walpapers',
    'Messages,group and others',
    'Help center, contact us , privacy policy',
    'Network usage, storage usage',
  ];
  static const String dry = '@don\'t repeat yourself';
  static const String zaidovcingizatgmailcom = 'zaidovcingiz2019@gmail.com';
  static const String adressWithSteet = 'Guba , Yuri Gagarin street , home 31';
  static const String phoneNumber010 = '(+994) 10-395-09-18';
  static const String mediaShared = 'Media Shared';
  static const String viewAll = 'View All';

  static const List<String> userProfileTitles = [
    'Display Name',
    'Email Address',
    'Address',
    'Phone Number',
  ];

  static const List<String> userProfileSubtitles = [
    'Zaidov Chingiz',
    'zaidovcingiz2019@gmail.com',
    'Guba, Yuri Gagarin street-31',
    '(+994) 10-395-09-18',
  ];
}
