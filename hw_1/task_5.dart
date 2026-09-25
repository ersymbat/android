void main() {
  int ers = 16;
  int count = 0;
  for(int i = 2; i < ers/2; i++){
           print("$i");
    if(ers % i == 0 ){
      count++;
      break;
    }
  }
  if(count < 1){
    print("$ers is a prime number");
  } 
  else{
    print("$ers is not a prime number");
  }
}