import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import '../../core/app_export.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();

  ProfileModel profileModelObj = ProfileModel();

  Country? selectedCountry;

  @override void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  void changeCountry(Country value) {
    selectedCountry = value;
    notifyListeners();
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
  static Widget builder (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: const ProfileScreen(),
    );
  }
}



class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // Data for rows with corresponding icons
  List<Map<String, dynamic>> profileData = [
    {
      "label": "Full Name",
      "value": "Tran Ky Thanh",
      "icon": Icons.person,
      "isEditing": false,
    },
    {
      "label": "Phone Number",
      "value": "+60134589525",
      "icon": Icons.phone,
      "isEditing": false,
    },
    {
      "label": "Email",
      "value": "Anderson@email.com",
      "icon": Icons.mail,
      "isEditing": false,
    },
    {
      "label": "Address",
      "value": "Chino Hills, HO56824, United State",
      "icon": Icons.location_on,
      "isEditing": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 2.w,
            top: 2.h,
            right: 2.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              profileData.length,
                  (index) => Column(
                children: [
                  _buildTextRow(
                    context,
                    index,
                    profileData[index]["label"],
                    profileData[index]["value"],
                    profileData[index]["icon"], // Pass the icon
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: Icon(
            Icons.arrow_back,
            size: 4.h,
            color: Colors.black,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        "Profile",
        style: CustomTextStyles.titleSmallPoppins.copyWith(
          fontSize: 18.sp,
        ),
      ),

    );
  }

  Widget _buildTextRow(BuildContext context, int index, String textName, String textContent, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 2.h), // Display different icon for each row
          SizedBox(width: 6.w),
          Expanded(
            child: profileData[index]["isEditing"]
                ? TextField(
              controller: TextEditingController(text: profileData[index]["value"]),
              onSubmitted: (newValue) {
                setState(() {
                  profileData[index]["value"] = newValue; // Save edited value
                  profileData[index]["isEditing"] = false; // Exit editing mode
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Enter ${profileData[index]["label"]}",
              ),
            )
                : _buildTextColumn(
              context,
              textName: textName,
              textContent: textContent,
            ),
          ),
          SizedBox(width: 1.w),
          GestureDetector(
            onTap: () {
              setState(() {
                profileData[index]["isEditing"] = !profileData[index]["isEditing"];
              });
            },
            child: Icon(
              profileData[index]["isEditing"] ? Icons.check : Icons.edit,
              size: 2.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextColumn(
      BuildContext context, {
        required String textName,
        required String textContent,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textName,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          textContent,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

