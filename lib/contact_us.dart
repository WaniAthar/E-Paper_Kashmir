import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.white54,
      body: ContactUs(
        
        cardColor: Colors.white,
        textColor: Colors.black,
        logo: AssetImage('images/logo.jpg'),
        email: 'atharwani001@gmail.com',
        companyName: 'Athar Wani',
        companyColor: Colors.grey.shade900,
        dividerThickness: 2,
        website: 'http://www.atharwani.me',
        githubUserName: 'WaniAthar',
        tagLine: 'Developer at Spextek',
        taglineColor: Colors.grey.shade900,
        // twitterHandle: 'AbhishekDoshi26',
        instagram: 'guy_with_glasses__',
        // facebookHandle: '_abhishek_doshi'
      ),
    ));
  }
}
