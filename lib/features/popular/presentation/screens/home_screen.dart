import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/popular/presentation/bloc/popular_bloc.dart';

import '../provider/home_view.dart';
import 'description.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  String imgUrl = "https://image.tmdb.org/t/p/w500/";


@override
  void initState() {
    super.initState();
    context.read<PopularBloc>().add(GetPopularMoviesEvent());
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageView>(context).getMovies();

    return Scaffold(
      backgroundColor: const Color(0xffC8BCD1),

      body: BlocBuilder<PopularBloc, PopularState>(
        builder: (context, state) {
          if (state is PopularLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PopularMoviesError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is PopularDone) {
            return ListView.builder(
                itemCount: state.movies?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return buildItems(
                    title: state.movies?[index].title ?? "...",
                    image: state.movies?[index].posterPath,
                    description: state.movies?[index].overview,
                    time: state.movies?[index].releaseDate,
                    language: state.movies?[index].originalLanguage,
                  );
                });
          }
          return Container();
        },
      ),
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
                        imgUrl,
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
            color: const Color(0xff2D5368),
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
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
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
                              Text(
                                time,
                                style: TextStyle(color: Colors.white),
                              ),
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
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.white,
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
