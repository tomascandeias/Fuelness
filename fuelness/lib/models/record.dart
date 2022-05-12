import 'package:homework/models/record_instance.dart';

class Record{
  final int id;
  final String activity;
  List<RecordInstance> records;

  Record(this.id, this.activity, this.records);

  List<RecordInstance> fetchRecords(){
    records = [RecordInstance(0, DateTime.utc(2022, 4, 20), 23.5, 2300), RecordInstance(1, DateTime.utc(2022, 4, 22), 19.6, 1700), RecordInstance(2, DateTime.utc(2022, 4, 25), 16.6, 1400)];
    return records;
  }


  RecordInstance fetchByID(int id) {
    List<RecordInstance> records = fetchRecords();
    for (var i = 0; i < records.length; i++) {
      if (records[i].id == id) {
        return records[i];
      }
    }
    return records[0];
  }

}