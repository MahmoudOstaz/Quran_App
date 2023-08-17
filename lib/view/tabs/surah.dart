import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_quran/core/constants/gloabals.dart';
import 'package:holy_quran/model/surah_model.dart';
import 'package:holy_quran/view/screens/details.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/data/list_surah.json');
    // print(data);
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: _getSurahList(),
      initialData: [],
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return ListView.separated(
            itemBuilder: (context, index) => _surahItem(
                surah: snapshot.data!.elementAt(index), context: context),
            separatorBuilder: (context, index) =>
                Divider(color: Color(0xffBBC4CE)),
            itemCount: snapshot.data!.length);
      },
    );
  }

  Widget _surahItem({required Surah surah, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Details(noSurah:surah.nomor )));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/num.svg"),
                  SizedBox(
                    child: Center(
                      child: Text("${surah.nomor}",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      surah.namaLatin,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Row(children: [
                      Text(
                        surah.tempatTurun.name,
                        style: GoogleFonts.poppins(
                            color: text,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xffBBC4CE))),
                      const SizedBox(width: 4),
                      Text(
                        "${surah.jumlahAyat} Ayat",
                        style: GoogleFonts.poppins(
                            color: text,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ])
                  ])),
              Text(
                surah.nama,
                style: GoogleFonts.amiriQuran(
                    color: Colors.white /*primary*/,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
