import 'package:flutter/material.dart';
import 'package:mybloc/datatabke/data.dart';
import 'package:mybloc/datatabke/dataModle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  DataModel model = DataModel.fromMap(mydata);
  final List dat = mydata["data"];

  List<TableRow> returnData(List<Shift> shift, StaffRoster staffRoster,
      {String identity}) {
    List<TableRow> lt = [];
    var rosterMap = staffRoster.toMap();
    for (var i = 0; i < shift.length; i++) {
      var item = shift[i];
      lt.add(TableRow(children: [
        Text("${item.start[0].hour} - ${item.stop[0].hour}"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...rosterMap[identity]["${i + 1}"].map((e) => Text("$e")).toList()
          ],
        ),
      ]));
    }
    return lt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListView.builder(
                  itemCount: model.data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var content = model.data[index];

                    return Table(
                      border: TableBorder.all(),
                      columnWidths: {0: FractionColumnWidth(.2)},
                      children: [
                        ...content.openingDays.map(
                          (e) {
                            return TableRow(children: [
                              Text("$e"),
                              Table(
                                border: TableBorder.all(),
                                children: [
                                  ...returnData(
                                      content.shifts, content.staffRoster,
                                      identity: e)
                                ],
                              ),
                            ]);
                          },
                        ).toList()
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
