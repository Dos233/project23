class Find {
  int id;
  String jobname;
  String jobdes;
  String wagesperhour;
  String date;
  String duration;
  String workhour;
  String numberofworkers;
  String workername;
  String workerphone;
  String applyjob;

  Find(
      {this.id,
      this.jobname,
      this.jobdes,
      this.wagesperhour,
      this.date,
      this.duration,
      this.workhour,
      this.numberofworkers,
      this.workername,
      this.workerphone,
      this.applyjob});

  int get find_id => id;
  String get find_jobname => jobname;
  String get find_jobdes => jobdes;
  String get find_wagesperhour => wagesperhour;
  String get find_date => date;
  String get find_duration => duration;
  String get find_workhour => workhour;
  String get find_numberofworkers => numberofworkers;
  String get find_workername => workername;
  String get find_workerphone => workerphone;
  String get find_applyjob => applyjob;

  factory Find.fromJson(Map<String, dynamic> data) => new Find(
      id: data["id"],
      jobname: data["jobname"],
      jobdes: data["jobdes"],
      wagesperhour: data["wagesperhour"],
      date: data["date"],
      duration: data["duration"],
      workhour: data["workhour"],
      numberofworkers: data["numberofworkers"],
      workername: data["workername"],
      workerphone: data["workerphone"],
      applyjob: data["applyjob"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobname": jobname,
        "jobdes": jobdes,
        "wagesperhour": wagesperhour,
        "date": date,
        "duration": duration,
        "workhour": workhour,
        "numberofworkers": numberofworkers,
        "workername": workername,
        "workerphone": workerphone,
        "applyjob": applyjob,
      };
}
