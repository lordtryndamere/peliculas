
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final size  = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      
      height: size.height*0.3 ,
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: Text('Populares',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) => Container(
              width: 120,
              height: 190,
              color: Colors.green,
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            ), itemCount: 20,  scrollDirection: Axis.horizontal, ),
          )
        ],
      ),
    );
  }
}