import 'package:flutter/material.dart';
import 'package:untitled/model/note.dart';

class UserDetailWidget extends StatelessWidget {
  UserDetailWidget({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = Colors.greenAccent;

    return Card(
      color: Colors.teal[700],
      child: ListTile(
        title: Text(
          user.name,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.teal[900],
          backgroundImage: NetworkImage('https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png'),
        ),
        trailing: Icon(
          Icons.arrow_forward          
        ),
        subtitle: Text( "Account no:" + user.ac.toString() +" " + "Current Balance: Rs." + user.balance.toString(),
        style: TextStyle(
              color: Colors.white, fontSize: 15)
              
        ),
        
        //isThreeLine: true,
      ),
      // color: Colors.teal[300],
      // child: Container(

      //   constraints: BoxConstraints(minHeight: 30),
      //   padding: EdgeInsets.all(8),
      //   child: Column(
      //     children: [
      //       Text(
      //         user.name,
      //         style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(height: 10),
      //       Text(
      //         "Account no:" + user.ac.toString(),
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       Text(
      //         "Current Balance: Rs." + user.balance.toString(),
      //         style: TextStyle(color: Colors.white, fontSize: 15),
      //       )
      //     ],
      //   ),
      // )
    );
  }
}
