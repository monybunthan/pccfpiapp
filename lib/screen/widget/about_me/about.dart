// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../theme/themes.dart';

class About_Page extends StatefulWidget {
  // const About_Page({super.key});

  @override
  State<About_Page> createState() => _About_PageState();
}

class _About_PageState extends State<About_Page> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'អំពីយើង​​ v1.0.0',
          style: TextStyle(fontFamily: 'DG', color: color_blue),
        ),
        // centerTitle: true,
        elevation: 0.5,
        leading: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.transparent, width: 0.8),
            primary: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: color_rgb,
          ),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 7),
            sliver: SliverGrid.count(
              childAspectRatio: (itemWidth / 70),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: <Widget>[
                Container(
                  // margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    border: Border.all(color: color_rgb),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/1024.png'),
                      Expanded(
                        child: Text(
                          'វិទ្យាស្ថានពហុបច្ចេកទេសមិត្តភាពកម្ពុជា ចិនខេត្តព្រះសីហនុ',
                          // textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: color_rgb,
                              fontFamily: 'DG',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //four student
          SliverPadding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            sliver: SliverGrid.count(
              childAspectRatio: (itemWidth / 150),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 4,
              children: <Widget>[
                //peng vuthy
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color_rgb),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: const Color(0xff7c94b6),
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       'https://fv9-5.failiem.lv/thumb_show.php?i=ht985rbmk&download_checksum=8fefe8f9f0a652710872643d1c73206ef9074d70&download_timestamp=1674640964'),
                            //   fit: BoxFit.contain,
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: color_rgb,
                              width: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.white,
                              height: 165,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 28),
                                      child: Text(
                                        'Support ME via QR CODE :',
                                        style: TextStyle(
                                            color: color_rgb,
                                            fontFamily: 'DG',
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 9),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => Image.asset(
                                                    'assets/images/qr_than.png'),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: color_rgb),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Image.asset(
                                                'assets/images/qr_than.png',
                                                width: 125,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color_rgb),
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    // Image.network(
                                                    //   'https://fv9-5.failiem.lv/thumb_show.php?i=ht985rbmk&download_checksum=8fefe8f9f0a652710872643d1c73206ef9074d70&download_timestamp=1674640964',
                                                    //   width: 50,
                                                    // ),
                                                    Text(
                                                      'ភៀង​ វុទ្ធី',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 13,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'PHIENG VUTHY',
                                                    style: TextStyle(
                                                        color: color_rgb,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                  Text(
                                                    'Contact Me Via TELEGRAM',
                                                    style: TextStyle(
                                                        color: red,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 9),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
                //heng
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color_rgb),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: const Color(0xff7c94b6),
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       'https://fv9-6.failiem.lv/thumb_show.php?i=79gcevarf&download_checksum=278638e1dcfe9da4211473fcf0363c35bb3362dc&download_timestamp=1674642510'),
                            //   fit: BoxFit.contain,
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: color_rgb,
                              width: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.white,
                              height: 165,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 28),
                                      child: Text(
                                        'Support ME via QR CODE :',
                                        style: TextStyle(
                                            color: color_rgb,
                                            fontFamily: 'DG',
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 9),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => Image.asset(
                                                    'assets/images/qr_than.png'),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: color_rgb),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Image.asset(
                                                'assets/images/qr_than.png',
                                                width: 125,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color_rgb),
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    // Image.network(
                                                    //   'https://fv9-6.failiem.lv/thumb_show.php?i=79gcevarf&download_checksum=278638e1dcfe9da4211473fcf0363c35bb3362dc&download_timestamp=1674642510',
                                                    //   width: 50,
                                                    // ),
                                                    Text(
                                                      'សុខ​ ហេង',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'MONY BUNTHAN',
                                                    style: TextStyle(
                                                        color: color_rgb,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                  Text(
                                                    'Contact Me Via TELEGRAM',
                                                    style: TextStyle(
                                                        color: red,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 9),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
                //meta
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color_rgb),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: const Color(0xff7c94b6),
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       'https://fv9-6.failiem.lv/thumb_show.php?i=3huery2ek&download_checksum=4fb4c69073647dca476f41dc695b266fdc7172d3&download_timestamp=1674641550'),
                            //   fit: BoxFit.contain,
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: color_rgb,
                              width: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.white,
                              height: 165,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 28),
                                      child: Text(
                                        'Support ME via QR CODE :',
                                        style: TextStyle(
                                            color: color_rgb,
                                            fontFamily: 'DG',
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 9),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => Image.asset(
                                                    'assets/images/qr_than.png'),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: color_rgb),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Image.asset(
                                                'assets/images/qr_than.png',
                                                width: 125,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color_rgb),
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    // Image.network(
                                                    //   'https://fv9-6.failiem.lv/thumb_show.php?i=3huery2ek&download_checksum=4fb4c69073647dca476f41dc695b266fdc7172d3&download_timestamp=1674641550',
                                                    //   width: 45,
                                                    // ),
                                                    Text(
                                                      'ឌុក​ មេត្តា',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'MONY BUNTHAN',
                                                    style: TextStyle(
                                                        color: color_rgb,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                  Text(
                                                    'Contact Me Via TELEGRAM',
                                                    style: TextStyle(
                                                        color: red,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 9),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
                //than
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color_rgb),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: const Color(0xff7c94b6),
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       'https://firebasestorage.googleapis.com/v0/b/pccfpi-f8ce0.appspot.com/o/Photo.jpg?alt=media&token=d1c88e53-0d77-4731-be22-0fb49d77cb1d'),
                            //   fit: BoxFit.contain,
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: color_rgb,
                              width: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.white,
                              height: 165,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 28),
                                      child: Text(
                                        'Support ME via QR CODE :',
                                        style: TextStyle(
                                            color: color_rgb,
                                            fontFamily: 'DG',
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 9),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => Image.asset(
                                                    'assets/images/qr_than.png'),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: color_rgb),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Image.asset(
                                                'assets/images/qr_than.png',
                                                width: 125,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: color_rgb),
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    // Image.network(
                                                    //   'https://firebasestorage.googleapis.com/v0/b/pccfpi-f8ce0.appspot.com/o/Photo.jpg?alt=media&token=d1c88e53-0d77-4731-be22-0fb49d77cb1d',
                                                    //   width: 50,
                                                    // ),
                                                    Text(
                                                      'មុន្នី ប៊ុនថាន',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                          color: color_rgb,
                                                          fontFamily: 'DG',
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'MONY BUNTHAN',
                                                    style: TextStyle(
                                                        color: color_rgb,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                  Text(
                                                    'Contact Me Via TELEGRAM',
                                                    style: TextStyle(
                                                        color: red,
                                                        fontFamily: 'DG',
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: 9),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
          //content about
          SliverPadding(
            padding: const EdgeInsets.only(left: 7, right: 7, top: 7),
            sliver: SliverGrid.count(
              childAspectRatio: (itemWidth / 130),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 1,
              children: <Widget>[
                Container(
                  // margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    border: Border.all(color: color_rgb),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'សូមស្វាគមន៍!',
                            style: TextStyle(
                                color: color_rgb,
                                fontFamily: 'DG',
                                fontSize: 17.5),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0),
                            width: c_width,
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'កម្មវិធីនេះ ជាកម្មវិធីដែលបង្កើតឡើងដោយពួកយើងខាងលើនេះ ដោយបង្កើតសម្រាប់ធ្វើជាសារណាបញ្ចប់កាកិស្សាឆ្នាំទី៤ ដែលជាឆ្នាំចុងក្រោយ ។ កម្មវិធីនេះបង្កើតសម្រាប់សម្រួល មួយផ្នែកដល់សាលា និងសិក្សានុសិស្សផងដែរ ដើម្បីស្វែងយល់ព័ត៍មានមួយចំនួនដែលទាក់ទង់ក្នុងសាលា​ ។ ហើយក៏សូមអព្យាស្រ័យនៅរាល់បញ្ហាដែលកើតឡើងនៅត្រង់ចំនុចមួយចំនួនផងដែរយើងនិងព្យាយាមធើវាអោយកាន់តែប្រើសើ ។​ មានបញ្ហាអ្វីអាចទាក់ទង់មកពួកយើងផ្ទាល់ ឫសាលាបន្ថែម ។ សូមអរគុណ!​​​​',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: color_rgb,
                                      fontFamily: 'DG',
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 7),
            sliver: SliverGrid.count(
              childAspectRatio: (itemWidth / 35),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: <Widget>[
                Container(
                  // margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    border: Border.all(color: color_rgb),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/phone-call.svg',
                              width: 17,
                              color: color_blue,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '088 879 7842',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: color_rgb,
                                  fontFamily: 'DG',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
