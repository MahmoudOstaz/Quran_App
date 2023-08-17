import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_quran/core/constants/gloabals.dart';
import 'package:holy_quran/view/tabs/hijb.dart';
import 'package:holy_quran/view/tabs/page.dart';
import 'package:holy_quran/view/tabs/para.dart';
import 'package:holy_quran/view/tabs/surah.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: background,
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverToBoxAdapter(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text("Asslamualaikum",
                                    style: GoogleFonts.poppins(
                                        color: text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                                const SizedBox(height: 8),
                                Text("AbdulBaset AbdulSamad",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                const SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.antiAlias,
                                  children: [
                                    Container(
                                      height: 130,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: [
                                                0,
                                                0.6,
                                                1
                                              ],
                                              colors: [
                                                Color(0xffDf98Fa),
                                                Color(0xffB070FD),
                                                Color(0xff9055ff)
                                              ])),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: SvgPicture.asset(
                                            'assets/svgs/quran.svg')),
                                    Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(children: [
                                              SvgPicture.asset(
                                                  "assets/svgs/book.svg"),
                                              const SizedBox(width: 8),
                                              Text("Last Read",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14))
                                            ]),
                                            const SizedBox(height: 16),
                                            Text("Al-Fatiah",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            const SizedBox(height: 8),
                                            Text("Ayah No: 1",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14)),
                                          ],
                                        ))
                                  ],
                                ),
                              ])),
                          SliverAppBar(
                              pinned: true,
                              elevation: 0,
                              backgroundColor: background,
                              automaticallyImplyLeading: false,
                              shape: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color(0xffAAAAAA).withOpacity(0.1))),
                              bottom: PreferredSize(
                                  preferredSize: const Size.fromHeight(0),
                                  child: _tabBar()))
                        ],
                    body: TabBarView(children: [
                      SurahTab(),
                      ParaTab(),
                      PageTab(),
                      HijbTab()
                    ])))),
      ),
      drawer: Drawer(
        backgroundColor: background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: primary,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/logo.svg",
                    height: 100,
                  ),
                  Text(
                    'Holy Quran ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: text),
              title: Text('Home', style: TextStyle(color: text)),
              onTap: () {
                // Handle drawer item tap
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(height: 1, color: text),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: text),
              title: Text('Settings', style: TextStyle(color: text)),
              onTap: () {
                // Handle drawer item tap
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset("assets/svgs/menu.svg")),
          Text("Quran App",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/svgs/search.svg")),
        ],
      ));

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: secondary,
      showSelectedLabels: true,
      selectedItemColor: primary,
      selectedIconTheme: IconThemeData(color: primary),
      unselectedIconTheme: IconThemeData(color: text),
      showUnselectedLabels: false,
      currentIndex: 0,
      items: _buildBottomNavigationBarItems());

  BottomNavigationBarItem _bottomNavigationBarItem(
          {required String iconSvg,
          required String text,
          bool isClicked = false}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(iconSvg,
              color: isClicked ? primary : Color(0xff8789A3)),
          label: text);

  Tab _tabItem({required String label}) => Tab(
          child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
      ));

  TabBar _tabBar() => TabBar(
          unselectedLabelColor: text,
          labelColor: Colors.white,
          indicatorColor: primary,
          indicatorWeight: 3,
          tabs: [
            _tabItem(label: "Surah"),
            _tabItem(label: "Para"),
            _tabItem(label: "Page"),
            _tabItem(label: "Hijb"),
            // _tabItem(label: "السورة"),
            // _tabItem(label: "الفقرة"),
            // _tabItem(label: "الصفحة"),
            // _tabItem(label: "الجزء"),
          ]);

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      _bottomNavigationBarItem(
          iconSvg: "assets/svgs/home-icon.svg", isClicked: true, text: "Quran"),
      _bottomNavigationBarItem(
          iconSvg: "assets/svgs/lamp-icon.svg", text: "Tips"),
      _bottomNavigationBarItem(
          iconSvg: "assets/svgs/pray-icon.svg", text: "Prayer"),
      _bottomNavigationBarItem(
          iconSvg: "assets/svgs/doa-icon.svg", text: "Doa"),
      _bottomNavigationBarItem(
          iconSvg: "assets/svgs/bookmark-icon.svg", text: "Bookmark"),
    ];
  }
}
