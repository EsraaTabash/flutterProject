import 'dart:developer';
import 'dart:ffi';

class Section{
  Int? id;
  String? Name;
  String? Content;
  String? Ref ;
  int? Count;
  //Section({this.id,this.Name,this.Content,this.Reference ,this.Count});
  Section({this.id,this.Name,this.Content,this.Count,this.Ref});
  toMap(){
    return {
      "name":Name,
      "content":Content,
      "ref":Ref ,
      "count":Count
    };
  }
  Section.fromMap(Map<String, dynamic> map) {
    try{
      log(map['details'][0]);
      this.id = map['id'];
      this.Name = map['name'];
      this.Content = map['content'];
      this.Count = map['count'];
      this.Ref = map['ref'];
    }catch(e){
      log(e.toString());
    }
  }

}