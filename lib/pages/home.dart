import 'package:assignmentcopy/shared/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:io';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=0;

  String filename='';
  FilePickerResult? result;
  // Variables in which textfield values will be assigned
  String name='';
  String rollNo='';
  String whatsapp='';
  String instructions='';
  // Textfield Controllers
  // TextEditingController nameController=TextEditingController();
  // TextEditingController RollController=TextEditingController();
  // TextEditingController InstController=TextEditingController();
  // form key
  final _formKey=GlobalKey<FormState>();
 // pdf pages count


  Future<void> _sendEmail() async {
    // Assigning textfield values
    // name=nameController.text;
    // rollNo=RollController.text;
    // instructions=InstController.text;
    // Sending an email using gmail app
    File file = File(result!.files.single.path!);
    try{
      String userEmail='mayankswaroop57@gmail.com';
      final smtpServer=gmail(userEmail, 'yhowwonrqzbdzurg');
      final message=Message()
        ..from=Address(userEmail.toString())
        ..recipients.add('mayankk074@gmail.com')
        ..subject=name
        ..text='$rollNo --- $instructions'
        ..attachments = [
          FileAttachment(file)
            // ..location = Location.inline
            // ..cid = '<myimg@3.141>'
        ];
      //sending the mail
      await send(message, smtpServer);
      print('Email has been sent');
    }
    catch(e){
      print('${e.toString()}');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment Creator'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.purpleAccent[200],
        onDestinationSelected: (int index) => setState(() => currentIndex=index),
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.book), label: 'ReadMe'),
        ],
      ),
      body:[//Home
        SingleChildScrollView(
          child: Container(
            height: 2000.0,
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
            color: Colors.grey[300],
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                   Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // Pick a pdf file
                        result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );
          
                        if (result != null) {
          
                          setState(() {
                            // Set the file name to screen
                            PlatformFile file = result!.files.first;
                            filename=file.name;
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      icon: Icon(Icons.file_upload_outlined),
                      label: Text('Pick a PDF'),
                    ),
                  ),
                  Text('$filename'),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your name',
                      labelText: 'Name'
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter a name' : null,
                    onChanged: (val) => setState(() => name=val),
                  ),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter your roll number',
                        labelText: 'Roll Number'
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter a roll number' : null,
                    onChanged: (val) => setState(() => rollNo=val),
                  ),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter your whatsapp number',
                        labelText: 'Whatsapp Number'
                    ),
                    validator: (val) => val!.length == 10 ? null : 'Enter a valid whatsapp number',
                    onChanged: (val) => setState(() => whatsapp=val),
                  ),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    maxLines: 5,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter the instructions',
                        labelText: 'instructions',
                        contentPadding: const EdgeInsets.symmetric(vertical: 55.0, horizontal: 10.0),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter the instructions' : null,
                    onChanged: (val) => setState(() => instructions=val),
                  ),
                  const SizedBox(height: 20.0,),
                  ElevatedButton(
                    // onPressed: _sendEmail,
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(200)),
                    ),
                    onPressed: (){
                      if(_formKey.currentState!.validate() && filename!=null){
                        Navigator.pushNamed(context, '/confirmation', arguments: {
                          'name': name,
                          'rollNo': rollNo,
                          'whatsapp': whatsapp,
                          'instruction': instructions,
                          'file': result,
                        });
                      }
                    },
                    child: Text('Next'),
                  )
                ],
          
              ),
            ),
          ),
        ),
        //ReadMe
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
          color: Colors.grey[300],
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tired of spending hours copying assignments manually? Say goodbye to the monotony with Assignment Creator - your one-stop solution for hassle-free assignment preparation!',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'How It Works:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                '1. Upload Your PDF: Simply upload the PDF file of the assignment you want to replicate, along with your name, roll no. or any other personalized details you would like to include.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                '2. Whatsapp Number: Enter your whatsapp number on which the assignment will be sent.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                '3. Payment: Now, just do the payment according to the pages of the pdf.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                '4. Sit Back and Relax: Your assignment will be sent to your whatsapp number.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'Use:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                '1. Online Upload: If you have to submit the assigments online you can use our app and submit the copied assignment which will be made with your data.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        )
      ][currentIndex]
    );
  }
}
