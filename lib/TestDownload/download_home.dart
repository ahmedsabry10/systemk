
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:systemk/TestDownload/download_api.dart';
import 'package:systemk/TestDownload/image_page.dart';
import 'package:systemk/TestDownload/model.dart';
import 'package:systemk/TestDownload/pdfviewr.dart';

class DownloadMainPage extends StatefulWidget {
  @override
  _DownloadMainPageState createState() => _DownloadMainPageState();
}

class _DownloadMainPageState extends State<DownloadMainPage> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = DownloadFirebaseApi.listAll('files/');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(



    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Some error occurred!'));
              } else {
                final files = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(files.length),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          final file = files[index];

                          return buildFile(context, file);
                        },
                      ),
                    ),
                  ],
                );
              }
          }
        },
      ),
    ),
  );

  Widget buildFile(BuildContext context, FirebaseFile file) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: ClipOval(
        child:

        file.url.contains( '.pdf')
             ?
        Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoEiPihPI2dvUX1smKI175sDLRkIjdbWr2Kw&usqp=CAU',
          width: 52,
          height: 52,
          fit: BoxFit.cover,
        ): Image.network(
          file.url,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
        )
        ,
      ),
      title: Text(
        file.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
      onTap: () =>  file.url.contains( '.pdf')? Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PdfViewer("${file.url}") ,
      )): Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>ImagePage(file: file) ,),
    )),
  );

  Widget buildHeader(int length) => Container(
    decoration: BoxDecoration(
      color: Colors.grey[600]?.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      leading: Container(
        width: 52,
        height: 52,
        child: Icon(
          Icons.file_copy,
          color: Colors.white,
        ),
      ),
      title: Text(
        '$length Files',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}