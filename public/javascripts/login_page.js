function validateForm()
{
  var login_name = $('login').value;
  var login_password = $('password').value;
  if (login_name==null || login_name=="" )
   {
     alert("Login name must be filled out");
     return false;
    }
  if(login_password==null || login_password=="")
  {
    alert("Login password must be filled out");
    return false;
  }
  return true;
}

