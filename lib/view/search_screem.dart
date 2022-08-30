import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tempreture/controller/favScreenControoler.dart';
import 'package:tempreture/view/widgets/noresultfound.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({Key? key}) : super(key: key);

  @override
  _SerchScreenState createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  TextEditingController searchContr = TextEditingController();
  var onSearchLst = [];

  FavCityController favCityController =
      Get.put(FavCityController(), permanent: true);
  var lst = [
    "Delhi",
    "Kollkata",
    "Bangalore",
    "Al Bukayriyah",
    "Riyadh",
    "Jeddah",
    "Mecca",
    "Medina",
    "Ad Dammam",
    "Al Hufuf",
    "Buraydah",
    "Al Hillah",
    "At Taif",
    "Tabuk",
    "Khamis Mushayt",
    "Hail",
    "Al Qatif",
    "Al Mubarraz",
    "Al Kharj",
    "Najran",
    "Yanbu",
    "Abha",
    "Arar",
    "Jazan",
    "Sakaka",
    "Al Bahah"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.11,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 12, 22, 1),
            height: MediaQuery.of(context).size.height * 0.055,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
              controller: searchContr,
              onChanged: (value) {
                setState(() {
                  onSearchLst = lst
                      .where((element) =>
                          element.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Container(
                    width: 25,
                    height: 25,
                    child: IconButton(
                      onPressed: () {
                        onSearchLst.clear();
                        searchContr.clear();
                        setState(() {
                          searchContr.text = '';
                        });
                      },
                      icon: Icon(
                        Icons.cancel_sharp,
                        color: Colors.grey.withOpacity(0.8),
                        size: 18,
                      ),
                    ),
                  ),
                ),
                focusedBorder: InputBorder.none,
                hintText: 'Search City',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          searchContr.text.isNotEmpty && onSearchLst.isEmpty
              ? NoResultFound()
              : Expanded(
                  child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: searchContr.text.isNotEmpty
                              ? onSearchLst.length
                              : lst.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.back(result: [
                                  searchContr.text.isNotEmpty
                                      ? onSearchLst[index]
                                      : lst[index],
                                ]);
                              },
                              child: Container(
                                color: Color.fromARGB(255, 40, 15, 151),
                                child: ListTile(
                                  title: Text(
                                      searchContr.text.isNotEmpty
                                          ? onSearchLst[index]
                                          : lst[index],
                                      style: TextStyle(
                                          color:
                                              Colors.white.withOpacity(0.8))),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "City",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.6)),
                                    ),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        var addCity =
                                            searchContr.text.isNotEmpty
                                                ? onSearchLst[index]
                                                : lst[index];
                                        favCityController.addtoFav(addCity);

                                        Get.snackbar(
                                          "Added to Favroites",
                                          "$addCity has been added to Favroites city list",
                                          backgroundColor: Colors.black,
                                          colorText: Colors.white,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.favorite_rounded,
                                        color:
                                            Color.fromARGB(255, 209, 201, 200),
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ))
        ],
      ),
    );
  }
}
