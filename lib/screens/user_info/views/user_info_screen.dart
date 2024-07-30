import 'package:flutter/material.dart';
import 'package:shop/constants.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = "Anusit";
  String _surname = "Srikhirin";
  String _username = "anusit47";
  String _email = "threeninja.work@gmail.com";
  String _phone = "123-456-7890";
  String _birthday = "13/04/2004";
  String _gender = "Male";
  String _country = "Thailand";
  final String _imageSrc =
      "https://scontent.fnak4-1.fna.fbcdn.net/v/t39.30808-1/247401069_2674942402801428_1510295725705619951_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=SmDHOPxJIPAQ7kNvgGgQTDC&_nc_ht=scontent.fnak4-1.fna&oh=00_AYD_nkjF-n2BgCnYi9HMpmPO5j2gHX8Zso1s7q2KrrjcIw&oe=66AE67EE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_imageSrc),
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                initialValue: _username,
                decoration: InputDecoration(labelText: 'Username'),
                onSaved: (value) {
                  _username = value!;
                },
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                initialValue: _surname,
                decoration: InputDecoration(labelText: 'Surname'),
                onSaved: (value) {
                  _surname = value!;
                },
              ),
              const SizedBox(height: defaultPadding),
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: InputDecoration(labelText: 'Gender'),
                items: ["Male", "Female", "Other"]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                initialValue: _phone,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                initialValue: _birthday,
                decoration: InputDecoration(labelText: 'Birthday'),
                keyboardType: TextInputType.datetime,
                onSaved: (value) {
                  _birthday = value!;
                },
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                initialValue: _country,
                decoration: InputDecoration(labelText: 'Country'),
                onSaved: (value) {
                  _country = value!;
                },
              ),
              const SizedBox(height: defaultPadding),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save user info to the server or database
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
