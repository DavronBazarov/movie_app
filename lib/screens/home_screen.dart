import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:test_app/models/movies_model.dart';
import 'package:test_app/viewmodel/home_view.dart';

import 'description.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imgUrl = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageView>(context).getMovies();
    return Scaffold(
      backgroundColor: Color(0xffC8BCD1),
      appBar: AppBar(

        title: const Text("Movie  App", style: TextStyle(color: Colors.white),),
      ),
      body: Consumer<HomePageView>(builder: (context, data, child) {
        if (data.popularMovies.isNotEmpty) {
          return ListView.builder(
              itemCount: data.popularMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return buildItems(
                  title: data.popularMovies[index].title ?? "...",
                  image: data.popularMovies[index].posterPath,
                  description: data.popularMovies[index].overview,
                  time: data.popularMovies[index].releaseDate,
                  language: data.popularMovies[index].originalLanguage,
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Widget buildItems({String? title, image, description, time, language}) {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Description(
                        title!,
                        image,
                        description,
                      )));
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: const EdgeInsets.only(left: 4, top: 4),
            color: Color(0xff2D5368),
            height: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: 140,
                        height: 180,
                        child: Image.network(
                          "$imgUrl$image",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    SizedBox(
                      width: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Overview > $description!",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: const TextStyle(
                             color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 0,
                              ),
                              Text(time, style: TextStyle(color: Colors.white),),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                color: Colors.black,
                                height: 15,
                                width: 1.5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Lang: ${language.toString().toUpperCase()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                     color: Colors.white),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share, color: Colors.white,
                                  )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
