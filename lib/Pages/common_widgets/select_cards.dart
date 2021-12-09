import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:flutter/material.dart';

class SelectCards extends StatefulWidget {
  const SelectCards({Key? key}) : super(key: key);

  @override
  State<SelectCards> createState() => _SelectCardsState();
}

class _SelectCardsState extends State<SelectCards> {
  int selectItem = -1;

  List<dynamic> item = [
    {
      'back-img':
          'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
      'description': 'Beyond Link One',
    },
    {
      'back-img':
          'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
      'description': 'Beyond Link Two',
    },
    {
      'back-img':
          'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
      'description': 'Beyond Link Three',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              FadeInDown(
                from: 50,
                child: Text(
                  'Select a Card',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Image.network(
                        'https://app.beyondant.com/static/media/cardbg.173ce649.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.20,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            'Abcd',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectItem = index;
                          print(selectItem);
                        });
                      },
                      child: FadeInUp(
                        delay: Duration(milliseconds: index * 100),
                        child: AnimatedContainer(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width * 0.60,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0.5,
                            vertical: 0.5,
                          ),
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: selectItem == index
                                  ? Colors.blue
                                  : Colors.white,
                              width: 2,
                            ),
                            boxShadow: [
                              selectItem == index
                                  ? BoxShadow(
                                      color: Colors.blueGrey.shade100,
                                      offset: const Offset(0, 3),
                                      blurRadius: 10,
                                    )
                                  : BoxShadow(
                                      color: Colors.blueGrey..shade200,
                                      offset: const Offset(0, 3),
                                      blurRadius: 10,
                                    ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfxX8Vt6qkvzP3ChqHyWoOq-PXfIeifE8-Pw&usqp=CAU',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: selectItem == index
                                      ? Icon(Icons.check_circle,
                                          color: Colors.blue)
                                      : Text(''),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://app.beyondant.com/static/media/businesscarduserprofile.789950ef.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 25),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Text(
                                      'Abcd',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // child: Row(
                          //   children: [
                          //     selectItem == index
                          //         ? Image.network(
                          //             item[index]['back-img'],
                          //             width: 50,
                          //           )
                          //         : Image.network(
                          //             item[index]['back-img'],
                          //             width: 50,
                          //           ),
                          //     const SizedBox(
                          //       width: 20,
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         item[index]['description'],
                          //       ),
                          //     ),
                          //     Icon(
                          //       Icons.check_circle,
                          //       color: selectItem == index
                          //           ? Colors.blue
                          //           : Colors.white,
                          //     )
                          //   ],
                          // ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
