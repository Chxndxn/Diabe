// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors, unnecessary_this, prefer_interpolation_to_compose_strings, unused_field

import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabe/model/function.dart';
import 'package:diabe/model/previous_state.dart';
import 'package:diabe/model/user_model.dart';
import 'package:diabe/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:diabe/provider/home_provider.dart';

import '../report/report.dart';

class Predictform extends StatefulWidget {
  static const routeName = '/predict';

  const Predictform({Key? key}) : super(key: key);

  @override
  State<Predictform> createState() => _PredictformState();
}

class _PredictformState extends State<Predictform> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  HomeProvider _homeProvider = HomeProvider();

  String url = '';
  // ignore: prefer_typing_uninitialized_variables
  var pdata;
  String output = '0';

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then(
        (value) => {
              this.loggedInUser = UserModel.fromMap(value.data()),
              setState(() {})
            });
  }

  //form key
  final _formkey = GlobalKey<FormState>();
  //controller
  final TextEditingController pregnanciescontroller =
      new TextEditingController();
  final TextEditingController glucosecontroller = new TextEditingController();
  final TextEditingController bloodpressurecontroller =
      new TextEditingController();
  final TextEditingController skinthicknesscontroller =
      new TextEditingController();
  final TextEditingController insulincontroller = new TextEditingController();
  final TextEditingController bmicontroller = new TextEditingController();
  final TextEditingController diabetespedigreefunccontroller =
      new TextEditingController();
  final TextEditingController agecontroller = new TextEditingController();

  //firebase

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Pregnanciesfield
    final pregnancyfield = TextFormField(
      autofocus: false,
      controller: pregnanciescontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      // validator: (){},
      onSaved: (value) {
        pregnanciescontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Pregnancy",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "If Male input 0.",
      ),
    );

    //Glucosefield
    final glucosefield = TextFormField(
      autofocus: false,
      controller: glucosecontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      // validator: (){},
      onSaved: (value) {
        glucosecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Glucose",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "Use a Glucometer to measure. Enter unit in mg/dL.",
      ),
    );

    //Bloodpressurefield
    final bloodpressurefield = TextFormField(
      autofocus: false,
      controller: bloodpressurecontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      // validator: (){},
      onSaved: (value) {
        glucosecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Blood Pressure",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "Use a BP Monitor to measure. Enter unit in mmHg.",
      ),
    );

    //skinthicknessfield
    final skinthicknessfield = TextFormField(
      autofocus: false,
      controller: skinthicknesscontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      // validator: (){},
      onSaved: (value) {
        skinthicknesscontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Skin Tickness",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText:
            "Pinch skin over triceps, measure distance between fingers in mm.",
      ),
    );

    //insulinfield
    final insulinfield = TextFormField(
      autofocus: false,
      controller: insulincontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      // validator: (){},
      onSaved: (value) {
        insulincontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Insulin",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "Use a Glucometer to measure. Enter unit in muU/mL.",
      ),
    );

    //bmifield
    final bmifield = TextFormField(
      autofocus: false,
      controller: bmicontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      // validator: (){},
      onSaved: (value) {
        bmicontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "BMI",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "BMI= weight in kg by square of height in m.",
      ),
    );

    //diabetespediegreefuncfield
    final diabetespedigreefuncfield = TextFormField(
      autofocus: false,
      controller: diabetespedigreefunccontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      // validator: (){},
      onSaved: (value) {
        diabetespedigreefunccontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Diabetes Pedigree Value",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText:
            "= No. of diabetes patients in family by No. of members in family.",
      ),
    );

    //agefield
    final agefield = TextFormField(
      autofocus: false,
      controller: agecontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
      ],
      // validator: (){},
      onSaved: (value) {
        agecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Age",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "Enter age in years",
      ),
    );

    //predict
    final saveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          // send data to api
          url =
              'http://flaskdiabe-env.eba-uz5bxzqa.us-east-1.elasticbeanstalk.com/predict?data=' +
                  pregnanciescontroller.text.toString() +
                  "," +
                  glucosecontroller.text.toString() +
                  "," +
                  bloodpressurecontroller.text.toString() +
                  "," +
                  skinthicknesscontroller.text.toString() +
                  "," +
                  insulincontroller.text.toString() +
                  "," +
                  bmicontroller.text.toString() +
                  "," +
                  diabetespedigreefunccontroller.text.toString() +
                  "," +
                  agecontroller.text.toString();

          pdata = await fetchdata(url);
          String decoded = jsonDecode(pdata).toString();

          setState(() {
            output = decoded;
          });

          save(
              pregnanciescontroller.text,
              glucosecontroller.text,
              bloodpressurecontroller.text,
              skinthicknesscontroller.text,
              insulincontroller.text,
              bmicontroller.text,
              diabetespedigreefunccontroller.text,
              agecontroller.text,
              output);
        },
        child: Text(
          "Save",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45),
                    glucosefield,
                    SizedBox(height: 20),
                    bloodpressurefield,
                    SizedBox(height: 20),
                    skinthicknessfield,
                    SizedBox(height: 20),
                    insulinfield,
                    SizedBox(height: 20),
                    bmifield,
                    SizedBox(height: 20),
                    diabetespedigreefuncfield,
                    SizedBox(height: 20),
                    agefield,
                    SizedBox(
                      height: 20,
                    ),
                    pregnancyfield,
                    SizedBox(height: 20),
                    saveButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void save(
      String pregnancy,
      String glucose,
      String bloodpressure,
      String skinthickness,
      String insulin,
      String bmi,
      String diabetespedigreefunc,
      String age,
      String output) async {
    if (_formkey.currentState!.validate()) {
      try {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        StateModal stateModal = StateModal();
        stateModal.pregnancy = pregnanciescontroller.text;
        stateModal.glucose = glucosecontroller.text;
        stateModal.bloodpressure = bloodpressurecontroller.text;
        stateModal.skinthickness = skinthicknesscontroller.text;
        stateModal.insulin = insulincontroller.text;
        stateModal.bmi = bmicontroller.text;
        stateModal.diabetespedigreefunc = diabetespedigreefunccontroller.text;
        stateModal.age = agecontroller.text;
        stateModal.output = output;

        await firebaseFirestore
            .collection("users")
            .doc(user?.uid)
            .collection("history")
            .doc("record")
            .set(stateModal.tomap());
        Fluttertoast.showToast(msg: "Data Added Sucessfully");

        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
