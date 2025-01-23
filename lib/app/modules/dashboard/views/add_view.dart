import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:project_latihan/app/modules/dashboard/controllers/dashboard_controller.dart';

class AddView extends GetView {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Event'),
        centerTitle: true,
        backgroundColor: HexColor('#feeee8'),
      ),
      backgroundColor: HexColor('#feeee8'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Event Name',
                hintText: 'Masukan Nama Event',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
                hintText: 'Masukan Deskripsi', 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: controller.eventDateController,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Event Date',
                hintText: 'Masukan Tanggal Event',
              ),
              onTap: () async {
                DateTime? selecteDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2100),
                  );
                  if (selecteDate != null) {
                    controller.eventDateController.text = DateFormat('yyyy-MM-dd').format(selecteDate);
                  }
                 },
                ),
              ),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15), // Jarak biar lega
            child: TextField(
              controller: controller.locationController, // Controller lokasi
              decoration: const InputDecoration(
                border: OutlineInputBorder(), // Border biar kotak
                labelText: 'Location', // Labelnya lokasi, jelas banget
                hintText: 'Masukan Lokasi Event', // Petunjuk buat isi lokasi
              ),
            ),
          ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20), 
              ),
              child: TextButton(
                onPressed: () {
                  controller.addEvent();;
                },
                child: const Text(
                'Submit', 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 25,
                ),
               ),
              ),
            ),    
           ],
          ),
        );
      }
    }