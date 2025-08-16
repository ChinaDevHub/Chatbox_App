import 'package:flutter/material.dart';

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