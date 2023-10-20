class Transaction {
  String id;
  String name;
  String description;
  String amount;
  String currency;
  DateTime date;
  String type;
  String category;
  String senderAccount;
  String receiverAccount;
  String status;
  String createdAt;
  String? updatedAt;
  String? deletedAt;

  Transaction({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.currency,
    required this.date,
    required this.type,
    required this.category,
    required this.senderAccount,
    required this.receiverAccount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      amount: json['amount'],
      currency: json['currency'],
      date: DateTime.parse(json['date']),
      type: json['type'],
      category: json['category'],
      senderAccount: json['senderAccount'],
      receiverAccount: json['receiverAccount'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
      'currency': currency,
      'date': date.toIso8601String(),
      'type': type,
      'category': category,
      'senderAccount': senderAccount,
      'receiverAccount': receiverAccount,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}
