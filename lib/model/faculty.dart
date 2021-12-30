class ListItem {
  int? value;
  String? name;

  //Contructor
  ListItem(this.value, this.name);

  static getItem() {
    return [
      ListItem(1, 'วิทยาศาสตร์ '),
      ListItem(2, 'วิทยาการสุขภาพและการกีฬา'),
      ListItem(3, 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
      ListItem(4, 'วิศวกรรมศาสตร์ '),
      ListItem(5, 'พยาบาลศาสตร์'),
      ListItem(6, 'นิติศาสตร์ '),
    ];
  }
}
