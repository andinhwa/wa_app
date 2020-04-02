import 'package:waverley_tools/models/contact.dart';

abstract class ContacrService {
  Future<List<Contact>> getContacts();
  Future<Contact> getDetailedContact(String id);
  Future<List<Contact>> search(String textSearch);
}

class FakeContacrService implements ContacrService {
  List<Contact> fakeList = [];
  FakeContacrService() {
    fakeList = List<Contact>.from(getJson().map((i) => Contact.fromJson(i)));
  }

  @override
  Future<List<Contact>> getContacts() {
    return Future.delayed(Duration(seconds: 1), () {
      var result = this.fakeList;
      result.sort((a, b) => a.compareTo(b));
      return result;
    });
  }

  @override
  Future<Contact> getDetailedContact(String id) {
    return Future.delayed(Duration(seconds: 1), () {
      return this.fakeList.firstWhere((s) => s.id == id);
    });
  }

  @override
  Future<List<Contact>> search(String textSearch) {
    return Future.delayed(Duration(seconds: 1), () {
      return this
          .fakeList
          .where((ct) => ct.name.toLowerCase().contains(textSearch))
          .toList();
    });
  }
}

List<dynamic> getJson() {
  return [
    {
      "id": "1",
      "createdAt": "2020-04-01T05:50:48.492Z",
      "name": "Anna Walsh",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/daniloc/128.jpg",
      "firstName": "Beverly",
      "lastName": "Beier",
      "jobType": "Specialist",
      "phoneNumber": "(796) 106-6841"
    },
    {
      "id": "2",
      "createdAt": "2020-03-31T17:13:23.869Z",
      "name": "Randy Donnelly DVM",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/antongenkin/128.jpg",
      "firstName": "Therese",
      "lastName": "Smith",
      "jobType": "Engineer",
      "phoneNumber": "736-116-0842 x701"
    },
    {
      "id": "3",
      "createdAt": "2020-03-31T14:34:42.851Z",
      "name": "Miss Laverne Jaskolski",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/leemunroe/128.jpg",
      "firstName": "Haylee",
      "lastName": "Muller",
      "jobType": "Specialist",
      "phoneNumber": "(384) 354-1095"
    },
    {
      "id": "4",
      "createdAt": "2020-04-01T01:21:21.876Z",
      "name": "Miss Reina Rowe",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/michigangraham/128.jpg",
      "firstName": "Angelina",
      "lastName": "Hickle",
      "jobType": "Analyst",
      "phoneNumber": "(349) 128-7179 x55076"
    },
    {
      "id": "5",
      "createdAt": "2020-04-01T01:50:45.029Z",
      "name": "Carlee Hammes",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/sokaniwaal/128.jpg",
      "firstName": "Norma",
      "lastName": "Kihn",
      "jobType": "Officer",
      "phoneNumber": "669.241.8868"
    },
    {
      "id": "6",
      "createdAt": "2020-03-31T20:49:42.240Z",
      "name": "Lysanne Roob",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/darylws/128.jpg",
      "firstName": "Lyric",
      "lastName": "Weimann",
      "jobType": "Consultant",
      "phoneNumber": "007-246-8937 x9004"
    },
    {
      "id": "7",
      "createdAt": "2020-04-01T04:15:34.728Z",
      "name": "Malcolm Lowe",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/finchjke/128.jpg",
      "firstName": "Heath",
      "lastName": "Cartwright",
      "jobType": "Director",
      "phoneNumber": "306-765-1860 x62214"
    },
    {
      "id": "8",
      "createdAt": "2020-03-31T20:32:33.954Z",
      "name": "Alverta Hirthe",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/boxmodel/128.jpg",
      "firstName": "Louie",
      "lastName": "Wolf",
      "jobType": "Designer",
      "phoneNumber": "251.315.3635"
    },
    {
      "id": "9",
      "createdAt": "2020-04-01T06:48:43.124Z",
      "name": "Morton Bashirian",
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/ffbel/128.jpg",
      "firstName": "Eddie",
      "lastName": "Hamill",
      "jobType": "Developer",
      "phoneNumber": "1-589-919-6385"
    },
    {
      "id": "10",
      "createdAt": "2020-04-01T10:24:28.173Z",
      "name": "Lexus Schamberger",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/josecarlospsh/128.jpg",
      "firstName": "Alba",
      "lastName": "Howe",
      "jobType": "Supervisor",
      "phoneNumber": "(985) 129-3525 x994"
    },
    {
      "id": "11",
      "createdAt": "2020-04-01T08:19:27.568Z",
      "name": "Danial Bogisich",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/silv3rgvn/128.jpg",
      "firstName": "Nelda",
      "lastName": "Morar",
      "jobType": "Planner",
      "phoneNumber": "1-462-443-3889"
    },
    {
      "id": "12",
      "createdAt": "2020-04-01T14:48:21.428Z",
      "name": "Evie Eichmann",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/taylorling/128.jpg",
      "firstName": "Olin",
      "lastName": "Wisozk",
      "jobType": "Manager",
      "phoneNumber": "1-545-811-6975 x7906"
    },
    {
      "id": "13",
      "createdAt": "2020-03-31T21:40:18.878Z",
      "name": "Dr. Mustafa Crist",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/prinzadi/128.jpg",
      "firstName": "Cicero",
      "lastName": "Schroeder",
      "jobType": "Coordinator",
      "phoneNumber": "172.725.1249 x65996"
    },
    {
      "id": "14",
      "createdAt": "2020-04-01T10:36:13.799Z",
      "name": "Tod Monahan",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/petrangr/128.jpg",
      "firstName": "Sabina",
      "lastName": "Gottlieb",
      "jobType": "Consultant",
      "phoneNumber": "386-085-6199 x783"
    },
    {
      "id": "15",
      "createdAt": "2020-03-31T22:42:51.443Z",
      "name": "Lorenzo Satterfield",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/batsirai/128.jpg",
      "firstName": "Jalyn",
      "lastName": "Rau",
      "jobType": "Technician",
      "phoneNumber": "177.232.0481 x23413"
    },
    {
      "id": "16",
      "createdAt": "2020-03-31T21:33:42.298Z",
      "name": "Janae Davis",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/ariffsetiawan/128.jpg",
      "firstName": "Dorris",
      "lastName": "O'Kon",
      "jobType": "Associate",
      "phoneNumber": "656-995-5603 x835"
    },
    {
      "id": "17",
      "createdAt": "2020-04-01T15:59:25.638Z",
      "name": "Rubie Bernhard",
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/sta1ex/128.jpg",
      "firstName": "Imelda",
      "lastName": "Boyle",
      "jobType": "Manager",
      "phoneNumber": "728.765.9219"
    },
    {
      "id": "18",
      "createdAt": "2020-04-01T07:31:33.182Z",
      "name": "Gracie Kub",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/thewillbeard/128.jpg",
      "firstName": "Madge",
      "lastName": "Huels",
      "jobType": "Consultant",
      "phoneNumber": "906-030-2437 x4449"
    },
    {
      "id": "19",
      "createdAt": "2020-03-31T20:10:01.740Z",
      "name": "Paris Kuhic",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/itskawsar/128.jpg",
      "firstName": "Candace",
      "lastName": "Terry",
      "jobType": "Executive",
      "phoneNumber": "1-692-857-5160 x87845"
    },
    {
      "id": "20",
      "createdAt": "2020-04-01T10:40:04.891Z",
      "name": "Quinten Lynch Sr.",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/albertaugustin/128.jpg",
      "firstName": "Felicita",
      "lastName": "Schaden",
      "jobType": "Associate",
      "phoneNumber": "299.009.5405 x12124"
    },
    {
      "id": "21",
      "createdAt": "2020-04-01T00:24:03.899Z",
      "name": "Russell Homenick",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/joelhelin/128.jpg",
      "firstName": "Francis",
      "lastName": "Krajcik",
      "jobType": "Consultant",
      "phoneNumber": "355-583-8214 x26210"
    },
    {
      "id": "22",
      "createdAt": "2020-04-01T09:37:47.600Z",
      "name": "Mylene Rolfson",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/arthurholcombe1/128.jpg",
      "firstName": "Nedra",
      "lastName": "Herzog",
      "jobType": "Technician",
      "phoneNumber": "1-011-119-9971 x252"
    },
    {
      "id": "23",
      "createdAt": "2020-04-01T08:04:17.499Z",
      "name": "Ms. Rachael Klein",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/lu4sh1i/128.jpg",
      "firstName": "Delphia",
      "lastName": "Wilderman",
      "jobType": "Specialist",
      "phoneNumber": "720-089-6200 x090"
    },
    {
      "id": "24",
      "createdAt": "2020-04-01T01:16:02.008Z",
      "name": "Olga DuBuque",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/boxmodel/128.jpg",
      "firstName": "Era",
      "lastName": "Vandervort",
      "jobType": "Supervisor",
      "phoneNumber": "526.210.4881 x958"
    },
    {
      "id": "25",
      "createdAt": "2020-04-01T06:01:25.702Z",
      "name": "Kailee Beier",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/surgeonist/128.jpg",
      "firstName": "Odie",
      "lastName": "Reilly",
      "jobType": "Developer",
      "phoneNumber": "118.992.0815"
    },
    {
      "id": "26",
      "createdAt": "2020-04-01T03:47:49.829Z",
      "name": "Marielle Moore",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/xalionmalik/128.jpg",
      "firstName": "Lonny",
      "lastName": "Schiller",
      "jobType": "Developer",
      "phoneNumber": "1-133-224-9314 x268"
    },
    {
      "id": "27",
      "createdAt": "2020-04-01T11:17:57.370Z",
      "name": "Dylan Nicolas",
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/n3dmax/128.jpg",
      "firstName": "Kaylah",
      "lastName": "Ziemann",
      "jobType": "Assistant",
      "phoneNumber": "819.679.4609 x942"
    },
    {
      "id": "28",
      "createdAt": "2020-04-01T01:30:38.567Z",
      "name": "Ricardo McClure III",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/emileboudeling/128.jpg",
      "firstName": "Maud",
      "lastName": "Schoen",
      "jobType": "Analyst",
      "phoneNumber": "123-200-4015 x18630"
    },
    {
      "id": "29",
      "createdAt": "2020-04-01T06:19:07.724Z",
      "name": "Gussie Kuhic MD",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/grrr_nl/128.jpg",
      "firstName": "Mathilde",
      "lastName": "Marvin",
      "jobType": "Facilitator",
      "phoneNumber": "914.251.2955"
    },
    {
      "id": "30",
      "createdAt": "2020-03-31T23:51:25.265Z",
      "name": "Nella Johnston",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/christianoliff/128.jpg",
      "firstName": "Jayce",
      "lastName": "Bailey",
      "jobType": "Representative",
      "phoneNumber": "1-210-691-3204"
    },
    {
      "id": "31",
      "createdAt": "2020-04-01T06:42:45.383Z",
      "name": "Lukas Gaylord",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/franciscoamk/128.jpg",
      "firstName": "Johnnie",
      "lastName": "Halvorson",
      "jobType": "Planner",
      "phoneNumber": "1-855-002-9843"
    },
    {
      "id": "32",
      "createdAt": "2020-04-01T08:47:35.371Z",
      "name": "Brennon Schuppe Jr.",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/karalek/128.jpg",
      "firstName": "Gussie",
      "lastName": "Funk",
      "jobType": "Consultant",
      "phoneNumber": "042-890-6571 x26101"
    },
    {
      "id": "33",
      "createdAt": "2020-03-31T17:24:48.663Z",
      "name": "Rolando Macejkovic",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/gmourier/128.jpg",
      "firstName": "Cornelius",
      "lastName": "Keebler",
      "jobType": "Associate",
      "phoneNumber": "059.028.4421"
    },
    {
      "id": "34",
      "createdAt": "2020-04-01T13:41:11.576Z",
      "name": "Otha Boehm",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/jjshaw14/128.jpg",
      "firstName": "Abdullah",
      "lastName": "O'Connell",
      "jobType": "Planner",
      "phoneNumber": "756-948-0378 x230"
    },
    {
      "id": "35",
      "createdAt": "2020-04-01T11:52:46.973Z",
      "name": "Selena Ankunding",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/marcomano_/128.jpg",
      "firstName": "Nichole",
      "lastName": "Brekke",
      "jobType": "Coordinator",
      "phoneNumber": "472-694-1130 x2310"
    },
    {
      "id": "36",
      "createdAt": "2020-03-31T23:06:43.253Z",
      "name": "Briana Morar",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/taylorling/128.jpg",
      "firstName": "Sheldon",
      "lastName": "Hilpert",
      "jobType": "Executive",
      "phoneNumber": "585.876.8611"
    },
    {
      "id": "37",
      "createdAt": "2020-04-01T05:27:52.242Z",
      "name": "Quincy Ebert",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/sreejithexp/128.jpg",
      "firstName": "Abby",
      "lastName": "Wyman",
      "jobType": "Director",
      "phoneNumber": "1-056-978-3815"
    },
    {
      "id": "38",
      "createdAt": "2020-04-01T11:26:14.510Z",
      "name": "Marilie Trantow",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/holdenweb/128.jpg",
      "firstName": "Jeramie",
      "lastName": "Predovic",
      "jobType": "Designer",
      "phoneNumber": "602-848-8694 x9917"
    },
    {
      "id": "39",
      "createdAt": "2020-03-31T17:47:16.655Z",
      "name": "Mrs. Leila Waelchi",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/joshmedeski/128.jpg",
      "firstName": "Lemuel",
      "lastName": "Corkery",
      "jobType": "Agent",
      "phoneNumber": "867.286.9793"
    },
    {
      "id": "40",
      "createdAt": "2020-04-01T14:20:20.415Z",
      "name": "Alvis Fisher",
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/gkaam/128.jpg",
      "firstName": "Jan",
      "lastName": "Jerde",
      "jobType": "Analyst",
      "phoneNumber": "190-856-0925"
    },
    {
      "id": "41",
      "createdAt": "2020-04-01T14:48:39.835Z",
      "name": "Manley Goldner",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/claudioguglieri/128.jpg",
      "firstName": "Narciso",
      "lastName": "Prosacco",
      "jobType": "Planner",
      "phoneNumber": "051-726-7099"
    },
    {
      "id": "42",
      "createdAt": "2020-04-01T00:11:01.216Z",
      "name": "Ottis Homenick",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/itstotallyamy/128.jpg",
      "firstName": "Leonie",
      "lastName": "Kessler",
      "jobType": "Analyst",
      "phoneNumber": "1-353-554-6137 x2122"
    },
    {
      "id": "43",
      "createdAt": "2020-04-01T10:47:15.910Z",
      "name": "Alene Wisozk",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/dixchen/128.jpg",
      "firstName": "Adaline",
      "lastName": "Crooks",
      "jobType": "Analyst",
      "phoneNumber": "(059) 973-4569"
    },
    {
      "id": "44",
      "createdAt": "2020-03-31T23:00:09.842Z",
      "name": "Lexi Green",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/yehudab/128.jpg",
      "firstName": "Lois",
      "lastName": "Hintz",
      "jobType": "Director",
      "phoneNumber": "527-268-7462 x721"
    },
    {
      "id": "45",
      "createdAt": "2020-04-01T01:06:12.847Z",
      "name": "Autumn Davis MD",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/dshster/128.jpg",
      "firstName": "Noelia",
      "lastName": "Terry",
      "jobType": "Specialist",
      "phoneNumber": "461-498-2583 x852"
    },
    {
      "id": "46",
      "createdAt": "2020-03-31T18:20:50.769Z",
      "name": "Kole VonRueden",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/noxdzine/128.jpg",
      "firstName": "Brielle",
      "lastName": "Nicolas",
      "jobType": "Facilitator",
      "phoneNumber": "1-596-734-8878 x14875"
    },
    {
      "id": "47",
      "createdAt": "2020-04-01T13:21:13.943Z",
      "name": "Torrance Huel",
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/ffbel/128.jpg",
      "firstName": "Reymundo",
      "lastName": "Cole",
      "jobType": "Developer",
      "phoneNumber": "625.579.0766"
    },
    {
      "id": "48",
      "createdAt": "2020-04-01T06:35:48.497Z",
      "name": "Rogelio Legros",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/megdraws/128.jpg",
      "firstName": "Alison",
      "lastName": "Rutherford",
      "jobType": "Associate",
      "phoneNumber": "1-632-236-4221 x25769"
    },
    {
      "id": "49",
      "createdAt": "2020-04-01T06:40:25.808Z",
      "name": "Abdullah Stehr",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/leandrovaranda/128.jpg",
      "firstName": "Albin",
      "lastName": "Flatley",
      "jobType": "Analyst",
      "phoneNumber": "886.981.8592 x8067"
    },
    {
      "id": "50",
      "createdAt": "2020-04-01T06:33:39.721Z",
      "name": "Arnoldo Howe",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/hugocornejo/128.jpg",
      "firstName": "Tyrique",
      "lastName": "Koelpin",
      "jobType": "Strategist",
      "phoneNumber": "983.315.0890 x4954"
    },
    {
      "id": "51",
      "createdAt": "2020-04-01T00:51:37.463Z",
      "name": "Brielle Lesch",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/chanpory/128.jpg",
      "firstName": "Lisette",
      "lastName": "Ledner",
      "jobType": "Assistant",
      "phoneNumber": "1-210-529-9063 x3886"
    },
    {
      "id": "52",
      "createdAt": "2020-04-01T07:48:06.620Z",
      "name": "Evan Marquardt II",
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/kerem/128.jpg",
      "firstName": "Narciso",
      "lastName": "Dare",
      "jobType": "Executive",
      "phoneNumber": "608-219-3271"
    },
    {
      "id": "53",
      "createdAt": "2020-04-01T10:01:32.609Z",
      "name": "Lourdes Grady",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/Chakintosh/128.jpg",
      "firstName": "Francesca",
      "lastName": "Morissette",
      "jobType": "Director",
      "phoneNumber": "(677) 435-1262 x94899"
    }
  ];
}
