import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskwithprovider/data/data.dart';
import 'package:taskwithprovider/provider/dataprovider.dart';

class Scrolltile extends StatelessWidget {
  final double height;
  final DataProvider dataProvider;
  final int i;
  const Scrolltile({Key key, this.height, this.dataProvider, this.i}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => dataProvider.list[i],
      builder: (context, child) {
        return Container(
                height: height * 0.19,
                width: height * 0.18,
                alignment: Alignment.center,
                child: Consumer<Data>(
                  builder: (context, value, child) {
                    return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          value.select();
                          print(value);
                        },
                          child: Icon(
                        Icons.add_circle_outline,
                        size: height * 0.1,
                        color: value.selected ? Colors.red : Colors.black,
                      )),
                      Text(
                        value.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.02,
                          color: value.selected ? Colors.red : Colors.black,
                        ),
                      ),
                      Text(
                        value.subTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: height * 0.02,
                          color: value.selected ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  );
                  },
                ),
              );
      },
    );
  }
}
