class Major {
  String? majornameth;
  String? majornameen;

  //Contructor
  Major(this.majornameth, this.majornameen);

  static getMajor() {
    return [
      Major('วิทยาการคอมพิวเตอร์', 'Computer Science'),
      Major('เทคโนโลยีสารสนเทศ', 'Information Technology'),
    ];
  }
}
