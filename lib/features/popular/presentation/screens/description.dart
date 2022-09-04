import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  String title;
  String image;
  String imgUrl;
  String description;
  Description(this.title, this.image,this.imgUrl, this.description, {Key? key}) : super(key: key);
  // String imgUrl = "https://image.tmdb.org/t/p/w500";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScrollView(
      physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          onStretchTrigger: () {
            // Function callback for stretch
            return Future<void>.value();
          },
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
            ],
            centerTitle: true,
            title:  Text(title, style: TextStyle(fontSize: 14, color: Colors.white),),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                 "$image",
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, 0.5),
                      end: Alignment.center,
                      colors: <Color>[
                        Color(0x60000000),
                        Color(0x00000000),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ListTile(
                title: Text(description, style: TextStyle(fontSize: 18),),
              ),
              // ListTiles++
            ],
          ),
        ),
      ],
    ),);
  }


}
