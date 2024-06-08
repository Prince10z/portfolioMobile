class ConnectInfo {
  String? id;
  String? username;
  String? email;
  String? msg;
  String? sendTime;

  ConnectInfo({this.id, this.username, this.email, this.msg, this.sendTime});

  ConnectInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    msg = json['msg'];
    sendTime = json['sendTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['msg'] = this.msg;
    data['sendTime'] = this.sendTime;
    return data;
  }
}
