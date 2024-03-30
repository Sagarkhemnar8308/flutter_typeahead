class Stateservices {
  static final List<String> states = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
  ];


  static List<String> getSuggesitions(String query){
    List<String> matches=[];

    matches.addAll(states);
    matches.removeWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
