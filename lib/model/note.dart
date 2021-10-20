

final String tabledata = 'data';

class UserFields {
  static final List<String> values = [ac, name, email, balance, number];
  static final String ac = '_Acc_No';
  static final String name = 'Name';
  static final String email = 'Email';
  static final String balance = 'Current_Balance';
  static final String number = 'Ph_Number';
}

class User {
  final int? ac;
  final String name;
  final String email;
  final double balance;
  final String number;

  const User({
    this.ac,
    required this.name,
    required this.email,
    required this.balance,
    required this.number,
  });

User copy({
    int? ac,
    String? name,
    String? email,
    double? balance,
    String? number,
  }) =>
      User(
        ac: ac ?? this.ac,
        name: name ?? this.name,
        email: email ?? this.email,
        balance: balance ?? this.balance,
        number: number ?? this.number,
      );

static User fromJson(Map<String, Object?> json) => User(
      ac: json[UserFields.ac] as int?,
      name: json[UserFields.name] as String,
      email: json[UserFields.email] as String,
      balance: json[UserFields.balance] as double,
      number: json[UserFields.number] as String,
    );

Map<String, Object?> toJson() => {
        UserFields.ac: ac,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.balance: balance,
        UserFields.number: number
      };
}
