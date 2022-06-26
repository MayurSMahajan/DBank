import Debug "mo:base/Debug"; //importing this module for printing in the console.
//An actor is like a class, which encapsulates data member and methods and binds them with a state.
actor DBank{ 
  Debug.print("DBank Application Started");
  var currentValue = 300;
  currentValue := 200; //assignment is done using := instead of = sign.

  let id = 23412324324;//let keyword declares immutable data members.

  Debug.print(debug_show(currentValue));// to print any thing thats not a string, we use debug_show()

  //A function is defined using the func keyword, public allows a function to be called outside the canister.
  //Note we have to specify the type of argument, in this case it is Nat for Natural Number
  public func topUp(amount : Nat){ 
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //Note how we specify type Int for temp using a colon.
  public func withdraw(amount : Nat){
    let temp : Int = currentValue - amount;
    if(temp >= 0){ // we create temp as Int because it can contain negative value, which Nat can not hold.
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Insufficient Balance");
    }
  }
}