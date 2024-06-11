class BankCard {
  String? holderName;
  String? bankName;
  int? number;
  String? expireDate;
  int? cvv;
  String? id;

  BankCard(
      {this.holderName,
        this.bankName,
        this.number,
        this.expireDate,
        this.cvv,
        this.id});

  BankCard.fromJson(Map<String, dynamic> json) {
    holderName = json['holderName'];
    bankName = json['bankName'];
    number = json['number'];
    expireDate = json['expireDate'];
    cvv = json['cvv'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holderName'] = this.holderName;
    data['bankName'] = this.bankName;
    data['number'] = this.number;
    data['expireDate'] = this.expireDate;
    data['cvv'] = this.cvv;
    data['id'] = this.id;
    return data;
  }
}