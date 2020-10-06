// To parse this JSON data, do
//
//     final dataModel = dataModelFromMap(jsonString);

import 'dart:convert';

DataModel dataModelFromMap(String str) => DataModel.fromMap(json.decode(str));

String dataModelToMap(DataModel data) => json.encode(data.toMap());

class DataModel {
  DataModel({
    this.data,
    this.errors,
    this.message,
  });

  List<Datum> data;
  dynamic errors;
  String message;

  factory DataModel.fromMap(Map json) => DataModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        errors: json["errors"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "errors": errors,
        "message": message == null ? null : message,
      };
}

class Datum {
  Datum({
    this.valid,
    this.openingDays,
    this.id,
    this.shifts,
    this.hospital,
    this.staffRoster,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Valid valid;
  List<String> openingDays;
  String id;
  List<Shift> shifts;
  String hospital;
  StaffRoster staffRoster;
  String createdAt;
  String updatedAt;
  int v;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        valid: json["valid"] == null ? null : Valid.fromMap(json["valid"]),
        openingDays: json["openingDays"] == null
            ? null
            : List<String>.from(json["openingDays"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        shifts: json["shifts"] == null
            ? null
            : List<Shift>.from(json["shifts"].map((x) => Shift.fromMap(x))),
        hospital: json["hospital"] == null ? null : json["hospital"],
        staffRoster: json["staffRoster"] == null
            ? null
            : StaffRoster.fromMap(json["staffRoster"]),
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "valid": valid == null ? null : valid.toMap(),
        "openingDays": openingDays == null
            ? null
            : List<dynamic>.from(openingDays.map((x) => x)),
        "_id": id == null ? null : id,
        "shifts": shifts == null
            ? null
            : List<dynamic>.from(shifts.map((x) => x.toMap())),
        "hospital": hospital == null ? null : hospital,
        "staffRoster": staffRoster == null ? null : staffRoster.toMap(),
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "__v": v == null ? null : v,
      };
}

class Shift {
  Shift({
    this.start,
    this.stop,
    this.id,
  });

  List<Start> start;
  List<Start> stop;
  String id;

  factory Shift.fromMap(Map<String, dynamic> json) => Shift(
        start: json["start"] == null
            ? null
            : List<Start>.from(json["start"].map((x) => Start.fromMap(x))),
        stop: json["stop"] == null
            ? null
            : List<Start>.from(json["stop"].map((x) => Start.fromMap(x))),
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "start": start == null
            ? null
            : List<dynamic>.from(start.map((x) => x.toMap())),
        "stop": stop == null
            ? null
            : List<dynamic>.from(stop.map((x) => x.toMap())),
        "_id": id == null ? null : id,
      };
}

class Start {
  Start({
    this.id,
    this.hour,
    this.minute,
  });

  String id;
  int hour;
  int minute;

  factory Start.fromMap(Map<String, dynamic> json) => Start(
        id: json["_id"] == null ? null : json["_id"],
        hour: json["hour"] == null ? null : json["hour"],
        minute: json["minute"] == null ? null : json["minute"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "hour": hour == null ? null : hour,
        "minute": minute == null ? null : minute,
      };
}

class StaffRoster {
  StaffRoster({
    this.id,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  Day monday;
  Day tuesday;
  Day wednesday;
  Day thursday;
  Day friday;
  Day saturday;
  Day sunday;
  String createdAt;
  String updatedAt;
  int v;

  factory StaffRoster.fromMap(Map<String, dynamic> json) => StaffRoster(
        id: json["_id"] == null ? null : json["_id"],
        monday: json["monday"] == null ? null : Day.fromMap(json["monday"]),
        tuesday: json["tuesday"] == null ? null : Day.fromMap(json["tuesday"]),
        wednesday:
            json["wednesday"] == null ? null : Day.fromMap(json["wednesday"]),
        thursday:
            json["thursday"] == null ? null : Day.fromMap(json["thursday"]),
        friday: json["friday"] == null ? null : Day.fromMap(json["friday"]),
        saturday:
            json["saturday"] == null ? null : Day.fromMap(json["saturday"]),
        sunday: json["sunday"] == null ? null : Day.fromMap(json["sunday"]),
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "monday": monday == null ? null : monday.toMap(),
        "tuesday": tuesday == null ? null : tuesday.toMap(),
        "wednesday": wednesday == null ? null : wednesday.toMap(),
        "thursday": thursday == null ? null : thursday.toMap(),
        "friday": friday == null ? null : friday.toMap(),
        "saturday": saturday == null ? null : saturday.toMap(),
        "sunday": sunday == null ? null : sunday.toMap(),
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "__v": v == null ? null : v,
      };
}

class Day {
  Day({
    this.the1,
    this.the2,
    this.the3,
  });

  List<String> the1;
  List<String> the2;
  List<String> the3;

  factory Day.fromMap(Map<String, dynamic> json) => Day(
        the1: json["1"] == null
            ? null
            : List<String>.from(json["1"].map((x) => x)),
        the2: json["2"] == null
            ? null
            : List<String>.from(json["2"].map((x) => x)),
        the3: json["3"] == null
            ? null
            : List<String>.from(json["3"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "1": the1 == null ? null : List<dynamic>.from(the1.map((x) => x)),
        "2": the2 == null ? null : List<dynamic>.from(the2.map((x) => x)),
        "3": the3 == null ? null : List<dynamic>.from(the3.map((x) => x)),
      };
}

class Valid {
  Valid({
    this.start,
    this.stop,
  });

  int start;
  int stop;

  factory Valid.fromMap(Map<String, dynamic> json) => Valid(
        start: json["start"] == null ? null : json["start"],
        stop: json["stop"] == null ? null : json["stop"],
      );

  Map<String, dynamic> toMap() => {
        "start": start == null ? null : start,
        "stop": stop == null ? null : stop,
      };
}
