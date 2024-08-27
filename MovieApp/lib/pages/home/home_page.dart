import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/widgets/movies_horizontal_list.dart';
import 'package:movie_app/pages/home/widgets/nowplaying_list.dart';
import 'package:movie_app/services/api_services.dart';

import '../../widgets/progress.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiServices apiServices = ApiServices();
  Future<List<Movie>>? nowPlayingMovies;

  @override
  void initState() {
    nowPlayingMovies = apiServices.getMoviesAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: FutureBuilder<List<Movie>>(
          future: nowPlayingMovies!,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconCircularProgressIndicator(
                      icon: Icons.movie,
                      size: 40.0,
                      color: Colors.blue,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Aguardando dados...")
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar os itens'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Nenhum item encontrado'),
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          'Now Playing',
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      NowPlayingList(movies: snapshot.data!),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      MoviesHorizontalList(
                        movies: snapshot.data!,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          'Upcoming',
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      MoviesHorizontalList(
                        movies: snapshot.data!,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
