import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskwithprovider/data/data.dart';
import 'package:taskwithprovider/provider/dataprovider.dart';

class Bottomlist extends StatelessWidget {
  final double height;
  final DataProvider dataProvider;
  final int i;
  const Bottomlist({Key key, this.dataProvider, this.height, this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>.value(
      value: dataProvider.list[i],
      builder: (context, child) {
        return Consumer<Data>(
          builder: (context, value, child) {
            return value.selected
                ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                    height: height * 0.15,
                    width: height * 0.4,
                    alignment: Alignment.center,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: height * 0.4,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(value.title, style: TextStyle(
                              fontSize: height * 0.03
                            ),),
                            Text(value.subTitle, style: TextStyle(
                              fontSize: height * 0.02
                            ),),
                          ],
                        ),
                      ),
                      elevation: 4,
                      color: Colors.white,
                      ),
                  )
                : Container();
          },
        );
      },
    );
  }
}
