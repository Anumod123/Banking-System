import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled/data/database.dart';
import 'package:untitled/model/note.dart';
import 'package:untitled/pages/moneyTransfer.dart';

class UserDetailPage extends StatefulWidget {
  final int userAC;
  const UserDetailPage({
    Key? key,
    required this.userAC,
  }) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late User user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshUser();
  }

  Future refreshUser() async {
    setState(() => isLoading = true);
    this.user = await BankDatabase.instance.readUser(widget.userAC);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://cdn.icon-icons.com/icons2/2104/PNG/512/bank_icon_129525.png'),
          ),
          backgroundColor: Colors.teal[900],
          title: Text(
            'AccountDetails',
            style: TextStyle(fontSize: 24),
          ),
          actions: [],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : userDetails(),
      );
  Widget userDetails() => Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Name: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 30),
                      children: [
                        TextSpan(
                          text: user.name,
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Account Number: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 15),
                      children: [
                        TextSpan(
                          text: user.ac.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Email: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 15),
                      children: [
                        TextSpan(
                          text: user.email,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Current Balance: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 15),
                      children: [
                        TextSpan(
                          text: 'Rs. ' + user.balance.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Phone Number: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 15),
                      children: [
                        TextSpan(
                          text: user.number,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton( 
                      style: ElevatedButton.styleFrom(primary: Colors.teal[900]),
                      
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TransferMoneyPage(userAC: user.ac!),
                        ));
                      },
                      child: Center(
                        child: Text(
                          'Transfer',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  /*Widget backbutton() => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () async {
          if (isLoading) return;
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        },
      );*/
}