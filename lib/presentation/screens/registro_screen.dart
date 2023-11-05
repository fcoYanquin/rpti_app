import 'dart:io';

import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rpti_app/presentation/providers/registro_provider.dart';
import 'package:rpti_app/presentation/widgets/shared/custom_bottom_navigation.dart';
import 'package:rpti_app/presentation/widgets/shared/custom_loading_animatios.dart';

class RegistroScreen extends ConsumerStatefulWidget {
  static const String name = 'registro_screen';

  final String id;
  final String token;

  const RegistroScreen({super.key, required this.id, required this.token});

  @override
  RegistroScreenState createState() => RegistroScreenState();
}

class RegistroScreenState extends ConsumerState<RegistroScreen> {

    File? _scannedPdf;
    final List<Card> _cards = [];

    openImageScanner(BuildContext context) async {
      var pdf = await DocumentScannerFlutter.launchForPdf(context,
          //source: ScannerFileSource.CAMERA,
          labelsConfig: {
            ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Siguiente",
            ScannerLabelsConfig.ANDROID_LOADING_MESSAGE: "Agregando...",
            ScannerLabelsConfig.ANDROID_SCANNING_MESSAGE: "Escaneando...",
            ScannerLabelsConfig.ANDROID_ROTATE_LEFT_LABEL: "IZQ",
            ScannerLabelsConfig.ANDROID_ROTATE_RIGHT_LABEL: "DER",
            ScannerLabelsConfig.ANDROID_BMW_LABEL: "B & N",
            ScannerLabelsConfig.ANDROID_OK_LABEL: "OK",
            ScannerLabelsConfig.ANDROID_SAVE_BUTTON_LABEL: "Guardar",

            ScannerLabelsConfig.PDF_GALLERY_EMPTY_TITLE: "Páginas de su PDF",
            ScannerLabelsConfig.PDF_GALLERY_DONE_LABEL: "Listo",
            ScannerLabelsConfig.PDF_GALLERY_ADD_IMAGE_LABEL: "Agregar imágen",
            ScannerLabelsConfig.PDF_GALLERY_EMPTY_MESSAGE: "No se han agregado archivos aún",
            ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_SINGLE: "Página",
            ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_MULTIPLE: "Páginas",

            ScannerLabelsConfig.PICKER_CAMERA_LABEL: "Abrir cámara",
            ScannerLabelsConfig.PICKER_GALLERY_LABEL: "Abrir galería",
          });
      if (pdf != null) {
        print(pdf.path);
        _scannedPdf = pdf;
        //TODO: Copiar pdf generado en ubicacion conocida

        setState(() {

        });
      }
    }


  @override
  void initState() {
    super.initState();

    ref.read(registroProvider.notifier).getRegistro(widget.token, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final registro = ref.watch(registroProvider)[widget.id];
    final size = MediaQuery.of(context).size;

    //Objeto de tipo Registro
    if (registro == null) {
      return const CustomLoadingAnimation();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de inscripción",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: colors.primary,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Card(
                elevation: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Comuna",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Foja RPTI",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Número RPTI",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Año",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Vuelta RPTI",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: size.width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              registro.comNombre,
                              style: const TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${registro.regFojasRpti}",
                              style: const TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${registro.regNumeroRpti}",
                              style: const TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              registro.regAnioRpti,
                              style: const TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Tipo de Propietario",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Nombre",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Apellido Paterno",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Apellido Materno",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "CBR",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Foja CBR",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Vuelta CBR",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Número CBR",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Año CBR",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: size.width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("", style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_scannedPdf != null) ...[ //Si el pdf se genera, se muesta el boton para visualizarlo
                    Center(
                      child: Builder(builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            //TODO: Cregar ruta para ver el PDF generado
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(colors.primary),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.picture_as_pdf, ),
                              Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),),
                              Text("Ver PDF")
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                  Center(
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                          onPressed: () => openImageScanner(context),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(colors.primary),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.camera_enhance, ),
                              Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),),
                              Text("Agregar documento"),
                            ],
                          ));
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
            
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
