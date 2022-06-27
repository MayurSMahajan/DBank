import Debug "mo:base/Debug"; //importing this module for printing in the console.
//An actor is like a class, which encapsulates data member and methods and binds them with a state.
actor DBank{ 
  Debug.print("DBank Application Started");
  
  //Declaring a Orthogonal Persistent variable using the stable keyword
  //This will mean that the value of currentValue is saved even when the state of the app is restarted.
  //Basically it is like permanently saving our data without using any Database.
  stable var currentValue = 300;

  //When := this operator is encountered, the state of the currentValue will be replaced with 200
  // currentValue := 200; 

  //func keyword defines a function, public specifies the scope to public
  //Note we have to specify the type of argument, here it is Nat for Natural Number
  public func topUp(amount : Nat){ 
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //Note how we specify type Int for temp using a colon.
  public func withdraw(amount : Nat){
    let temp : Int = currentValue - amount; //temp is immutable coz declared using let
    if(temp >= 0){ // we create temp as Int because it can contain negative value
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Insufficient Balance");
    }
  };

  // Creating a query function:- these functions are faster then update functions
  // But they can not be used to update the state of our cannisters.
  public query func checkBalance() : async Nat {
    //Note that all returns in motoko are async and we must specify it.
    return currentValue;
  };
  //Note we aren't chainging the variable currentValue, we are simply reading it.
}