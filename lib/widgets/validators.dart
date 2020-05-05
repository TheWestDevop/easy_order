

validateStringField(String value){
   if (value.isEmpty || value == null) {
     return "Field is required";
   } else {
     return null;
   }
}

validateNameField(String value){
   if (value.isEmpty || value == null) {
     return "Name is required";
   } else {
     return null;
   }
}

validateAddressField(String value){
   if (value.isEmpty || value == null || value.length < 5) {
     return "Address is required";
   } else {
     return null;
   }
}
validateEmailField(String email){
   Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(email == null || email == "" || !regex.hasMatch(email)){
       return "Invalid Email";
    }else{
      return null;
    }
}

validatePhoneField(String value){
   if (value.isEmpty || value == null || value.length < 11 || value.length > 11) {
     return "Invalid Phone Number";
   } else {
     return null;
   }
}
validatePasswordField(String value){
   if (value.isEmpty || value == null || value.length < 7) {
     return "Invalid Password";
   } else {
     return null;
   }
}


