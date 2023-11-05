class Registro {
  final int regId;
  final int regNumeroCbr;
  final int regFojasCbr;
  final int regVtaCbr;
  final int regAnioCbr;
  final String comNombre;
  final String regNombres;
  final String regApellidoPaterno;
  final String regApellidoMaterno;
  final int regFojasRpti;
  final int regVtaRpti;
  final int regNumeroRpti;
  final String regAnioRpti;

  Registro({
    required this.regId,
    required this.regNumeroCbr,
    required this.regFojasCbr,
    required this.regVtaCbr,
    required this.regAnioCbr,
    required this.comNombre,
    required this.regNombres,
    required this.regApellidoPaterno,
    required this.regApellidoMaterno,
    required this.regFojasRpti,
    required this.regVtaRpti,
    required this.regNumeroRpti,
    required this.regAnioRpti,
  });

  factory Registro.fromJson(Map<String, dynamic> json) => Registro(
        regId: json["reg_id"],
        regNumeroCbr: json["reg_numero_cbr"],
        regFojasCbr: json["reg_fojas_cbr"],
        regVtaCbr: json["reg_vta_cbr"],
        regAnioCbr: json["reg_anio_cbr"],
        comNombre: json["com_nombre"],
        regNombres: json["reg_nombres"],
        regApellidoPaterno: json["reg_apellido_paterno"],
        regApellidoMaterno: json["reg_apellido_materno"],
        regFojasRpti: json["reg_fojas_rpti"],
        regVtaRpti: json["reg_vta_rpti"],
        regNumeroRpti: json["reg_numero_rpti"],
        regAnioRpti: json["reg_anio_rpti"],
      );

  Map<String, dynamic> toJson() => {
        "reg_id": regId,
        "reg_numero_cbr": regNumeroCbr,
        "reg_fojas_cbr": regFojasCbr,
        "reg_vta_cbr": regVtaCbr,
        "reg_anio_cbr": regAnioCbr,
        "com_nombre": comNombre,
        "reg_nombres": regNombres,
        "reg_apellido_paterno": regApellidoPaterno,
        "reg_apellido_materno": regApellidoMaterno,
        "reg_fojas_rpti": regFojasRpti,
        "reg_vta_rpti": regVtaRpti,
        "reg_numero_rpti": regNumeroRpti,
        "reg_anio_rpti": regAnioRpti,
      };
}
