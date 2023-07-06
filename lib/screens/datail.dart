import 'package:flutter/material.dart';

import '../services/food.dart';

class Detail extends StatefulWidget {
  final Food food;
  const Detail({super.key, required this.food});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  int countProd = 0;

  int totprice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.food.img),
                fit: BoxFit.cover)
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(150, 43, 43, 43),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: IconButton(onPressed: (){
                    Navigator.pop(context); 
                  }, 
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(150, 43, 43, 43),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: IconButton(onPressed: (){
                  }, 
                  icon: Icon(Icons.favorite_border, color: Colors.white,)),
                ),
              )
                ],
              )
              ),
              Container(
                margin: EdgeInsets.only(top: 350),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0XFF121212),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(widget.food.name, 
                        style: TextStyle(color: Colors.white,fontSize: 25), 
                        textAlign: TextAlign.start,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.only(left: 10),
                      child: Text("${widget.food.price}\$", 
                        style: TextStyle(
                          color: Colors.white,fontSize: 20),
                           textAlign: TextAlign.start,),
                    ),
                          ],
                        ),
                        Container(
                        width: 50,
                        height: 150,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  if (countProd < 1) {
                                    countProd = 0;
                                  }else{
                                    countProd--;
                                    totprice = widget.food.price * countProd;
                                  }
                                });
                              }, 
                              icon: Icon(Icons.minimize, color: Colors.white,)
                              ),
                            Text("${countProd}", 
                            style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  countProd++;
                                  totprice = widget.food.price * countProd;
                                });
                              }, 
                              icon: Icon(Icons.add, color: Colors.white,)
                              ),
                          ],
                        ),
                      ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text("Description", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                          SizedBox(height: 10,),
                          Text(widget.food.description, 
                      style: TextStyle(color: Colors.white),),
                        ],
                      )
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(200, 8, 8, 8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsets.all(10),
                        child: Text("\$${totprice}", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Color(0XFFFF7F27),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Text("add to card", style: TextStyle(color: Colors.white),)),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}