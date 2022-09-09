import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/now_playing/presentation/screens/now_playing_screen.dart';
import 'package:test_app/features/popular/presentation/screens/home_screen.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.05,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Movies"),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 28,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                  size: 28,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.black,size: 28,)),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(child: Text("Popular"),),
              Tab(child: Text("Now Playing"),),
            ],),
        ),
        body:  const TabBarView(children: [
          PopularScreen(),
          NowPlaying(),
        ]),

      ),
    );
  }
}
