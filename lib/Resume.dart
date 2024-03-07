import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String field;

  final String name;
  final String email;
  final String phoneNumber;
  final String linkdien;
  final String city;
  final String education;
  final String degree;
  // final String workExperience;
  // final String skillss;

  final List<String> languages;
  final List<String> skillss;
  final List<String> contact;

  const NextPage({
    Key? key,
    required this.contact,
    required this.field,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.linkdien,
    required this.city,
    required this.education,
    required this.degree,
    // required this.workExperience,
    required this.skillss,
    required this.languages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.grey,
                  color: const Color.fromARGB(255, 63, 61, 61),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 10),
                        child: Text(
                          '$name',
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '$field',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  // color: Colors.grey,
                  color: const Color.fromARGB(255, 63, 61, 61),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'CONTACT ME',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        '$phoneNumber',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '$email',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '$linkdien',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '$city',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  color: const Color.fromARGB(255, 63, 61, 61),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'WORK EXPERIENCE',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: contact.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            contact[index],
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  // color: Colors.grey,
                  color: const Color.fromARGB(255, 63, 61, 61),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'EDUCATION',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 17, right: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$degree',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '$education',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  // color: Colors.grey,
                  color: const Color.fromARGB(255, 63, 61, 61),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'SKILLS',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: skillss.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            skillss[index],
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  // color: Colors.grey,
                  color: const Color.fromARGB(255, 63, 61, 61),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'LANGUAGE',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            languages[index],
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 40,
                  // color: Colors.blueGrey,
                  color: const Color.fromARGB(255, 63, 61, 61),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Edit Resume',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
