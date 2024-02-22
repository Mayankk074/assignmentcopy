import 'package:assignmentcopy/pages/payment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';

class Confirmation extends StatelessWidget {
  Confirmation({super.key});
  Map data={};
//pdf pages counter
  int pdfCount(){
    String path=data['file'].files.single.path!;
    // Loads an existing PDF document
    PdfDocument document = PdfDocument(inputBytes: File(path).readAsBytesSync());

// Gets the pages count
    int pageCount = document.pages.count;

// Disposes the document
    document.dispose();

    return pageCount;
  }

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context)!.settings.arguments as Map;
    PlatformFile file = data['file']!.files.first;
    String filename=file.name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Confirmation'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              data['name'],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Roll Number:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              data['rollNo'],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Whatsapp Number:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              data['whatsapp'],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              data['instruction'],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'File Name:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              filename,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Total Payment:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              //calling the pdfCount()
              'Rs: ${pdfCount()*10}',
              style: TextStyle(
                color: Colors.green,
                fontSize: 28.0,
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                ElevatedButton.icon(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(150)),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.edit),
                    label: Text('Edit')),
                SizedBox(width: 40.0,),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(150)),
                    ),
                    onPressed: (){
                      Payment(name: data['name'],amount: pdfCount()*1000).openCheckOut();

                    },
                    icon: Icon(Icons.payment_outlined),
                    label: Text('Payment')),


              ],
            )

          ],
        )
      ),
    );
  }
}

