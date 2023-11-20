// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../theme/themes.dart';

class NewsPage extends StatelessWidget {
  final String documentIdz;
  NewsPage({required this.documentIdz});

  @override
  Widget build(BuildContext context) {
    CollectionReference userz = FirebaseFirestore.instance.collection('news');

    return FutureBuilder<DocumentSnapshot>(
      future: userz.doc(documentIdz).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              ListTile(
                trailing: Text(
                  data["data"].toString(),
                  style: TextStyle(color: Colors.red),
                ),
                title: Text(
                  data["title"],
                  style: TextStyle(
                      fontFamily: 'DG',
                      color: color_blue,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "ប្រភព​ : " + data["subtitle"] + data["id"].toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 99, 99, 99),
                      fontFamily: 'DG',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Image.network(data["image"]),
                    );
                  },
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: color_rgb, //                   <--- border color
                        width: 1,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          data["image"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: null /* add child content here */,
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  //Phone call
                  Text(
                    data["content"],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'DG',
                      color: Colors.grey[800],
                    ),
                  )
                ],
              ),
            ],
          );
        }
        return Column(
          children: [
            ListTile(
              trailing: Text(
                'កំពុងផ្ទុក សូមរង់ចាំ ....',
                style: TextStyle(color: Colors.red),
              ),
              title: Text(
                'កំពុងផ្ទុក សូមរង់ចាំ ....',
                style: TextStyle(
                    fontFamily: 'DG',
                    color: color_blue,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'កំពុងផ្ទុក សូមរង់ចាំ ....',
                style: TextStyle(
                    color: Color.fromARGB(255, 99, 99, 99),
                    fontFamily: 'DG',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => Image.network(
                        'ការិយាល័យអប់រំបណ្តុះបណ្តាលបច្ចេកទេស និងវិជ្ជាជីវៈ នៃវិទ្យាស្ថាន​ពហុ​បច្ចេកទេសមិត្តភាពកម្ពុជា ចិនខេត្តព្រះសីហនុ សូមជម្រាបជូនដំណឹងដល់ប្អូនៗ សិស្ស និសិ្សត កម្រិតបរិញ្ញាបត្រ បរិញ្ញាបត្ររង ឆ្នាំទី១ និងកម្រិតសញ្ញាបត្របច្ចេកទេស និងវិជ្ជាជីវៈ ១ ២ ៣ ក្នុងឆ្នាំសិក្សាថ្មី ២០២១-២០២២ ទាំងអស់អោយបានជ្រាបថា ៖          ការបើកបវេសនកាល ឆ្នាំសិក្សាថ្មី ២០២១-២០២២ នឹងប្រព្រឹត្តទៅ  នៅថ្ងៃចន្ទ ៥កើត ខែផល្គុន ឆ្នាំឆ្លូវ ត្រីស័ក ព.ស.២៥៦៥ ត្រូវនឹងថ្ងៃទី៧ ខែមីនា ឆ្នាំ២០២២ វេលាម៉ោង ៧:៣០ នាទីព្រឹក។  អាស្រ័យហេតុនេះ សូមសិស្ស-និសិ្សតទំាងអស់ជ្រាបជាព័ត៌មាន និងចូលរួមកុំបីខាន។'),
                  );
                },
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: color_rgb, //                   <--- border color
                      width: 1,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/pccfpi-f8ce0.appspot.com/o/playstore.png?alt=media&token=a02d3eda-370f-4761-8650-9b7b61dc9e4d',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: null /* add child content here */,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                //Phone call
                Text(
                  'កំពុងផ្ទុក សូមរង់ចាំ ....',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'DG',
                    color: Colors.grey[800],
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
