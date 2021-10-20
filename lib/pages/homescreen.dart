import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/database.dart';
import 'package:untitled/model/detail.dart';
import 'package:untitled/model/note.dart';
import 'package:untitled/pages/add.dart';
import 'package:untitled/pages/detail.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late List<User> users;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    refreshUsers();
  }

  @override
  void dispose() {
    BankDatabase.instance.close();
    super.dispose();
  }

  Future refreshUsers() async {
    setState(() => loading = true);
    this.users = await BankDatabase.instance.readAllUsers();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://cdn.icon-icons.com/icons2/2104/PNG/512/bank_icon_129525.png'),
          ),
          title: Text('Money Transfer'),
          backgroundColor: Colors.teal[900]),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : users.isEmpty
                ? Text(
                    'No Users',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                : buildList(),
      ),
      /*floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddUserPage()),
            );
            refreshUsers();
          },
        ),*/
    );
  }

  Widget buildList() => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return GestureDetector(
            
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserDetailPage(userAC: user.ac!),
              ));
              refreshUsers();
            },
            child: UserDetailWidget(user: user, index: index),
          );
        },
      );
}
