import 'package:animate_do/animate_do.dart';
import 'package:cocktails_app/blocs/detailsCocktail/details_cocktail_bloc.dart';
import 'package:cocktails_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCocktailScreen extends StatelessWidget {
  final int id;

  const DetailsCocktailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //inicializamos el bloc DetailsCocktailBloc
    final detailsCocktailBloc = BlocProvider.of<DetailsCocktailBloc>(context);

    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<DetailsCocktailBloc, DetailsCocktailState>(
          bloc: detailsCocktailBloc,
          builder: (context, state) {
            if (state is DetailsCocktailInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CocktailDetailsLoaded) {
              return Stack(
                children: [
                  Positioned(
                    top: size.height * -0.28,
                    left: size.width * -0.5,
                    child: Container(
                      height: 550,
                      width: 550,
                      decoration: const BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(550))),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.02,
                    // left: size.width * 0,
                    child: BounceInLeft(
                      duration: const Duration(milliseconds: 1000),
                      child: SizedBox(
                        width: size.width * 0.7,
                        height: size.height * 0.15,
                        child: Row(
                          children: [
                            //iconos de atras
                            IconButton(
                              onPressed: () {
                                GoRouter.of(context).go('/home');
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.cocktailDetails.title.toString(),
                                style: GoogleFonts.outfit(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.1),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              SizedBox(
                                width: size.width,
                                height: size.height * 0.5,
                                // color: Colors.red,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: size.width * 0.8,
                                        height: size.height * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: Image.network(state
                                                      .cocktailDetails.image
                                                      .toString())
                                                  .image,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 25,
                                      left: size.width * 0.75,
                                      child: BounceInRight(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                  //pponemos un degradado
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        AppTheme.primary,
                                                        Color.fromARGB(
                                                            255, 226, 178, 102),
                                                      ],
                                                          begin: Alignment
                                                              .bottomLeft,
                                                          end: Alignment
                                                              .topRight),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Center(
                                                child: Text(
                                                  'Difficulty: \n${state.cocktailDetails.difficulty.toString()}',
                                                  style: GoogleFonts.outfit(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.green,
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    children: [
                                      Text('Portion:',
                                          style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            color: Colors.black87,
                                          )),
                                      Container(
                                        alignment: Alignment.center,
                                        width: size.width * 0.7,
                                        margin: const EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppTheme.primary),
                                        child: Text(
                                            state.cocktailDetails.portion
                                                .toString(),
                                            style: GoogleFonts.outfit(
                                              fontSize: 15,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                // color: Colors.green,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                      'Time: ${state.cocktailDetails.time.toString()}',
                                      style: GoogleFonts.outfit(
                                        fontSize: 17,
                                        color: Colors.black87,
                                      )),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                // color: Colors.green,
                                alignment: Alignment.centerLeft,

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                    "Description: \n${state.cocktailDetails.description.toString()}",
                                    style: GoogleFonts.outfit(
                                      fontSize: 17,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ExpansionTile(
                                    title: Text(
                                      'Ingredients',
                                      style: GoogleFonts.outfit(
                                        fontSize: 17,
                                        color: AppTheme.primary,
                                      ),
                                    ),
                                    children: state.cocktailDetails.ingredients!
                                        .map(
                                          (ingredient) => Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, bottom: 5),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.circle,
                                                  color: AppTheme.primary,
                                                  size: 10,
                                                ),
                                                const SizedBox(width: 5),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 3),
                                                  // color: Colors.red,
                                                  width: size.width * 0.8,
                                                  child: Text(
                                                    state.cocktailDetails
                                                            .ingredients![
                                                        state.cocktailDetails
                                                            .ingredients!
                                                            .indexOf(
                                                                ingredient)],
                                                    style: GoogleFonts.outfit(
                                                      fontSize: 15,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList()),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ExpansionTile(
                                    title: Text(
                                      'Method',
                                      style: GoogleFonts.outfit(
                                        fontSize: 15,
                                        color: AppTheme.primary,
                                      ),
                                    ),
                                    children: state.cocktailDetails.method!
                                        .map(
                                          (method) => Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, bottom: 5),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.circle,
                                                  color: AppTheme.primary,
                                                  size: 10,
                                                ),
                                                const SizedBox(width: 5),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 3),
                                                  // color: Colors.red,
                                                  width: size.width * 0.8,

                                                  child: Text(
                                                    state.cocktailDetails
                                                            .method![
                                                        state.cocktailDetails
                                                            .method!
                                                            .indexOf(method)],
                                                    style: GoogleFonts.outfit(
                                                      fontSize: 15,
                                                      color: Colors.black87,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList()),
                              ),
                              const SizedBox(height: 50),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Error'));
            }
          }),
    ));
  }
}

class Method {
  String name;
  String description;

  Method({required this.name, required this.description});
}
