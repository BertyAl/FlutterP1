import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../utils/colors.dart'; // Import untuk FormBuilderValidators

class HelpSupportScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan & Dukungan'),
        backgroundColor: main1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactInfo(),
            SizedBox(height: 20),
            _buildFAQSection(),
            SizedBox(height: 20),
            _buildFeedbackForm(context),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContactInfo() {
    return Card(
      color: upper1,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Kontak Yang Dapat Dihubungi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Email: albert.535220024@stu.untar.ac.id'),
            Text('Telepon: -'),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQSection() {
    return Card(
      color: upper1,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pertanyaan yang Sering Diajukan (FAQ)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildFAQItem('Bagaimana cara menggunakan layanan shuttle?', 'Anda dapat menggunakan layanan shuttle dengan datang langsung ke tempat sesuai jam operasional'),
            _buildFAQItem('Jam operasional shuttle?', 'Jadwal Shuttle sudah ada pada halaman yang tersedia'),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(answer),
        ),
      ],
    );
  }

  Widget _buildFeedbackForm(BuildContext context) {
    return Card(
      color: upper1,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kirim Masalah atau Umpan Balik',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(
                  labelText: 'Nama Anda',
                ),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                  labelText: 'Email Anda',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'issue',
                decoration: InputDecoration(
                  labelText: 'Deskripsikan masalah Anda',
                ),
                maxLines: 5,
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = _formKey.currentState?.value;
                    print('Data Form: $formData');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Umpan balik berhasil dikirim!')),
                    );
                  }
                },
                child: Text('Kirim' ,style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
