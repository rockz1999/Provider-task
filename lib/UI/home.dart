import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskwithprovider/UI/bottomlist.dart';
import 'package:taskwithprovider/UI/scrollcontainer.dart';
import 'package:taskwithprovider/provider/dataprovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
            ),
            Container(
                height: height * 0.1,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: "Enter anything",
                  ),
                )),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.2,
              margin: const EdgeInsets.only(left: 40),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Consumer<DataProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      
                      scrollDirection: Axis.horizontal,
                      addAutomaticKeepAlives: true,
                      itemCount: value.list.length,
                      itemBuilder: (context, index) {
                        return Scrolltile(
                            height: height, dataProvider: value, i: index);
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
                alignment: Alignment.center,
                height: height * 0.08,
                child: Consumer<DataProvider>(
                  builder: (context, value, child) {
                    return RaisedButton(
                      elevation: 3,
                      color: Colors.white,
                      onPressed: () {
                        value.selectall();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Select all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.03),
                        ),
                      ),
                    );
                  },
                )),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.4,
              child: Consumer<DataProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.list.length,
                    itemBuilder: (context, index) {
                      return Bottomlist(height: height, dataProvider: value, i : index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
