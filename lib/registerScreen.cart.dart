import 'package:flutter/material.dart';

List<String> city = ['', 'ankara', 'istanbul', 'izmir'];
List<String> ankara = ['kızılay', 'ulus', 'cankaya'];
List<String> istanbul = ['kadıkoy', 'sisli', 'besiktas'];
List<String> izmir = ['karsiyaka', 'konak', 'bornova'];

Map<String, List<String>> city1 = {
  'ankara': ['kızılay', 'ulus', 'cankaya'],
  'istanbul': ['kadıkoy', 'sisli', 'besiktas'],
  'izmir': ['karsiyaka', 'konak', 'bornova']
};

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCityName = null;

  //String selectedCity = ankara.first;
  String? selectedReigon = null;

  bool isVisible = false;

  // var email;
  // var isim;
  // var soyisim = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  label: Text('Email*'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'bos olamaz';
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (emailValid == false) {
                    return 'format hatalı';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('isim'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length <= 2) {
                    return 'too short';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('soyisim'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length <= 2) {
                    return 'too short';
                  }
                  return null;
                },
              ),
              DropdownButton(
                value: selectedCityName,
                onChanged: (String? value) {
                  setState(() {
                    selectedCityName = value!;
                    if (value == null || value.isEmpty)
                      isVisible = false;
                    else {
                      isVisible = true;
                    }
                    selectedReigon = null;
                  });
                },
                items: city.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'sec' : value),
                  );
                }).toList(),
              ),
              Visibility(
                visible: isVisible,
                child: DropdownButton(
                  value: selectedReigon,
                  onChanged: (String? value) {
                    setState(() {
                      selectedReigon = value!;
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
              TextButton(
                onPressed: () {},
                child: Text('save'),
              )
            ],
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
          child: Text(value),
        );
      }).toList();
    }
  }
}
//validator:(value) if (value == null || value.isEmpty || EmailValidator.validate(value)  ) {
//return 'hata';
//}
//return null;
