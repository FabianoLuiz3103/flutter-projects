import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/top_rated/widgets/top_rated_movie.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/progress.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  ApiServices apiServices = ApiServices();
  Future<List<Movie>>? movies;

  @override
  void initState() {
    movies = apiServices.getMoviesAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: FutureBuilder<List<Movie>>(
          future: movies!,
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
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return TopRatedMovie(movie: snapshot.data![index]);
                },
              );
            }
          }),
    );
  }
}
