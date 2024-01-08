import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/bloc/auth/auth_bloc.dart';
import 'package:hackfest_mobile/pages/all_article_page.dart';
import 'package:hackfest_mobile/pages/all_course_page.dart';
import 'package:hackfest_mobile/pages/detail_article_page.dart';
import 'package:hackfest_mobile/pages/detail_course_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_article.dart';
import 'package:hackfest_mobile/widgets/card_popular_course.dart';
import 'package:hackfest_mobile/widgets/filter_categories.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

import '../models/categories_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curIndex = 0;

  void _updateSelected(int index){
    setState(() {
      _curIndex = index;
    });
  }

  TextEditingController searchControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 19,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          print((state as AuthSuccess).token);
                          return Text('Halo,izzz', style: MyTextStyle.judulH3(color: MyColors.blackBase),);
                        },
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                        child: Image.asset('assets/images/profile_hackfest.png',fit: BoxFit.cover),
                      ),
                    ],
                  ),
                  const SizedBox(height: 23,),
                  MyTextField(hint: 'Cari sesuatu', controller:searchControlller , icon: Icons.search),
                  const SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 130,
          
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: MyColors.primaryBase,
                            borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Ingin belajar apa\nhari ini?', style: TextStyle(fontWeight: FontWeight.w700,color: MyColors.whiteBase),),
                            Image.asset('assets/images/people_home.png'),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 18,),
                  Text('Kategori', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    height: 95,
                    child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        final categories = Categories.getAllCategories[index];
                        return FilterCategories(icon: categories.icon, name: categories.name);
                    }, separatorBuilder: (context, index) {
                        return const SizedBox(width: 10,);
                    }, itemCount: Categories.getAllCategories.length),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return AllCoursePage();
                          },));
                        },
                          child: Text('Lihat semua', style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
                      )
                    ],
                  ),
                  const SizedBox(height: 7,),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                      return CardPopularCourse(
                          image:'assets/images/popular1.png' ,
                          rating: '4,9',
                          title: 'Dasar Digital Marketing',
                          numberOfPeople: '2.380',
                          categories: 'teratas',
                          price: '50.000',
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return DetailPage();
                            }));
                          },
                      );
                    }, separatorBuilder: (context, index) {
                      return const SizedBox(width: 8,);
                    }, itemCount: 2),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Artikel Terkini', style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return AllArticlePage();
                          },));
                        },
                          child: Text('Lihat semua', style: MyTextStyle.captionH5(color: MyColors.primaryBase),)
                      )
                    ],
                  ),
                  const SizedBox(height: 7,),
                 CardArticle(),
          
          
          
          
          
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        onTap:_updateSelected ,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: MyColors.primaryBase,
        unselectedItemColor: MyColors.grey200,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/home_icon.svg',color: _curIndex==0 ? MyColors.primaryBase : MyColors.grey200, ), label: 'Beranda'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/mycourse_icon.svg',color: _curIndex==1 ? MyColors.primaryBase : MyColors.grey200,), label: 'Kursus Saya'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/work_icon.svg',color: _curIndex==2 ? MyColors.primaryBase : MyColors.grey200,), label: 'Pekerjaan'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svgs/profile_icon.svg', color: _curIndex==3 ? MyColors.primaryBase : MyColors.grey200,), label: 'Profile'),
        ],
      ),
    );
  }
}

