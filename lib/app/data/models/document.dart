class AllDocuments {
  List<Document>? myDocs;

  AllDocuments({this.myDocs});

  AllDocuments.fromJson(Map<String, dynamic> json) {
    if (json['myDocs'] != null) {
      myDocs = <Document>[];
      json['myDocs'].forEach((v) {
        myDocs!.add(Document.fromJson(v));
      });
    }
  }
}

class Document {
  String? iD;
  String? filename;

  Document({
    this.iD,
    this.filename,
  });

  Document.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    filename = json['Filename'];
  }
}
