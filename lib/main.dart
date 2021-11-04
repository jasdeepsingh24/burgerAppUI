import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';

void main() =>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int photoIndex=0;
  List<String> photos=[
    // 'https://images.unsplash.com/photo-1501908734255-16579c18c25f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    // 'https://images.unsplash.com/photo-1512509739856-4ffd1007b233?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1079&q=80',
    // 'https://images.unsplash.com/photo-1555964470-0dc867d0a738?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
    // 'https://images.unsplash.com/photo-1560235043-5ca64ce84fdf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
    // 'assets/1.jpg',
    // 'assets/2.jpg',
    // 'assets/3.jpg',
    'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80',
    'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80'


  ];
  AnimationController animController;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController=new AnimationController(vsync: this,duration: Duration(seconds: 18));
    animation=IntTween(begin: 0,end: photos.length-1).animate(animController)..addListener(() {
      setState(() {
        photoIndex=animation.value;
      });

    });
    animController.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animController.dispose();
  }
  void _previousImage(){
    setState(() {
      photoIndex=photoIndex>0?photoIndex-1:0;
    });
  }
  void _nextImage(){
    setState(() {
      photoIndex=photoIndex<photos.length-1?photoIndex+1:photoIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Courossel'),
        //   centerTitle: true,
        // ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // image: AssetImage(photos[photoIndex]),
                          image: NetworkImage(photos[photoIndex]),
                          fit: BoxFit.cover,
                        ),

                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back,color: Colors.white,),
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.pink,
                          onPressed: (){},
                        )
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        height: 210,
                        width: width,
                        color: Colors.transparent,
                      ),
                      onTap: _nextImage,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 210,
                        width: width/2,
                        color: Colors.transparent,
                      ),
                      onTap: _previousImage,
                    ),
                    Positioned(
                      top: 185,
                      left: 5,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star,color: Colors.amber,size: 20,),
                          Icon(Icons.star,color: Colors.amber,size: 20),
                          Icon(Icons.star,color: Colors.amber,size: 20),
                          Icon(Icons.star,color: Colors.amber,size: 20),
                          Icon(Icons.star,color: Colors.grey,size: 20),
                          SizedBox(width: 2,),
                          Text('4.4',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          // SizedBox(width: 4,),
                          // SelectedPhoto(photoIndex: photoIndex,numberOfDots: photos.length,)



                        ],
                      ),
                    ),
                    Positioned(
                      top: 190,

                      child: Container(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SelectedPhoto(photoIndex: photoIndex,numberOfDots: photos.length,)
                          ],
                        ),
                      )
                    )

                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Open Now Until 7pm',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      Text('The Cinnamon Snail',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 27),),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Text('17th st & Union Sq East',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Icon(Icons.location_on),
                          SizedBox(width: 5,),
                          Text('400ft Away',style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.wifi,color: Colors.green,),
                          SizedBox(width: 4,),
                          Text('Location confirmed by 3 users today',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Text('Featured Items',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                
              ],
            )
          ],
        )

      ),
    );

  }


}
class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots,this.photoIndex});

  Widget _inactivePhoto(){
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3,right: 3),
        child: Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _activePhoto(){
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0,
                blurRadius: 2,
              )
            ]
          ),
        ),
      ),
    );
  }

  List<Widget> buildDots(){
    List<Widget> dots=[];
    for(int i=0;i<numberOfDots;++i)
      {
        dots.add(
          i==photoIndex?_activePhoto():_inactivePhoto()
        );


      }
    return dots;
  }
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildDots(),
      ),
    );
  }
}

