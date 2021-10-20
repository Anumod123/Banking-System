final String tableTransfer = 'Transfers';

class TransferFields {
  static final List<String> values = [
    id,
    senderac,
    sendername,
    receiverac,
    recievername,
    money,
  ];
  static final String id = '_id';
  static final String senderac = 'Sender_Acc';
  static final String sendername = 'Sender_Name';
  static final String receiverac = 'Receiver_Acc';
  static final String recievername = 'Receiver_Name';
  static final String money = 'Amount';
}

class Transfer {
  final int? id;
  final int? senderac;
  final String sendername;
  final int? receiverac;
  final String receivername;
  final double money;

  const Transfer({
    this.id,
    required this.senderac,
    required this.sendername,
    required this.receiverac,
    required this.receivername,
    required this.money,
  });

  Transfer copy(
          {int? id,
          int? senderac,
          String? sendername,
          int? receiverac,
          String? receivername,
          double? money}) =>
      Transfer(
          id: id ?? this.id,
          senderac: senderac ?? this.senderac,
          sendername: sendername ?? this.sendername,
          receiverac: receiverac ?? this.receiverac,
          receivername: receivername ?? this.receivername,
          money: money ?? this.money);

  static Transfer fromJson(Map<String, Object?> json) => Transfer(
        id: json[TransferFields.id] as int?,
        senderac: json[TransferFields.senderac] as int,
        sendername: json[TransferFields.sendername] as String,
        receiverac: json[TransferFields.receiverac] as int,
        receivername: json[TransferFields.recievername] as String,
        money: json[TransferFields.money] as double,
      );
  Map<String, Object?> toJson() => {
        TransferFields.id: id,
        TransferFields.senderac: senderac,
        TransferFields.sendername: sendername,
        TransferFields.receiverac: receiverac,
        TransferFields.recievername: receivername,
        TransferFields.money: money,
      };
}