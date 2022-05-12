class RecordInstance {

  final int id;
  final DateTime date;
  final double km;
  final double calories;

  RecordInstance(this.id, this.date, this.km, this.calories);

  static List<RecordInstance> fetchAll(){
    return [RecordInstance(0, DateTime.utc(2022, 4, 20), 23.5, 2300), RecordInstance(1, DateTime.utc(2022, 4, 22), 19.6, 1700), RecordInstance(2, DateTime.utc(2022, 4, 25), 16.6, 1400)];
  }

  static RecordInstance fetchByID(int id) {
    List<RecordInstance> records = RecordInstance.fetchAll();
    for (var i = 0; i < records.length; i++) {
      if (records[i].id == id) {
        return records[i];
      }
    }
    return records[0];
  }

  String getDateText(){
    return date.day.toString() + "-" + date.month.toString() + "-" + date.year.toString() ;
  }
}