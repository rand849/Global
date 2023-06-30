// ignore_for_file: non_constant_identifier_names

class UserModel {
   final String IDnum;
   final String nationalty ;
   final String email ;
   final String document;


   const  UserModel (
    {
    required this.document, 
    required this.email , 
    required this.nationalty,
    required this.IDnum});

    Map <String,dynamic> toJson(){
    return {
      'IDnum':IDnum,
      'nationality' : nationalty,
      'email':email,
      'documnet':document
    };
  }
    UserModel.fromjson(Map <String ,dynamic> data, this.IDnum, this.nationalty, this.email, this.document, ){
    // ignore: unnecessary_null_comparison
      if(data == null){
        return;
      }
    nationalty :data ['nationalty'];
    email :data ['email']; 
    document : data ['document'];
    IDnum :data['IDnum'] ;

   }
}