import 'package:flutter/material.dart';

class _TitleSection extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _TitleSectionState();
  }
}
class _TitleSectionState extends State<_TitleSection>{
  void inc()=>setState((){
    ++i;
  });
  Widget f(int i) {
    var c = Row(children: [
      Expanded(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Lake Campground",
              textScaleFactor: 2.0,
            ),
            Text(
              'switzerland',
              style: TextStyle(color: Colors.grey),
              textScaleFactor: 1.3,
            ),
          ])),
      IconButton(icon: Icon(Icons.star,  color: Colors.red,), onPressed: inc),
      SizedBox(
        child: Text('$i'),
        width: 40,
      ),
    ]);
    return c;
  }
  @override
  Widget build(BuildContext context) {
    return f(i);

  }
  int i;
  @override
  void initState() {
    super.initState();
    i=1;
  }
}


class Ca extends StatelessWidget {
  Ca({Key key}) : super(key: key);

  static List<Widget> getCol(List<IconData> icons, List<String> titles) {
    var g = List.generate(icons.length, (i) => i++);
    // print(g);
    var cols = g.map((i) {
      var col = Expanded(
          child: Column(
        children: [
          Icon(
            icons[i],
            color: Colors.blue,
          ),
          Text(
            titles[i],
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ));
      return col;
    });
    var _cols = cols.toList();
    print(_cols);
    return _cols;
  }


  // final _titleSection = getTitleSection();

  static Row getToolbar() {
    final t = Row(
        children: getCol([Icons.call, Icons.navigation_rounded, Icons.share],
            ['call', 'nagivation', 'share']));
    return t;
  }

  final pic = Image.asset('images/lake.jpg', fit: BoxFit.cover, height: 350,);
  final toolbar = getToolbar();
  final myPadding = Padding(padding: EdgeInsets.all(8.0));

  @override
  Widget build(BuildContext context) {
    var bar = AppBar(
      title: Text('sample layout'),
    );
    var body = ListView(
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 2.0),
      children: [
        pic,
        myPadding,
        // _titleSection,
        _TitleSection(),
        myPadding,
        Center(
          child: toolbar,
        ),
        myPadding,
        textSection,
      ],
    );
    return MaterialApp(
      title: 'sample',
      home: Scaffold(
        appBar: bar,
        body: body,
      ),
    );
  }
}


final textSection = Container(
  padding: const EdgeInsets.all(15),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
