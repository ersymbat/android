void main() {
  int ers = 7;
  int count = 0;
  for(int i = 1; i <ers; i++){
    if( ers % i == 0){
      count++;
    }
  }
  if(count < 2){
    print("$ers is a prime number");
  } 
  else{
    print("$ers is not a prime number");
  }
}