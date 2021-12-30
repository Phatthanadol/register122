class Pet {
  String? type;
  bool? checked;

  //Contructor
  Pet(this.type, this.checked);

  static getPet() {
    return [
      Pet('หมา', false),
      Pet('แมว', false),
      Pet('กระต่าย', false),
      Pet('ชูก้าไรเดอร์', false),
      Pet('งู', false),
      Pet('แมงมุม', false),
      Pet('นกแก้ว', false),
      Pet('กิ้งก่า', false),
      Pet('ปลา', false),
    ];
  }
}
