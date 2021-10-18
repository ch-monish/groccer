import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                const IconData(59483,
                    fontFamily: 'MaterialIcons', matchTextDirection: true),
                size: 35,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://merodesk.com/wp-content/uploads/2021/05/user-4.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print("change photo");
                        },
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Naomi A.Schultz",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("410-422-9171"),
                        Text("NaomiASchutz@google.com"),
                      ],
                    ),
                    // SizedBox(width: MediaQuery.of(context).size.width * 0.8),
                    Container(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit,
                              color: Colors.black38, size: 28)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          // width: MediaQuery.of(context).size.width * 0.99,
                          // color: Colors.red,
                          child: Text("Change Password",
                              style: TextStyle(fontSize: 24))),
                      Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.vpn_key_rounded,
                                color: Colors.black38, size: 28)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          // width: MediaQuery.of(context).size.width * 0.99,
                          // color: Colors.red,
                          child:
                              Text("Logout", style: TextStyle(fontSize: 24))),
                      Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.logout_sharp,
                                color: Colors.black38, size: 28)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
