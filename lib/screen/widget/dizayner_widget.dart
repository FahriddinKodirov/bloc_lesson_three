import 'package:bloc_lesson_three/data/model/detailed_company/detailed_model.dart';
import 'package:flutter/material.dart';

class DizaynerWidget extends StatelessWidget {
  final DetaildeModel detaildeModel;

  const DizaynerWidget({super.key, required this.detaildeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(offset: Offset(2, -2), blurRadius: 2, spreadRadius: 2),
            BoxShadow(offset: Offset(-2, 2), blurRadius: 2, spreadRadius: 2),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: PageView.builder(
                itemCount: detaildeModel.carPics.length,
                itemBuilder: (context, index) {
                  return Image.network(detaildeModel.carPics[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.7,
                  top: MediaQuery.of(context).size.height * 0.008),
              child: Image.network(detaildeModel.logo, width: 60),
            ),
            Text(detaildeModel.carModel, style: const TextStyle(fontSize: 24)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              detaildeModel.description,
              maxLines: 18,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              'Price: ${detaildeModel.averagePrice}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Established Year: ${detaildeModel.establishedYear}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
