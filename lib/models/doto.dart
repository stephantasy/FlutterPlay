class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  // Constructors
  Todo(this._title, this._date, this._priority, [this._description]);
  Todo.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  // Getters
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  // Setters
  set title(String value) {
    if (value.length <= 255) {
      _title = value;
    }
  }

  set description(String value) {
    if (value.length <= 255) {
      _description = value;
    }
  }

  set date(String value) {
    if (value.length <= 255) {
      _date = value;
    }
  }

  set priority(int value) {
    if (value > 0 && value <= 3) {
      _priority = value;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["date"] = _date;
    map["priority"] = _priority;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _title = o["title"];
    _description = o["description"];
    _date = o["date"];
    _priority = o["priority"];
    _id = o["id"];
  }
}
