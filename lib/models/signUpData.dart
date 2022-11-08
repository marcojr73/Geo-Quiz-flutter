// ignore: file_names
class SignUpData {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String picture;
  
  const SignUpData({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.picture = "https://thumbs.dreamstime.com/z/perfil-an%C3%B4nimo-vidros-de-estilo-antigo-design-chap%C3%A9u-s%C3%ADmbolo-vetor-modelo-logotipo-gr%C3%A1fico-159814440.jpg"
  });
}