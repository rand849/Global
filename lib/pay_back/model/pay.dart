// ignore_for_file: non_constant_identifier_names

class PayModel {
   final String type;
   final String cvc ;
   final String name ;
   final String code;
   final String month;
   final String year;


   const  PayModel (
    {
    required this.type, 
    required this.cvc , 
    required this.name,
    required this.code,
    required this.month,
    required this.year,
    
    });

    Map <String,dynamic> toJson(){
    return {
      'type':type,
      'cvc' : cvc,
      'name':name,
      'code':code,
      'month':month,
      'year':year,
    };
  }
    PayModel.fromjson(Map <String ,dynamic> map, this.type, this.cvc, this.name, this.code, this.month, this.year ){
    // ignore: unnecessary_null_comparison
      if(map == null){
        return;
      }
    type :map ['type'];
    cvc :map ['cvc']; 
    name : map ['name'];
    code :map['code'] ;
    month :map['month'] ;
    year :map['year'] ;

   }
}