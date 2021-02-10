import 'package:booking_service/constants/colors.dart';
import 'package:booking_service/models/bookings.dart';
import 'package:booking_service/models/stays.dart';
import 'package:booking_service/screens/bottom/bottom_sheet.dart' as sheet;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext bContext) {
    List<Bookings> bookingsList = Bookings.bookingsList;
    double width = MediaQuery.of(bContext).size.width;
    double height = MediaQuery.of(bContext).size.height;
    return Scaffold(
      backgroundColor: BrandColors.backgroundColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
        child: FloatingActionButton(
          mini: true,
          onPressed: () {},
          backgroundColor: BrandColors.yellow,
          child: Icon(
            Icons.add,
            color: BrandColors.textYellow,
            size: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Applications",
                  style: TextStyle(
                    color: BrandColors.fontColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Current",
                      style: TextStyle(
                        color: BrandColors.fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Executed",
                      style: TextStyle(
                        color: BrandColors.secondaryFontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "All",
                      style: TextStyle(
                        color: BrandColors.secondaryFontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height / 3,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                offset: Offset.fromDirection(1, 2),
                                blurRadius: 20,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: height / 3.8,
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      bookingsList[index].title,
                                      style: TextStyle(
                                        color: BrandColors.fontColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      ' ${bookingsList[index].offers} offers 🔥 ',
                                      style: TextStyle(
                                        color: BrandColors.textYellow,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),
                                child: Text(
                                  ' ${bookingsList[index].checkInDate}-${bookingsList[index].checkOutDate}  ',
                                  style: TextStyle(
                                    color: BrandColors.secondaryFontColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  child:
                                      getBadges(bookingsList[index].features)),
                            ],
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: bookingsList.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Stays",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: BrandColors.fontColor,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 28,
                        color: BrandColors.darkPurple,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    children: getGridViewChildren(bContext),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getGridViewChildren(context) {
    List<Stays> stayList = Stays.staysList;
    List<Widget> list = [];
    for (int i = 0; i < stayList.length; i++) {
      list.add(GestureDetector(
        onTap: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) => sheet.BottomSheet());
        },
        child: new Container(
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.srcOver),
                      fit: BoxFit.cover,
                      image: AssetImage(stayList[i].imageSrc),
                    )),
                  )),
              Positioned(
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: BrandColors.yellow,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      )),
                  height: 50,
                  width: 40,
                  child: Center(
                    child: Text(
                      '${stayList[i].ratings}',
                      style: TextStyle(
                        color: BrandColors.textYellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 10,
                child: Text(
                  '${stayList[i].title}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${stayList[i].price}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Per Night',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return list;
  }

  Widget getBadges(List<Feature> features) {
    List<Widget> list = [];
    for (var i = 0; i < features.length; i++) {
      list.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              color: features[i].color,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 80,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    features[i].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return new Wrap(
      direction: Axis.horizontal,
      children: list,
    );
  }
}
