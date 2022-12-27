class UserModel {
  late int id;
  late String nama = "";
  late String email = "";
  late String password = "";
  late String alamat = "";
  late String akses = "";


  get getId => this.id;

  set setId(id) => this.id = id;

  get getNama => this.nama;

  set setNama(nama) => this.nama = nama;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;

  get getAlamat => this.alamat;

  set setAlamat(alamat) => this.alamat = alamat;

  get getAkses => this.akses;

  set setAkses(akses) => this.akses = akses;
}
