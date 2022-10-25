import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/models/clother_list.dart';
import 'package:flutter_1_exam/models/clothes_sale.dart';
import 'package:flutter_1_exam/screens/favourite_page.dart';
import 'package:flutter_1_exam/screens/profile_page.dart';
import 'package:flutter_1_exam/screens/search_page.dart';
import 'package:google_fonts/google_fonts.dart';

// --   Bu pageda Listview.builder umuman ishlamayapti

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.clothes});
  List<ClothesModel> clothes;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/banner.png'),
                ),
                SizedBox(height: 18),
                Text(
                  'The Latest And Greatest',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: ClothesModel.clothes.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        ClothesModel.clothes[index].img),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              ClothesModel.clothes[index].name,
                              style: GoogleFonts.openSans(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              ClothesModel.clothes[index].type,
                              style: GoogleFonts.openSans(fontSize: 10),
                            ),
                            SizedBox(height: 6),
                            Text('\$ ${ClothesModel.clothes[index].price}'),
                          ],
                        ),
                      );
                      ;
                    },
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: ClothesSale.clothes.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        width: 180,
                        height: 200,
                        child: Row(
                          children: [
                            Image.asset(ClothesSale.clothes[index].img),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 160,
                                  child: Text(
                                    ClothesSale.clothes[index].name,
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  ClothesSale.clothes[index].discount,
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  ClothesSale.clothes[index].price,
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Colour',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget ClothesWidget(ClothesModel clothesModel) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 140,
  //           height: 140,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             image: DecorationImage(
  //                 image: AssetImage(clothesModel.img), fit: BoxFit.contain),
  //           ),
  //         ),
  //         Text(
  //           clothesModel.name,
  //           style:
  //               GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.w500),
  //         ),
  //         Text(clothesModel.type),
  //         Text(clothesModel.price.toString()),
  //       ],
  //     ),
  //   );
  // }
}
