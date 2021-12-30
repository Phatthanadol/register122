import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:register122/model/faculty.dart';
import 'package:register122/model/favpet.dart';
import 'package:register122/model/major.dart';
import 'package:register122/model/year.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _stdid = TextEditingController();

  String? groupYear;
  List<Year>? years;
  String? groupMajor;
  List<Major>? majors;
  List<ListItem> types = ListItem.getItem();
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectedTypeItem;

  List checkedPet = [];
  List<Pet>? pets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    majors = Major.getMajor();
    years = Year.getYear();
    _dropdownMenuItem = createDropdownMenuItem(types);
    _selectedTypeItem = _dropdownMenuItem[0].value!;
    pets = Pet.getPet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: register(),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'ชั้นปี',
                style: GoogleFonts.amiko(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: createRadioYear(),
              ),
            ),
            Text('Year Selected: ${groupYear}'),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'สาขา',
                style: GoogleFonts.amiko(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: createRadioMajor(),
              ),
            ),
            Text('Major Selected: ${groupMajor}'),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'คณะ',
                style: GoogleFonts.amiko(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: DropdownButton(
                value: _selectedTypeItem,
                items: _dropdownMenuItem,
                onChanged: (ListItem? value) {
                  setState(() {
                    _selectedTypeItem = value!;
                  });
                },
              ),
            ),
            Text('Faculty Selected: ${_selectedTypeItem.name}'),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'สัตว์เลี้ยงที่ชอบ',
                style: GoogleFonts.amiko(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: createCheckPet(),
              ),
            ),
            Text('Pet Selected: ${checkedPet}'),
            const SizedBox(
              height: 16,
            ),
            submitbutton(),
          ],
        ),
      ),
    );
  }

  Widget register() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstname,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกชื่อของท่าน";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'ชื่อ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastname,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกนามสกุลของท่าน";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'นามสกุล',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _stdid,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกรหัสนิสิตของท่าน";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'รหัสนิสิต',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          )
        ],
      ),
    );
  }

  Widget submitbutton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _showMyDialog();
        }
      },
      child: Text(
        'ยืนยัน',
        style: GoogleFonts.amiko(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> createRadioYear() {
    List<Widget> listYear = [];

    for (var year in years!) {
      listYear.add(
        RadioListTile<dynamic>(
          title: Text(year.year!),
          value: year.year,
          groupValue: groupYear,
          onChanged: (value) {
            setState(() {
              groupYear = value;
            });
          },
        ),
      );
    }
    return listYear;
  }

  List<Widget> createRadioMajor() {
    List<Widget> listMajor = [];

    for (var major in majors!) {
      listMajor.add(
        RadioListTile<dynamic>(
          title: Text(major.majornameth!),
          subtitle: Text(major.majornameen!),
          value: major.majornameth,
          groupValue: groupMajor,
          onChanged: (value) {
            setState(() {
              groupMajor = value;
            });
          },
        ),
      );
    }
    return listMajor;
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
      List<ListItem> types) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var item in types) {
      items.add(DropdownMenuItem(
        child: Text(item.name!),
        value: item,
      ));
    }

    return items;
  }

  List<Widget> createCheckPet() {
    List<Widget> listPet = [];

    for (var pet in pets!) {
      listPet.add(CheckboxListTile(
        value: pet.checked,
        title: Text(pet.type!),
        onChanged: (value) {
          setState(() {
            pet.checked = value;
          });

          if (value!) {
            checkedPet.add(pet.type);
          } else {
            checkedPet.remove(pet.type);
          }
        },
      ));
    }
    return listPet;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ข้อมูลของท่าน'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('ชื่อ : ${_firstname.text} ${_lastname.text}'),
                Text('รหัสนิสิต : ${_stdid.text}'),
                Text(
                    'คณะ : คณะ${_selectedTypeItem.name} สาขา${groupMajor} ${groupYear}'),
                Text('สัตว์เลี้ยงที่ชอบ : ${checkedPet}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ยืนยัน'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
