import 'package:flutter/material.dart';
import 'package:flutter_application_4_abhay/Resume.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(
      preferences: prefs,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({required this.preferences});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageForm(preferences: preferences),
    );
  }
}

class LanguageForm extends StatefulWidget {
  final SharedPreferences preferences;

  const LanguageForm({required this.preferences});

  @override
  _LanguageFormState createState() => _LanguageFormState();
}

class _LanguageFormState extends State<LanguageForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<TextEditingController> controllers = [TextEditingController()];
  List<TextEditingController> controllerss = [TextEditingController()];
  List<TextEditingController> ContactController = [TextEditingController()];

  TextEditingController fieldController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  // TextEditingController experienceController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController linkdienController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  void addcontactTextField() {
    setState(() {
      ContactController.add(TextEditingController());
    });
  }

  void removecontactTextField(int index) {
    if (index > 0) {
      setState(() {
        ContactController.removeAt(index);
      });
    }
  }

  void addTextField() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void removeTextField(int index) {
    if (index > 0) {
      setState(() {
        controllers.removeAt(index);
      });
    }
  }

  void addTextFields() {
    setState(() {
      controllerss.add(TextEditingController());
    });
  }

  void removeTextFields(int index) {
    if (index > 0) {
      setState(() {
        controllerss.removeAt(index);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    setState(() {
      fieldController.text = widget.preferences.getString('field') ?? '';

      nameController.text = widget.preferences.getString('name') ?? '';
      emailController.text = widget.preferences.getString('email') ?? '';
      phoneController.text = widget.preferences.getString('phone') ?? '';
      linkdienController.text = widget.preferences.getString('linkdien') ?? '';
      cityController.text = widget.preferences.getString('city') ?? '';
      degreeController.text = widget.preferences.getString('degree') ?? '';
      educationController.text =
          widget.preferences.getString('education') ?? '';
      // experienceController.text =
      //     widget.preferences.getString('experience') ?? '';

      List<String>? contact = widget.preferences.getStringList('contact');
      if (contact != null) {
        for (int i = 0; i < contact.length; i++) {
          if (i < ContactController.length) {
            ContactController[i].text = contact[i];
          } else {
            ContactController.add(TextEditingController(text: contact[i]));
          }
        }
      }

      List<String>? languages = widget.preferences.getStringList('languages');
      if (languages != null) {
        for (int i = 0; i < languages.length; i++) {
          if (i < controllers.length) {
            controllers[i].text = languages[i];
          } else {
            controllers.add(TextEditingController(text: languages[i]));
          }
        }
      }

      List<String>? skills = widget.preferences.getStringList('skills');
      if (skills != null) {
        for (int i = 0; i < skills.length; i++) {
          if (i < controllerss.length) {
            controllerss[i].text = skills[i];
          } else {
            controllerss.add(TextEditingController(text: skills[i]));
          }
        }
      }
    });
  }

  Future<void> _saveallfield() async {
    SharedPreferences prefs = widget.preferences;
    await prefs.setString('field', fieldController.text);
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('linkdien', linkdienController.text);
    await prefs.setString('city', cityController.text);
    await prefs.setString('degree', degreeController.text);
    await prefs.setString('education', educationController.text);
    // await prefs.setString('experience', experienceController.text);

    List<String> contact =
        ContactController.map((ContactController) => ContactController.text)
            .toList();
    await prefs.setStringList('contact', contact);

    List<String> languages =
        controllers.map((controller) => controller.text).toList();
    await prefs.setStringList('languages', languages);
    List<String> skills =
        controllerss.map((controller) => controller.text).toList();
    await prefs.setStringList('skills', skills);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 61, 61),
        title: const Text("Resme App"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Your Field',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fieldController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Field";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "Enter Field",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Name";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "Full name",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return "Enter Id";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "Email Id",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "Mobile Number",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: linkdienController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Linkdien URL";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "Linkdien URL",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cityController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "City";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "City ",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Work Experience',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: ContactController.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: TextFormField(
                                controller: ContactController[index],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Experience";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  labelText: 'Experience ',
                                  // labelText: 'Experience ${index + 1}',
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              removecontactTextField(index);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12, bottom: 10),
                        child: MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            addcontactTextField();
                          },
                          child: const Text(
                            'Add Experience',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text('Education',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 7.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: degreeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Education";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "Enter Education",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: educationController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter College name";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        labelText: "College name",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Skills',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controllerss.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: TextFormField(
                                controller: controllerss[index],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Language";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  labelText: 'Skills ${index + 1}',
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              removeTextFields(index);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            addTextFields();
                          },
                          child: const Text(
                            'Add Skills',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Language',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controllers.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: TextFormField(
                                controller: controllers[index],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Language";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  labelText: 'Language ${index + 1}',
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              removeTextField(index);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            addTextField();
                          },
                          child: const Text(
                            'Add Language',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 50),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      // color: Colors.blueGrey,
                      color: const Color.fromARGB(255, 63, 61, 61),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          List<String> contact = ContactController.map(
                              (ContactControllers) =>
                                  ContactControllers.text).toList();

                          List<String> languages = controllers
                              .map((controller) => controller.text)
                              .toList();
                          List<String> skillss = controllerss
                              .map((controllers) => controllers.text)
                              .toList();
                          await _saveallfield();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextPage(
                                field: fieldController.text,
                                name: nameController.text,
                                email: emailController.text,
                                phoneNumber: phoneController.text,
                                linkdien: linkdienController.text,
                                city: cityController.text,
                                degree: degreeController.text,
                                education: educationController.text,
                                // workExperience: experienceController.text,
                                languages: languages,
                                skillss: skillss,
                                contact: contact,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Create Resume',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
