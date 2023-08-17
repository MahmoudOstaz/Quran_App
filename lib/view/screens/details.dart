import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holy_quran/core/constants/gloabals.dart';

class Details extends StatelessWidget {
  final int noSurah;

  const Details({super.key, required this.noSurah});

  Future _getDetailsSurah() async {
    final data = await Dio().get('https://www.mp3quran.net/api/quran_pages_svg/');
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
   /* if(noSurah.toString().length==1){
      noSurah+="$noSurah";
    }else{

    }*/
    return Scaffold(
        backgroundColor: const Color(0xffF8F4E8),
        // appBar: AppBar(toolbarHeight: double.minPositive,leading: Text("$noSurah",style: const TextStyle(color:Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 18))),
        bottomNavigationBar: Container(height: 48,color: primary,child: Center(child: Text("$noSurah",style: const TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18),))),
        body: FutureBuilder(
          future: _getDetailsSurah(),builder: (context, snapshot) =>  SafeArea(

            child: Center(
              child:
                SvgPicture.network("https://www.mp3quran.net/api/quran_pages_svg/002.svg",width: double.infinity)
              /* CachedNetworkImage(

                imageUrl:"https://www.mp3quran.net/api/quran_pages_svg/604.svg",
                imageUrl: "https://github.com/BetimShala/quran-images-api/blob/master/quran-images/${noSurah}.png",
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.redAccent),
              )*/
            )),
        ));
  }
}
