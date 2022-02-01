import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*0.5,
      color:Colors.white,
      child: Swiper(
        itemBuilder: (context,idex){
          return  GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'detail', arguments: 'movie-screen' ),
            child: ClipRRect(  //Me permite hacer un border radius
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                fit: BoxFit.cover,
                  placeholder: AssetImage('assets/loading.gif') ,
                  image: NetworkImage('https://via.placeholder.com/300x400'),
              ),
            ),
          );
        },
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        layout: SwiperLayout.STACK,
        itemCount: 10,

      ),
    );
  }
}