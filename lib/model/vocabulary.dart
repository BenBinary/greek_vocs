class Vocabulary {
  final int id;
  final String greek_voc;
  final String greek_voc_latin;
  final String english_voc;
  final String topic;

  Vocabulary(this.id,
      this.greek_voc,
      this.greek_voc_latin,
      this.english_voc,
      this.topic);
  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'greek_voc': greek_voc,
      'greek_voc_latin': greek_voc_latin,
      'english_voc': english_voc,
      'topic': topic
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.id.toString() + " " + this.greek_voc_latin + " " + this.english_voc;
  }
}