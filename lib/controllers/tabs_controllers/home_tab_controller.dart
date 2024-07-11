import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilian_tech_task/models/cobone.dart';
import 'package:lilian_tech_task/models/cobone_option.dart';
import 'package:lilian_tech_task/ui/theme.dart';
import 'package:lilian_tech_task/widgets/bottom_sheet_widget.dart';

class HomeTabController extends GetxController {

  List<Cobone> cobones = List.generate(5, (i) => Cobone(
    imagesPaths: [
      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/8d/6c/2d/exterior-view-of-the.jpg?w=600&h=-1&s=1",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7kZQgpYSPYa_HZH3MtlnmLq05XgoVHXl3Nw&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRqM7JdUPjQRMFgqVSIlGW_tmy1mp_xE7nBg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqb8QQ8fiydo_w7YwFZiDpFsdbsFiwp6V9tw&s",
    ],
    title: "KSA 1-Night Half Board Stay at Holiday Inn",
    boughtCount: 115,
    conditions: [
      "Valid for 45 days from date of purchase",
      "Not valid during public holidays",
      "Weekdays: From Sunday to Wednesday",
      "Weekend: Thursday, Friday and Saturday",
      """Required booking details: 
- For booking please contact hotel reservations officer
- To confirm your booking before check-in time, please send a copy of your Cobone voucher via WhatsApp to the number 0598914752""",
      "If the customer wants to change the reservation date, this must be done 24 hours before the check-in date",
      "Check-in time: 02:00 pm",
      "Check-out time: 12:00 pm",
      "Prior reservation required, no customer will be accepted without prior reservation",
      "If the reservation is sent to the reservations officer and the customer cannot come, he will not be entitled to have a new reservation",
      "Customer can purchase more than 1 voucher if he wants to extend their stay",
      "This merchant requires a printed copy of the purchased voucher to redeem this deal",
      "After payment is successful you will receive your voucher by email and you can also find it in the ‘My Account’ section when signed in to the website",
      "All prices shown are inclusive of VAT where applicable",
    ],
    description: "Surprise your family with a 1-night weekend or weekday stay including meals at Holiday Inn Al Khobar starting from SAR 425 only",
    highlights: [
      "Surprise your family with a 1-night weekend or weekday stay including meals at Holiday Inn Al Khobar starting from SAR 425 only",
      """Choose from the options below:
Option 1: 1-Night weekend stay with breakfast + Lunch OR dinner for 2 adults for SAR 425
Option 2: 1-Night weekday stay with breakfast + Lunch OR dinner for 2 adults for SAR 475""",
      "Room Type: Double room",
      """Deal includes:
- 1-Night stay during weekday or weekend for 2 adults and 2 children below 6 years (as per option purchased)
- International or Oriental breakfast with tea for 2 adults
- Lunch or dinner including main course + soup + salad or fattoush + 1 dessert for 2 adults
- Car parking
- Internet""",
      """Main course options:
- Grills plate - Biryani chicken plate- Daily dish - Grilled hamour plate with vegetables
- Soup is served according to the main course""",
      "The customer can enjoy the buffet if it is available, if not the hotel will serve meals in the room or hotel restaurant",
    ],
    isLimited: true,
    rate: 3.7,
    reviewsNumber: 4,
    options: [
      CoboneOption(
        title: "Option 1: 1 Night weekend stay with breakfast + Lunch OR dinner for 2 adults",
        price: 772,
        boughtNumber: 51,
        discount: 45
      ),
      CoboneOption(
        title: "Option 2: 1-Night weekday stay with breakfast + Lunch OR dinner for 2 adults",
        price: 772,
        boughtNumber: 13,
        discount: 38
      ),

    ]
  ));

  List<String> cities = [
    "Riyadh",
    "Jeddah",
    "Dammam",
    "KSA Other Cities",
    "Bahrain",
    "Dubai",
    "Abu Dhabi",
    "Northern Emirates"
  ];

  late final Rx<String?> _selectedCity = Rx(cities.first);
  final Rx<String?> _selectedLanguage = Rx(null);

  final RxInt _activeDottedIndex = RxInt(0);

  int get activeDottedIndex => _activeDottedIndex.value;
  set activeDottedIndex(int i) => _activeDottedIndex.value = i;

  void onCoboneTapped(Cobone c){
    Get.toNamed("/cobone-details",arguments: c);
  }
  void onLocationTapped() {
    Get.bottomSheet(
      BottomSheetWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("YOUR LOCATION",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),),
            ),
            DropdownButtonFormField<String?>(
                onTap: () {
                },
                value: _selectedCity.value,
                iconSize: 35,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: bgColor))),
                items: [
                ],
                onChanged: (v) {
                  _selectedCity.value = v;
                }),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("LANGUAGE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),),
            ),
            DropdownButtonFormField<String?>(
                onTap: () {},
                iconSize: 35,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: bgColor))),
                items: [],
                onChanged: (v) {
                  _selectedLanguage.value = v;
                }),
            const SizedBox(height: 150,),
            FittedBox(fit: BoxFit.fitWidth,child: FilledButton(onPressed: () {}, child: const Text("Save"),style: FilledButton.styleFrom(
              minimumSize: Size(Get.width, 40)
            ),))
          ],
        ),
      ),
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      enterBottomSheetDuration: const Duration(milliseconds: 300),
      exitBottomSheetDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      ignoreSafeArea: false,
    );
  }
}
