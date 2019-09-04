/* 
  This class has been auto-generatedwith https://javiercbk.github.io/json_to_dart/
  It is used to read the JSON file fetch from Phil27 API
*/

class Event {
  String iD;
  String place;
  String date;
  String imageUrl;
  String imageWideUrl;
  String presellingStartDate;
  String title1;
  String category;
  String ticketUrl;
  String title2;
  String gpsLocation;
  String description;
  List<Cast> cast;
  List<Program> program;

  Event(
      {this.iD,
      this.place,
      this.date,
      this.imageUrl,
      this.imageWideUrl,
      this.presellingStartDate,
      this.title1,
      this.category,
      this.ticketUrl,
      this.title2,
      this.gpsLocation,
      this.description,
      this.cast,
      this.program});

  Event.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    place = json['Place'];
    date = json['Date'];
    imageUrl = json['ImageUrl'];
    imageWideUrl = json['ImageWideUrl'];
    presellingStartDate = json['PresellingStartDate'];
    title1 = json['Title1'];
    category = json['Category'];
    ticketUrl = json['TicketUrl'];
    title2 = json['Title2'];
    gpsLocation = json['GpsLocation'];
    description = json['Description'];
    if (json['Cast'] != null) {
      cast = new List<Cast>();
      json['Cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
    if (json['Program'] != null) {
      program = new List<Program>();
      json['Program'].forEach((v) {
        program.add(new Program.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Place'] = this.place;
    data['Date'] = this.date;
    data['ImageUrl'] = this.imageUrl;
    data['ImageWideUrl'] = this.imageWideUrl;
    data['PresellingStartDate'] = this.presellingStartDate;
    data['Title1'] = this.title1;
    data['Category'] = this.category;
    data['TicketUrl'] = this.ticketUrl;
    data['Title2'] = this.title2;
    data['GpsLocation'] = this.gpsLocation;
    data['Description'] = this.description;
    if (this.cast != null) {
      data['Cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    if (this.program != null) {
      data['Program'] = this.program.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  String iD;
  String name;
  String profession;
  String role;
  int order;

  Cast({this.iD, this.name, this.profession, this.role, this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    profession = json['Profession'];
    role = json['Role'];
    order = json['Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Profession'] = this.profession;
    data['Role'] = this.role;
    data['Order'] = this.order;
    return data;
  }
}

class Program {
  String composer;
  String opusTitle;
  String opusSupplement;
  int order;

  Program({this.composer, this.opusTitle, this.opusSupplement, this.order});

  Program.fromJson(Map<String, dynamic> json) {
    composer = json['Composer'];
    opusTitle = json['OpusTitle'];
    opusSupplement = json['OpusSupplement'];
    order = json['Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Composer'] = this.composer;
    data['OpusTitle'] = this.opusTitle;
    data['OpusSupplement'] = this.opusSupplement;
    data['Order'] = this.order;
    return data;
  }
}
