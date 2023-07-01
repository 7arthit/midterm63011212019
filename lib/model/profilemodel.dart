class ProfileModel{
  late int id = 0;
  late String firstname = '';
  late String lastname = '';
  late String nickname = '';
  //late String age = '';
  //late String hometown = '';
  //late String image;

  profileMap(){
    var mapping = Map<String, dynamic>();
    // mapping['id'] = id;
    mapping['firstname'] = firstname;//name
    mapping['lastname'] = lastname;//country
    mapping['nickname'] = nickname;//probability
    //mapping['age'] = age;
    //mapping['hometown'] = hometown;
    //mapping['image'] = image;
    return mapping;
  }
}