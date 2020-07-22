class Person {
  String name;
  String email;
  String phone;
  String department;
  String profession;

  Person(
    this.name,
    this.email,
    this.phone,
    this.department,
    this.profession,
  );

  factory Person.fromJson(dynamic json) {
    return Person(
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['department'] as String,
      json['profession'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.email}, ${this.phone}, ${this.department}, ${this.profession}}';
  }
}
