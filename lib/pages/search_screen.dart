import 'package:flutter/material.dart';
import 'package:shieldy/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

//database connection- Read
class _SearchScreenState extends State<SearchScreen> {
  List<String> contactCards = [
  'Ahangama - Police Station - 0912283222',
'Ahungalla - Police Station - 0912264026',
'Aiththamalai - Police Station - 0653647513',
'Akkaraipattu - Police Station - 0672277222',
'Akkarayankulam - Police Station - 0113081016',
'Akuressa - Police Station - 0412283222',
'Alawathugoda - Police Station - 0662244322',
'Alawwa - Police Station - 0372278122',
'Athurugiriya - Police Station - 0112561222',
'Achchuweli - Police Station - 0212058585',
'Agalawaththa - Police Station - 0342248855',
'Agarapathana - Police Station - 0512230222',
'Agbopura - Police Station - 0262244111',
'Akmeemana - Police Station - 0912234223',
'Bambalapitiya - Police Station - 0112588680',
'BMICH - Police Station - 0112691132',
'Borella - Police Station - 0112693938',
'Boralesgamuwa - Police Station - 0112509461',
'Colombo Harbour - Police Station - 0112320980',
'Dematagoda - Police Station - 0112693838',
'Dehiwala - Police Station - 0112738222',
'Dompe - Police Station - 0112409222',
'Kaduwela - Police Station - 0112159224',
'Kahathuduwa - Police Station - 0112705233',
'Kesbewa - Police Station - 0112603742',
'Kiribathgoda - Police Station - 0112914985',
'Kollupitiya - Police Station - 0112323689',
'Kotahena - Police Station - 0112431861',
'Kohuwala - Police Station - 0112852621',
'Malabe - Police Station - 0112571102',
'Maligawatta - Police Station - 0112434135',
'Maradana - Police Station - 0112692748',
'Mirihana - Police Station - 0112828566',
'Moratuwa - Police Station - 0112645222',
'Mount Lavinia - Police Station - 0112738351',
'Narahenpita - Police Station - 0112368242',
'Nawagamuwa - Police Station - 0112415222',
'Panadura North - Police Station - 0382233204',
'Pettah - Police Station - 0112421515',
'Piliyandala - Police Station - 0112614222',
'Sapugaskanda - Police Station - 0112400315',
'Slave Island - Police Station - 0112433829',
'Thalangama - Police Station - 0112788079',
'Wellampitiya - Police Station - 0112572222',
'Wellawatta - Police Station - 0112588212',
'Welikada - Police Station - 0112862522',
'Wolfendhal - Police Station - 0112323356',
'Awissawella - Police Station - 0362222222',
'Mulleriyava - Police Station - 0112578279',
'Kosgama - Police Station - 0362255022',
'Padukka - Police Station - 0112859027',
'Hanwella - Police Station - 0362255222',
'Mattegoda - Police Station - 0112783776',
'Cinnamon Garden - Police Station - 0112695411',
'Dam Street - Police Station - 0112432612',
'Pettah - Police Station - 0112421515',
'Fort - Police Station - 0112433744',
'Fore shore - Police Station - 0112434595',
'Grandpass - Police Station - 0112421414',
'Kotahena - Police Station - 0112431861',
'Bluemandal - Police Station - 0112522733',
'Gothatuwa - Police Station - 0112411146',
'Angulana - Police Station - 0112626357',
'Pugoda - Police Station - 0112405224',
'Meepe - Police Station - 0112175450',
'Angoda Fever Hospital - Hospital(Gov) - 0112411284',
'General info - rda@edu.min.spgov.lk',
'Deputy General Manager (Road & Bridges) - 091-2226440',
'Deputy General Manager (Admin) - 091-2224125',
'National Hospital of Sri Lanka - 0112 691 111',
'Lanka Hospitals - 0115 430 000',
'Kings Hospital Colombo - 0117 743 743',
'Nawaloka Hospital Specialist Centre - 0115 577 111 - 78 Colombo - Batticaloa Hwy',
'Castle Street Hospital for Women - 0112 696 231 - Castle St',
'Western Hospital - 0117 392 260 - 218 Dr NM Perera Mawatha Rd',
'National Hospital - 0112 691 111 - WVC9+7Q6, Kynsey Rd',
'Royal Hospital - 0114 000 100 - No 62 W.A. Silva Mawatha',
'Ratnam Hospital - 0112 327 780 - WVC4+CVC, Dr Colvin R de Silva Mawatha',
'Joseph Fraser Memorial Hospital - 0112 049 999 - 23 Joseph Fraser Rd, Off Keppetipola Rd',
'Park Hospitals - 0112 590 200 - 186 Park Rd',
'Durdans Hospital - 0112 140 000 - 3 Alfred Pl',
'Ayush Hospital Colombo - 0112 525 000 - 562 A Aluthmawatha Rd',
'Health Scan Private Hospital - 0114 616 666 - 95 Castle St',
'Ninewells Hospital (Pvt) Ltd. - 0114 520 999 - 55 /1 Kirimandala Mawatha',
'Colombo South Teaching Hospital - Kalubowila - 0112 832 950 - Dehiwala-Mount Lavinia',
'Asiri Central Hospital - Central Hospital Limited - 0114 665 500 - 114 Norris Canal Rd',
'Accident Ward - 0112 691 111 - Accident Ward, EW Perera Mawatha',
'Colombo South Teaching Hospital (Kalubowila) - 0112 832 950 - Dehiwala-Mount Lavinia',
'De Soysa Hospital for Women - 0112 662 619 - WV9C+X6V, Kynsey Rd',
'CMC Fire Service Department - 0112 422 222 - WVF6+7WW, T. B. Jayah Mawatha',
'Fire Service Department CMC Kotahena Substation - 01 - 0112 430 348 - George R. De Silva Mawatha',
'Port Fire Brigade - 0112 432 332 - XV35+63V, Colombo Port Main Rd',
'Colombo Fire Station - WVXC+7F9, Prince of Wales Ave',
'Grandpass Fire Station - 0112 431 353 - WVXC+7FQ',
'Fire Department - Kotte - 0112 879 444 - Sri Jayawardenepura Kotte',
'Fire Brigade and Department - 0112 714 444 - Dehiwala-Mount Lavinia',
'Fire & Rescue Training Academy - 0112 364 040 - Colombo',
'Fire Service Department CMC Gaspaha Sub Station - 04 - 0112 422 222 - WVQ3+HJ3, Main St'


];

  List<String> displayedCountries = [];
  @override
  void initState() {
    super.initState();
    displayedCountries = List.from(contactCards);
  }

  void onQueryChanged(String newQuery) {
    setState(() {
      if (newQuery.isEmpty) {
        displayedCountries = contactCards;
      } else {
        displayedCountries = contactCards
            .where((country) => country.toLowerCase().contains(newQuery.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            mobileBackgroundColor, // Ensure this color is defined or use a Color value directly
        centerTitle: false,
        title: Image.asset(
          'images/logo1.png',
          width: 100,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
      body: Column(
        children: [
          SearchBar(onQueryChanged: onQueryChanged),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }


Widget _buildSearchResults() {
  return ListView.builder(
    itemCount: displayedCountries.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 4, // Add elevation for a shadow effect
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add margin around the Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Add rounded corners to the Card
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16), // Add padding inside the ListTile
          leading: Icon(Icons.location_on, color: blueColor), // Add a leading icon
          title: Text(
            displayedCountries[index],
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 16, // Increase the font size
            ),
          ),
          subtitle: Text(
            'Police Station', // Add a subtitle
            style: TextStyle(color: Colors.grey), // Customize the subtitle style
          ),
          trailing: IconButton(
            icon: Icon(Icons.phone, color: const Color.fromARGB(255, 255, 255, 255)), // Add a trailing icon button
            onPressed: () {
            },
          ),
          onTap: () {
          },
        ),
      );
    },
  );
}


  // Widget _buildSearchResults() {
//   return Container(
//     color: Color.fromARGB(255, 0, 0, 0), // Change background color to black
//     margin: EdgeInsets.all(10), // Add margin around the search results
//     child: ListView.separated(
//       itemCount: displayedCountries.length,
//       separatorBuilder: (context, index) => Divider(color: Colors.white), // Add Divider between items
//       itemBuilder: (context, index) {
//         return Card(
//           color: Color.fromARGB(255, 0, 0, 0), // Set card background color to white
//           child: ListTile(
//             title: Text(
//               displayedCountries[index],
//               style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Set text color to black
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
}


class SearchBar extends StatelessWidget {
  final ValueChanged<String> onQueryChanged;

  SearchBar({required this.onQueryChanged});
  //searcch bar implementation

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        onChanged: onQueryChanged,
        decoration: InputDecoration(
          labelText: 'Search from location',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}