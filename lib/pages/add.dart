import 'package:flutter/material.dart';
import 'package:untitled/data/database.dart';
import 'package:untitled/model/note.dart';

class AddUserPage extends StatefulWidget {
  final User? user;

  const AddUserPage({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  late int ac;
  late String name;
  late String email;
  late double balance;
  late String number;
  @override
  void initState() {
    super.initState();
    ac = widget.user?.ac ?? 0;
    name = widget.user?.name ?? '';
    email = widget.user?.email ?? '';
    balance = widget.user?.balance ?? 0;
    number = widget.user?.number ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
      );
  Widget buildButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
        ),
        onPressed: addUsers,
        child: Text('Save'),
      ),
    );
  }

  void addUsers() async {
    // ac = widget.user?.ac ?? 101;
    // name = widget.user?.name ?? 'Anumod';
    // email = widget.user?.email ?? 'anumod223@gmail.com';
    // balance = widget.user?.balance ?? 50000.00;
    // number = widget.user?.number ?? '8495517845';
    // await addUser();
    // ac = widget.user?.ac ?? 102;
    // name = widget.user?.name ?? 'Justin';
    // email = widget.user?.email ?? 'justin125@gmail.com';
    // balance = widget.user?.balance ?? 60000.00;
    // number = widget.user?.number ?? '9345623478';
    // await addUser();
    // ac = widget.user?.ac ?? 103;
    // name = widget.user?.name ?? 'Harsha';
    // email = widget.user?.email ?? 'Harsha125@gmail.com';
    // balance = widget.user?.balance ?? 80000.00;
    // number = widget.user?.number ?? '9234156789';
    // await addUser();
    // ac = widget.user?.ac ?? 104;
    // name = widget.user?.name ?? 'Anu';
    // email = widget.user?.email ?? 'Anu124@gmail.com';
    // balance = widget.user?.balance ?? 9000.00;
    // number = widget.user?.number ?? '9754678458';
    // await addUser();
    // ac = widget.user?.ac ?? 105;
    // name = widget.user?.name ?? 'Adith';
    // email = widget.user?.email ?? 'Adith145@gmail.com';
    // balance = widget.user?.balance ?? 50000.00;
    // number = widget.user?.number ?? '7986588251';
    // await addUser();
    // ac = widget.user?.ac ?? 106;
    // name = widget.user?.name ?? 'Abhinav';
    // email = widget.user?.email ?? 'abhinav215@gmail.com';
    // balance = widget.user?.balance ?? 5000.00;
    // number = widget.user?.number ?? '8759664512';
    // await addUser();
    // ac = widget.user?.ac ?? 107;
    // name = widget.user?.name ?? 'george';
    // email = widget.user?.email ?? 'george429@gmail.com';
    // balance = widget.user?.balance ?? 130000.00;
    // number = widget.user?.number ?? '9758124415';
    // await addUser();
    // ac = widget.user?.ac ?? 108;
    // name = widget.user?.name ?? 'Kris';
    // email = widget.user?.email ?? 'kris425@gmail.com';
    // balance = widget.user?.balance ?? 12000.00;
    // number = widget.user?.number ?? '9755684215';
    // await addUser();
    // ac = widget.user?.ac ?? 109;
    // name = widget.user?.name ?? 'Monica';
    // email = widget.user?.email ?? 'Monica453@gmail.com';
    // balance = widget.user?.balance ?? 90000.00;
    // number = widget.user?.number ?? '8756698564';
    // await addUser();
    // ac = widget.user?.ac ?? 110;
    // name = widget.user?.name ?? 'Subaru';
    // email = widget.user?.email ?? 'Subaru523@gmail.com';
    // balance = widget.user?.balance ?? 200000.00;
    // number = widget.user?.number ?? '8679588634';
    // await addUser();
    Navigator.of(context).pop();
  }

  Future addUser() async {
    final user = User(
      name: name,
      email: email,
      balance: balance,
      number: number,
    );
    await BankDatabase.instance.createUser(user);
  }
}