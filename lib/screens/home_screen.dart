import 'package:animate_do/animate_do.dart';
import 'package:cocktails_app/blocs/bloc/cocktail_bloc.dart';
import 'package:cocktails_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //obtener el tamaño de la pantalla
    return Scaffold(
        // backgroundColor: AppTheme.primary,

        body: SizedBox(
            height: size.height,
            width: size.width,
            // color: Colors.red,
            child: Stack(
              children: [
                const _Circulo(),

                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  // color: Colors.red,
                  width: size.width,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Hello, Baneste',
                          style: GoogleFonts.outfit(
                              fontSize: 20, color: Colors.white),
                        ),
                        const Spacer(),
                        //imagen de perfil
                        GestureDetector(
                          // onTap: ()=>context.go('/details'),
                          child: Hero(
                            tag: 12,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/baneste.jpeg',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: size.height * 0.10,
                  left: size.width * -0.03,
                  child: BounceInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: SizedBox(
                      width: size.width * 0.7,
                      height: size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cocktails',
                            style: GoogleFonts.outfit(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Find your favorite cocktail',
                            style: GoogleFonts.outfit(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //boton
                const _BtnsDificulty(),

                const _Search(),

                Container(
                  margin: EdgeInsets.only(top: size.height * 0.47),
                  // color: Colors.red,
                  width: size.width,
                  height: size.height * 0.5,
                  child: BlocBuilder<CocktailBloc, CocktailState>(
                    builder: (context, state) {
                      if (state is CocktailInitial) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CocktailLoaded) {
                        return ListView.builder(
                          itemCount: state.cocktails.length,
                          itemBuilder: (BuildContext context, int index) {

                            int id = int.parse(state.cocktails[index].id!);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => GoRouter.of(context).go('/details', extra: {
                                  'id': id

                                }),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.grey[200],
                                    width: size.width,
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              width: 120,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: 
                                                    
                                                    Image.network(state
                                                            .cocktails[index]
                                                            .image
                                                            .toString())
                                                        .image,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                // color: Colors.green,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      state.cocktails[index]
                                                          .title
                                                          .toString(),
                                                      style: GoogleFonts.outfit(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppTheme.primary),
                                                    ),
                                                    // Text(
                                                    //     '${state.cocktails[index]
                                                    //         .difficulty}',

                                                    //     style:
                                                    //         GoogleFonts.outfit(
                                                    //             fontSize: 15)),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        //icono de ver mas
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: AppTheme.primary,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('Error'));
                      }
                    },
                  ),
                )
              ],
            )));
  }
}

class _Circulo extends StatelessWidget {
  const _Circulo();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * -0.28,
      left: size.width * -0.4,
      child: Container(
        height: 550,
        width: 550,
        decoration: const BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(550))),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.33,
      left: 0,
      child: SizedBox(
        height: 50,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: GoogleFonts.outfit(
                              fontSize: 20, color: Colors.grey)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BtnsDificulty extends StatelessWidget {
  const _BtnsDificulty();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.4,
      left: size.width * 0.1,
      child: BounceInRight(
        duration: const Duration(milliseconds: 1000),
        child: SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Easy       ',
                  style: GoogleFonts.outfit(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Medium',
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
    );
  }
}
