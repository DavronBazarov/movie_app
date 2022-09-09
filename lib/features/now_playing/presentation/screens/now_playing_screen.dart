import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/now_playing/presentation/bloc/now_bloc.dart';
import 'package:test_app/features/now_playing/presentation/provider/now_play_page_view.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  String imgUrl = "https://image.tmdb.org/t/p/w500/";

  @override
  void initState() {
    super.initState();
    context.read<NowBloc>().add(GetNowPlayingEvent());
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<NowPlayingPageView>(context).getMoviesNow();

    return Scaffold(
backgroundColor: Color(0xffC8BCD1),
      body: BlocBuilder<NowBloc, NowState>(
          builder: (context, state) {
            if (state is NowPlayingLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NowPlayingError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is NowPlayingNowDone){
              return ListView.builder(
                  itemCount: state.moviesNow?.length,
                  itemBuilder: (BuildContext context, int index){
                    return buildItems(
                      title: state.moviesNow?[index].title ?? "...",
                      image: state.moviesNow?[index].posterPath ?? "...",
                      description: state.moviesNow?[index].overview ?? "...",
                      time: state.moviesNow?[index].releaseDate ?? "...",
                      language: state.moviesNow?[index].originalLanguage ?? "..."
                    );
              });
            }
            return Container();
          }),
    );
  }
  Widget buildItems({String? title, image, description, time, language}) {
    return InkWell(
      onTap: () {
        setState(() {

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
