import "package:flutter/material.dart";
import "package:mobile_portfolio_check/controllers/gettingdata.dart";
import "package:mobile_portfolio_check/methods/methods.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.green,
          title: Text(
            "Requests",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          )),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.green,
            ))
          : FutureBuilder(
              future: GettingAltering.gettingdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error.hashCode);
                  return Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red),
                      child: Text(
                        "Error: ${snapshot.error.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: datainfo.length,
                    itemBuilder: (context, index) => costumeItem(
                          id: datainfo[index].id!,
                          name: datainfo[index].username!,
                          email: datainfo[index].email!,
                          Time: datainfo[index].sendTime!,
                        ));
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        child: Icon(Icons.restart_alt),
      ),
    );
  }

  Widget costumeItem(
      {required String id,
      required String name,
      required String email,
      required String Time}) {
    Map<String, String> datatime = LocalFunc.convertTime(Time);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${name}",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Email:  ${email}",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Date: ${datatime['date']}",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Time: ${datatime['time']}",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        IconButton(
            onPressed: () async {
              setState(() {});
              print(">>>>>>>>>>>>>${id}");
              bool isdeleted =
                  await GettingAltering.deleteItemdata(id, context);
              setState(() {});
            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mail_outline,
              color: Colors.white,
            ))
      ]),
    );
  }
}
