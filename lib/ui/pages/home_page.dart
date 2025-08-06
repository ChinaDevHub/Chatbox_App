import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_mentor/controllers/login_controller.dart';
import 'package:my_mentor/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> pages = [];

  final List<String> storyImages = [
    'assets/white_back_ME.jpg',
    'assets/fuad_photo.jpg',
    'assets/status_photo_3.png',
    'assets/status_photo_4.png',
    'assets/status_photo_5.png',
    'assets/status_photo.png',
    'assets/leqa.jpg',
    'assets/sukurov.jpg',
    'assets/seferov.jpg',
    'assets/zloyme.jpg',
  ];

  final List<String> messageTitle = [
    'Alex Linderson',
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

  final List<String> messageSubTitle = [
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

  final List<String> statusNames = [
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

  final List<Color> storyEdgeColors = [
    Colors.grey,
    Colors.blue,
    Colors.blue.shade300,
    Colors.pinkAccent,
    Colors.yellow,
    Colors.greenAccent.shade700,
    Colors.blue.shade300,
    Colors.pinkAccent,
    Colors.yellow,
    Colors.greenAccent.shade700,
  ];

//AppBar Part
  PreferredSize appBar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
          leading: Image.asset('assets/Search.png', fit: BoxFit.scaleDown),
          backgroundColor: Colors.black,
          title: Text(
            "Home",
            style: CustomTextEdit.NORMAL_TEXT_STYLE(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage(storyImages.first),
                radius: 23,
              ),
            ),
          ],
        ),
    );
  }

  // Body Part
  Widget body(){
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 40),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: storyImages.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: storyEdgeColors[i],
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(storyImages[i]),
                              maxRadius: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: Text(
                            statusNames[i],
                            style: CustomTextEdit.NORMAL_TEXT_STYLE(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            //maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40),
            //Mesajlar
            DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.grey,
                        endIndent: 180,
                        indent: 180,
                        thickness: 3,
                      ),
                      SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: storyImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Slidable(
                              key: ValueKey(index),
                              endActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  //Notifications Icon
                                  SlidableAction(
                                    padding: EdgeInsets.all(10),
                                    borderRadius: BorderRadius.circular(25),
                                    onPressed: (context) {
                                      print('Notification is clicked...');
                                    },
                                    icon: Icons.notifications,
                                    label: 'Notifications',
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                  //Delete Icon
                                  SlidableAction(
                                    borderRadius: BorderRadius.circular(25),
                                    onPressed: (context) {
                                      print('Delete is clicked...');
                                    },
                                    icon: Icons.delete,
                                    label: 'Delete',
                                    backgroundColor: Colors.red,
                                  ),
                                ],
                              ),
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  leading: Transform.scale(
                                    scale: 1.25,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        storyImages[index],
                                      ),
                                      //maxRadius: 25,
                                    ),
                                  ),
                                  title: Text(
                                    messageTitle[index],
                                    style: CustomTextEdit.NORMAL_TEXT_STYLE(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    messageSubTitle[index],
                                    style: CustomTextEdit.NORMAL_TEXT_STYLE(
                                      color: Colors.blueGrey.shade600,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  trailing: Column(
                                    children: [
                                      Text('2 min ago'),
                                      SizedBox(height: 5),
                                      index % 2 == 0
                                          ? CircleAvatar(
                                            backgroundColor: Colors.red.shade700,
                                            child: Center(
                                              child: Text(
                                                '4',
                                                style:
                                                    CustomTextEdit.NORMAL_TEXT_STYLE(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                              ),
                                            ),
                                            maxRadius: 12,
                                          )
                                          : Text(''),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final watchData = context.watch<LoginController>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: watchData.onTapped,
        currentIndex: watchData.selectedIndex,
      ),
    );
  }
}