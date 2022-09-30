import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_card/image_card.dart';

final List<String> imgList = [
      'images/cook_t.jpg',
      'images/animal_t.jpg',
      'images/counseling_t.jpg',
      'images/math_t.jpg',
      'images/sports_t.jpg',
];

class HomePage extends StatelessWidget {
  final User user;

  HomePage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0xff, 242, 223, 188),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/modu_icon.png',
                fit: BoxFit.contain,
                height: 70),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              children :<Widget>[
                _buildTop(),
                _buildMiddle(),
                _buildBottom(),
              ],
          )
        )
    );
  }

  Widget _buildTop() {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            color: Colors.white,
            height: 280,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Swiper(
                autoplay: true,
                scale: 0.9,
                viewportFraction: 0.8,
                pagination: new SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: new DotSwiperPaginationBuilder(
                      color: Colors.grey, activeColor: Color.fromARGB(0xff, 242, 223, 188)),
                ),
                control: const SwiperControl(color: Color(0xff38547C),),
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index){
                  return Image.asset(imgList[index]);
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget _buildMiddle(){
    return SafeArea(
        child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('클릭');
                    },
                    child: Image.asset(
                      'images/cook_icon.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Text('요리'),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('클릭');
                    },
                    child: Image.asset(
                      'images/animal_icon.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Text('애완동물'),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('클릭');
                    },
                    child: Image.asset(
                      'images/counseling_icon.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Text('육아'),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('클릭');
                    },
                    child: Image.asset(
                      'images/education_icon.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Text('교육'),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('클릭');
                    },
                    child: Image.asset(
                      'images/sports_icon.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Text('스포츠'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(){
    return SafeArea(
        child: SingleChildScrollView (
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) =>
            Container(
              width: 205,
              height: 250,
              child: Card(
                child: ListTile(
                  title: Text("Test"),
                ),
                elevation: 8,
                margin: EdgeInsets.only(
                    top: 25,
                    right: 8,
                    left: 8,
                    bottom: 20
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}