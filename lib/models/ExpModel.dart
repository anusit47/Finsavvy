// expModel.dart

class ExpModel {
  final String questName;
  final double expAmount;
  final String description;
  final String image;
  final String type;

  ExpModel({
    required this.questName,
    required this.expAmount,
    required this.description,
    required this.image,
    required this.type,
  });
}

List<ExpModel> demoExpModels = [
  ExpModel(
    questName: "เริ่มเรียน 1 บทเรียน",
    expAmount: 100.0,
    description: "ลองเข้าเรียน",
    image: "https://www.svgrepo.com/show/181744/open-book-book.svg",
    type: "ประจำวัน",
  ),
  ExpModel(
    questName: "เริ่มวางแผน 1 ครั้ง",
    expAmount: 100.0,
    description: "ลองวางแผน",
    image: "https://www.svgrepo.com/show/181772/notebook-agenda.svg",
    type: "ประจำวัน",
  ),
  ExpModel(
    questName: "ผ่าน Quiz 1 บทเรียน",
    expAmount: 500.0,
    description: "ผ่านสอบ",
    image: "https://www.svgrepo.com/show/181730/writing-note.svg",
    type: "ประจำสัปดาห์",
  ),
  ExpModel(
    questName: "วางแผนครบทุกแผน",
    expAmount: 1000.0,
    description: "ลองเข้าเรียน",
    image: "https://www.svgrepo.com/show/181747/library-book.svg",
    type: "ประจำสัปดาห์",
  ),
];
