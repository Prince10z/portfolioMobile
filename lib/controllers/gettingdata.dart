import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:mobile_portfolio_check/constvairable/constvar.dart";
import "package:mobile_portfolio_check/models/usersModel.dart";

List<ConnectInfo> datainfo = [];
bool isloading = false;

class GettingAltering {
  static Future<void> gettingdata() async {
    var url = Uri.parse('${URL}resume/read');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      // Map the JSON data to ConnectInfo objects and add to datainfo
      datainfo = data.map((item) => ConnectInfo.fromJson(item)).toList();

      return;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<bool> deleteItemdata(String id, BuildContext context) async {
    isloading = true;
    var url = Uri.parse('${URL}resume/delete');
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request('DELETE', url);
    request.bodyFields = {'id': '${id}'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Success",
            style: TextStyle(color: Colors.white),
          )));
      isloading = false;
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Error",
            style: TextStyle(color: Colors.white),
          )));
      print(response.reasonPhrase);
      isloading = false;
      return false;
    }
  }
}
