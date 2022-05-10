import 'package:flutter/material.dart';
import 'package:imd0509_projeto/components/available_doctors_list.dart';

import '../models/doctor.dart';
import '../utils/app_routes.dart';
import '../utils/mock/doctorsList.dart';

class AvailableDoctors extends StatefulWidget {
  @override
  State<AvailableDoctors> createState() => _AvailableDoctorsState();
}

class _AvailableDoctorsState extends State<AvailableDoctors> {
  List<Doctor> _doctorsList = doctorsListMocked;
  List<Doctor> _filteredListDoctors = [];
  String _searchText = '';
  final _searchDoctorController = TextEditingController();

  initState() {
    // at the beginning, all users are shown
    _filteredListDoctors = _doctorsList;
    super.initState();
  }

  _filterDoctors(String value) {
    print(value);
    setState(() {
      _filteredListDoctors = _doctorsList
          .where((doctor) =>
              doctor.name.toLowerCase().contains(value.toLowerCase()) ||
              value == '')
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(242, 242, 242, 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchDoctorController,
              onChanged: _filterDoctors,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      _searchDoctorController.text = '';
                    },
                    child: Icon(Icons.close)),
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(18.0),
                label: Text(
                  'Nome do profissional',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.bold),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                    borderRadius: BorderRadius.circular(0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Médicos disponíveis',
              style:
                  TextStyle(color: Color.fromRGBO(28, 45, 62, 1), fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            AvailableDoctorsList(_filteredListDoctors)
          ],
        ),
      ),
    );
  }
}