// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccfpi/animation/fade_animation.dart';

import '../theme/themes.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key, required this.title});
  final String title;

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  "PCCFPI",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: color_blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "' ",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mobile",
                  style: TextStyle(
                    color: color_blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
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
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.1,
                    image: AssetImage("assets/images/1024.png"),
                    fit: BoxFit.contain),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  FadeAnimation(
                    intervalStart: 0.1,
                    child: Text(
                      'ព្រះរាជាណាចក្រកម្ពុជា',
                      style: GoogleFonts.moul(
                        textStyle: TextStyle(
                            color: color_blue,
                            fontSize: 19,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    intervalStart: 0.1,
                    child: Text(
                      'ជាតិ សាសនា ព្រះមហាក្សត្រ',
                      style: GoogleFonts.moul(
                        textStyle: TextStyle(
                            color: color_blue,
                            fontSize: 17,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    intervalStart: 0.1,
                    child: Text('3',
                        style: TextStyle(fontFamily: 'TA', fontSize: 35)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Row(
                      children: [
                        FadeAnimation(
                          intervalStart: 0.2,
                          child: Text(
                            'វិទ្យាស្ថានពហុបច្ចេកទេសមិត្តភាពកម្ពុជា ចិនខេត្តព្រះសីហនុ\nការិយាល័យអប់រំបណ្តុះបណ្តាលបច្ចេកទេ និងវិជ្ជាជីវៈ\nលេខៈ ....................................វ.ព.ម.ក.ច.ព/ក.អ.ប.វ',
                            style: GoogleFonts.koulen(
                              textStyle: TextStyle(
                                  color: Colors.black87, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FadeAnimation(
                    intervalStart: 0.2,
                    child: Text(
                      'សេចក្តីជូនដំណឹង',
                      style: GoogleFonts.moul(
                        textStyle: TextStyle(color: color_blue, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: FadeAnimation(
                      intervalStart: 0.2,
                      child: Text(
                        '   ការិយាល័យអប់រំបណ្តុះបណ្តាលបច្ចេកទេស និងវិជ្ជាជីវៈ  សូមជម្រាបជូនដំណឹងដល់ប្អូនៗ សិស្ស-និសិ្សត ដែលនឹងបន្តសិក្សានៅឆ្នាំទី២, ៣, ៤ នៅវិទ្យាស្ថានពហុបច្ចេកទេសមិត្តភាពកម្ពុជា ចិនខេត្តព្រះសីហនុឲ្យបានជ្រាបថា៖',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: FadeAnimation(
                      intervalStart: 0.2,
                      child: Text(
                        '      ' + widget.title + '\n',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: color_blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: FadeAnimation(
                      intervalStart: 0.2,
                      child: Text(
                        '‌‌បញ្ជក់៖  សូមប្អូនៗសិស្ស-និស្សិតទាំងអស់ដែលមិនទាន់បានភ្ជាប់ជាមួយឯកសារចូលរៀនបានបានគ្រប់ចំនួនទេ សូមភ្ជាប់មកជាមួយឯកសារដែលនៅខ្វះខាត់នោះផង។',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    intervalStart: 0.2,
                    child: Text(
                      'អាស្រ័យហេតុនេះ សូមសិស្ស-និសិ្សតទំាងអស់ជ្រាបជាព័ត៌មាន និងចូលរួមកុំបីខាន ។\n\n\n',
                      style: GoogleFonts.battambang(
                        textStyle: TextStyle(
                            color: color_blue,
                            fontSize: 11,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
                    child: FadeAnimation(
                      intervalStart: 0.2,
                      child: Text(
                        'ថ្ងៃចន្ទ ៤រោច ខែមិគសិរ ឆ្នាំខាល ចត្វស័ក ព.ស ២៥៦៦\nព្រះសីហនុ ថ្ងៃទី១២ ខែធ្នូ ឆ្នាំ២០២២\nក. អប់រំបណ្តុះបណ្តាលបច្ចេកទេស និងវិជ្ជាជីវៈ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.battambang(
                          textStyle: TextStyle(
                              color: color_blue,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
