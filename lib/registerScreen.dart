import 'package:flutter/material.dart';

List<String> city = ['', 'ankara', 'istanbul', 'izmir'];
List<String> ankara = ['', 'kızılay', 'ulus', 'cankaya'];
List<String> istanbul = ['', 'kadıkoy', 'sisli', 'besiktas'];
List<String> izmir = ['', 'karsiyaka', 'konak', 'bornova'];

Map<String, List<String>> city1 = {
  'ankara': ['', 'kızılay', 'ulus', 'cankaya'],
  'istanbul': ['', 'kadıkoy', 'sisli', 'besiktas'],
  'izmir': ['', 'karsiyaka', 'konak', 'bornova']
};

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCityName = null;
  String? selectedReigon = null;
  String? selectedGender = null;
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isRegionVisible = false;
  bool isCitySelected = false;
  bool isRegionSelected = false;
  bool accepted = false;
  bool termValid = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [Colors.deepOrange, Colors.white],
          //   ),
          // ),
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text('Email*'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (emailValid == false) {
                      return 'Email for is not valid';
                    }
                    return null;
                  },
                  controller: emailController,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    label: Text('Name'),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    if (value.length <= 2) {
                      return 'too short';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    label: Text('Surname'),
                  ),
                  controller: surnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Surname is required ';
                    }
                    if (value.length <= 2) {
                      return 'too short';
                    }
                    return null;
                  },
                ),
                DropdownButton(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  isExpanded: true,
                  hint: Text('Select City'),
                  borderRadius: BorderRadius.circular(20),
                  value: selectedCityName,
                  onChanged: (String? value) {
                    setState(() {
                      selectedCityName = value!;
                      if (value == null || value.isEmpty) {
                        isCitySelected = true;
                        isRegionVisible = false;
                      } else {
                        isRegionVisible = true;
                        isCitySelected = false;
                      }
                      selectedReigon = null;
                    });
                  },
                  items: city.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value == '' ? 'Select' : value),
                    );
                  }).toList(),
                ),
                Visibility(
                    visible: isCitySelected,
                    child: const Text(
                      'Select a city',
                      style: TextStyle(color: Colors.red),
                    )),
                Visibility(
                  visible: isRegionVisible,
                  child: DropdownButton(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    isExpanded: true,
                    hint: Text('Select Reigon'),
                    borderRadius: BorderRadius.circular(20),
                    value: selectedReigon,
                    onChanged: (String? value) {
                      setState(() {
                        selectedReigon = value!;
                        if (value == null || value.isEmpty) {
                          isRegionSelected = true;
                        } else {
                          isRegionVisible = true;
                          isRegionSelected = false;
                        }
                        selectedReigon = value;
                      });
                    },
                    // items: ankara.map<DropdownMenuItem<String>>((String value) {
                    //   return DropdownMenuItem<String>(
                    //     value: value,
                    //     child: Text(value),
                    //   );
                    // }).toList(),
                    items: getRegionsItems(),
                  ),
                ),
                Visibility(
                    visible: isRegionSelected,
                    child: const Text(
                      'Select a Region',
                      style: TextStyle(color: Colors.red),
                    )),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(),
                    ),
                    RadioListTile(
                        title: const Text('male'),
                        value: 'male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            print(selectedGender);
                            selectedGender = value.toString();
                          });
                        }),
                    RadioListTile(
                        title: const Text('female'),
                        value: 'female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        }),
                    RadioListTile(
                        title: const Text('I am gay'),
                        value: 'I am gay',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        }),
                    RadioListTile(
                        title: const Text('I am SUPER gay'),
                        value: 'I am SUPER gay',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        }),
                  ],
                ),
                CheckboxListTile(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  title: const Text('Accept terms and ...',
                      style: TextStyle(fontSize: 14)),
                  value: accepted,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        accepted = true;
                        termValid = false;
                      } else {
                        accepted = false;
                        termValid = true;
                      }
                      // accepted = true;
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    if (accepted == false) {
                      return setState(() {
                        null;
                      });
                    } else {
                      accepted = true;
                    }
                    if (_formKey.currentState!.validate() == false) return;
                    print(surnameController.text);
                    print(nameController.text);
                    print(emailController.text);
                    print(selectedCityName.toString());
                    print(selectedReigon.toString());
                    print(selectedGender.toString());
                  },
                  child: const Text('save'),
                ),
                Visibility(
                    visible: termValid,
                    child: const Text(
                      'Did u read Term ?',
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>>? getRegionsItems() {
    var firstOrNull = city1.entries
        .where((element) => element.key == selectedCityName)
        .firstOrNull;
    if (firstOrNull == null) {
      return null;
    } else {
      return firstOrNull.value.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value == '' ? 'sec' : value),
        );
      }).toList();
    }
  }
}
//validator:(value) if (value == null || value.isEmpty || EmailValidator.validate(value)  ) {
//return 'hata';
//}
//return null;
