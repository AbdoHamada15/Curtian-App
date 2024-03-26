import 'package:animate_do/animate_do.dart';
import 'package:curtian_app/page_gallery/models/post.dart';
import 'package:curtian_app/page_gallery/models/story.dart';
//import 'package:curtian_app/page_gallery/screen_view/more.dart';
import 'package:curtian_app/page_gallery/widgets/post_card.dart';
import 'package:curtian_app/page_gallery/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_gallery/constants/constants.dart';
import 'package:curtian_app/page_gallery/tabs/kbs.dart';
import 'package:curtian_app/page_gallery/tabs/mwser.dart';
import 'package:curtian_app/page_gallery/tabs/oima.dart';
import 'package:curtian_app/page_gallery/tabs/stls.dart';

import 'tabs/alltabs.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  String? selectedCategorie = "All";
  //final Category category;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "مرحبا بكم في باريس للستائر   ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/img/background/paris_2.png",
                          width: 65,
                          height: 65,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
/*
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(14)),
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(color: Colors.grey, fontSize: 19),
                      )
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                */
                //Storys
                FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => StoryItem(
                        story: stories[index],
                      ),
                      itemCount: stories.length,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // const MoreCategory(category: category)
                      },
                      child: const Text("         More         "),
                    ),
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),

                //tabbar

                SizedBox(
                  child: Align(
                    alignment: Alignment.center,
                    child: TabBar(
                      controller: tabController,
                      labelColor: ksecondaryTextColor,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(left: 20, right: 1),
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          child: Text('All',
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        ),
                        Tab(
                          child: Text('بلتكانات',
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        ),
                        Tab(
                          child: Text('حلقات',
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        ),
                        Tab(
                          child: Text('مواسير',
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        ),
                        Tab(
                          child: Text('استالس',
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),

                //tabbarView
                FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                    width: double.infinity,
                    height: 340,
                    child: TabBarView(
                        controller: tabController,
                        children: const <Widget>[
                          AllTabs(),
                          Oima(),
                          Kbs(),
                          Mwser(),
                          Stls(),
                        ]),
                  ),
                ),

                const SizedBox(height: 20),
                //Posts
                FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text("More          "),
                      ),
                      Text(
                        "Latest Curtians",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 24,
                  ),
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => PostCard(
                    post: posts[index],
                  ),
                  itemCount: posts.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
