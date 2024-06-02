import 'package:futebol_app/models/campeonato.dart';
import 'package:futebol_app/models/pais.dart';
import 'package:futebol_app/models/time.dart';


   List<Pais> paises = [
    Pais(nome: "BRASIL", campeonato: campeonatosBrasil, foto: "images/brasil.png"),
    Pais(nome: "INGLATERRA", campeonato: campeonatosInglaterra, foto: "images/inglaterra.png"),
    Pais(nome: "FRANÇA", campeonato: campeonatosFranca, foto: "images/franca.png"),
    Pais(nome: "PORTUGAL", campeonato: campeonatosPortgual, foto: "images/portugal.png"),
    Pais(nome: "ESPANHA", campeonato: campeonatosEspanha, foto: "images/espanha.png"),

  ];

 List<Time> times = [];

   List<Time> timesSerieA = [
    Time(nome: "Flamengo", torcedores: 40e6, titulos: 36, fundacao: 1895,foto: "images/flamengo.png", favorito: false),
    Time(nome: "São Paulo", torcedores: 17e6, titulos: 30, fundacao: 1930, foto: "images/spfc.png", favorito: false),
    Time(nome: "Palmeiras", torcedores: 17e6, titulos: 26, fundacao: 1914, foto: "images/palmeiras.png", favorito: false),
    Time(nome: "Corinthians", torcedores: 27e6, titulos: 30, fundacao: 1910, foto: "images/corinthians.png", favorito: false),
    Time(nome: "Grêmio", torcedores: 8e6, titulos: 10, fundacao: 1903, foto:"images/gremio.png", favorito: false),
    Time(nome: "Internacional", torcedores: 7e6, titulos: 12, fundacao: 1909, foto:"images/internacional.png", favorito: false),
    Time(nome: "Cruzeiro", torcedores: 8e6, titulos: 18, fundacao: 1921, foto: "images/cruzeiro.png", favorito: false),
    Time(nome: "Fluminense", torcedores: 4e6, titulos: 9, fundacao: 1902, foto:"images/fluminense.png", favorito: false),
    Time(nome: "Atlético Mineiro", torcedores: 8e6, titulos: 13, fundacao: 1908, foto:"images/cam.png", favorito: false),
    Time(nome: "Santos", torcedores: 4e6, titulos: 24, fundacao: 1912, foto:"images/santos.png", favorito: false),
    Time(nome: "Athletico Paranaense", torcedores: 2e6, titulos: 9, fundacao: 1924, foto:"images/cap.png", favorito: false),
    Time(nome: "Botafogo", torcedores: 4e6, titulos: 7, fundacao: 1904, foto:"", favorito: false),
    Time(nome: "Bahia", torcedores: 3e6, titulos: 3, fundacao: 1931, foto:"", favorito: false),
    Time(nome: "Coritiba", torcedores: 2e6, titulos: 11, fundacao: 1909, foto:"", favorito: false),
    Time(nome: "Fortaleza", torcedores: 3e6, titulos: 10, fundacao: 1912, foto:"", favorito: false),
    Time(nome: "Ceará", torcedores: 2e6, titulos: 5, fundacao: 1914, foto:"", favorito: false),
  ];

   List<Time> timesSerieB = [
    Time(nome: "Vitória", torcedores: 3.5e6, titulos: 7, fundacao: 1899, foto: "", favorito: false),
    Time(nome: "Ponte Preta", torcedores: 2.5e6, titulos: 5, fundacao: 1900, foto: "", favorito: false),
    Time(nome: "Avaí", torcedores: 1.8e6, titulos: 3, fundacao: 1923, foto: "", favorito: false),
    Time(nome: "Paraná", torcedores: 1.2e6, titulos: 2, fundacao: 1914, foto: "", favorito: false),
    Time(nome: "Figueirense", torcedores: 1.5e6, titulos: 4, fundacao: 1921, foto: "", favorito: false),
    Time(nome: "CSA", torcedores: 1.1e6, titulos: 1, fundacao: 1913, foto: "", favorito: false),
    Time(nome: "Cuiabá", torcedores: 900000, titulos: 0, fundacao: 1938, foto: "", favorito: false),
    Time(nome: "Remo", torcedores: 800000, titulos: 2, fundacao: 1914, foto: "", favorito: false),
    Time(nome: "Guarani", torcedores: 1.3e6, titulos: 3, fundacao: 1911, foto: "", favorito: false),
    Time(nome: "Chapecoense", torcedores: 1.6e6, titulos: 2, fundacao: 1973, foto: "", favorito: false),
    Time(nome: "CRB", torcedores: 850000, titulos: 1, fundacao: 1912, foto: "", favorito: false),
    Time(nome: "Brasil de Pelotas", torcedores: 750000, titulos: 0, fundacao: 1911, foto: "", favorito: false),
    Time(nome: "Sampaio Corrêa", torcedores: 700000, titulos: 1, fundacao: 1923, foto: "", favorito: false),
    Time(nome: "Operário", torcedores: 600000, titulos: 0, fundacao: 1912, foto: "", favorito: false),
    Time(nome: "Confiança", torcedores: 500000, titulos: 0, fundacao: 1936, foto: "", favorito: false),
    Time(nome: "Vila Nova", torcedores: 850000, titulos: 1, fundacao: 1943, foto: "", favorito: false),
  ];

  List<Time> timesPremierLeague = [
    Time(nome: "Manchester United", torcedores: 75e6, titulos: 20, fundacao: 1878, foto: "images/manutd.png", favorito: false),
    Time(nome: "Liverpool", torcedores: 70e6, titulos: 19, fundacao: 1892, foto: "images/liverpool.png", favorito: false),
    Time(nome: "Arsenal", torcedores: 60e6, titulos: 13, fundacao: 1886, foto: "images/arsenal.png", favorito: false),
    Time(nome: "Chelsea", torcedores: 50e6, titulos: 6, fundacao: 1905, foto: "images/chelsea.png", favorito: false),
    Time(nome: "Manchester City", torcedores: 40e6, titulos: 6, fundacao: 1880, foto: "images/mancity.png", favorito: false),
    Time(nome: "Tottenham Hotspur", torcedores: 35e6, titulos: 2, fundacao: 1882, foto: "images/tottenham.png", favorito: false),
    Time(nome: "Leeds United", torcedores: 10e6, titulos: 3, fundacao: 1919, foto: "images/leeds.png", favorito: false),
    Time(nome: "Everton", torcedores: 15e6, titulos: 9, fundacao: 1878, foto: "images/everton.png", favorito: false),
    Time(nome: "Newcastle United", torcedores: 10e6, titulos: 4, fundacao: 1892, foto: "images/newcastle.png", favorito: false),
    Time(nome: "Leicester City", torcedores: 10e6, titulos: 1, fundacao: 1884, foto: "images/leicester.png", favorito: false),
    Time(nome: "West Ham United", torcedores: 8e6, titulos: 0, fundacao: 1895, foto: "images/westham.png", favorito: false),
    Time(nome: "Aston Villa", torcedores: 8e6, titulos: 7, fundacao: 1874, foto: "images/villa.png", favorito: false),
    Time(nome: "Wolverhampton Wanderers", torcedores: 6e6, titulos: 3, fundacao: 1877, foto: "images/wolves.png", favorito: false),
    Time(nome: "Southampton", torcedores: 5e6, titulos: 0, fundacao: 1885, foto: "images/southampton.png", favorito: false),
    Time(nome: "Crystal Palace", torcedores: 5e6, titulos: 0, fundacao: 1905, foto: "images/palace.png", favorito: false),
    Time(nome: "Fulham", torcedores: 3e6, titulos: 0, fundacao: 1879, foto: "images/fulham.png", favorito: false),
    Time(nome: "Burnley", torcedores: 3e6, titulos: 2, fundacao: 1882, foto: "images/burnley.png", favorito: false),
    Time(nome: "Brighton & Hove Albion", torcedores: 2e6, titulos: 0, fundacao: 1901, foto: "images/brighton.png", favorito: false),
    Time(nome: "Watford", torcedores: 2e6, titulos: 0, fundacao: 1881, foto: "images/watford.png", favorito: false),
    Time(nome: "Brentford", torcedores: 1e6, titulos: 0, fundacao: 1889, foto: "images/brentford.png", favorito: false),
  ];



  List<Campeonato> campeonatosBrasil = [
    Campeonato(nome: "BRASILEIRÃO SÉRIE A", times: timesSerieA, foto: "images/brA.png"),
    Campeonato(nome: "BRASILEIRÃO SÉRIE B", times: timesSerieB, foto: "images/brB.png",),
  ];

  List<Campeonato> campeonatosInglaterra = [
    Campeonato(nome: "PREMIER LEAGUE", times: timesPremierLeague, foto: "images/premier.png"),
    Campeonato(nome: "EFL CHAMPIONSHIP", times: times, foto: "images/EFL.png"),
  ];

   List<Campeonato> campeonatosFranca = [
    Campeonato(nome: "LIGUE 1", times: times, foto: ""),
    Campeonato(nome: "LIGUE 2", times: times, foto: ""),
  ];

   List<Campeonato> campeonatosPortgual = [
    Campeonato(nome: "LIGA PORTUGAL", times: times, foto: ""),
    Campeonato(nome: "LIGA PORTUGAL 2", times: times, foto: ""),
  ];

   List<Campeonato> campeonatosEspanha = [
    Campeonato(nome: "LA LIGA", times: times, foto: ""),
    Campeonato(nome: "LA LIGA 2", times: times, foto: ""),
  ];
   