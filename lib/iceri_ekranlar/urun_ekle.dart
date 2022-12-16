import 'dart:io';
import 'dart:typed_data';

import 'package:bitirmeweb/hizmetler/araclar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../d_m.dart';
import '../kontrolorler/mainkontrol.dart';
import '../widgets/btnlar.dart';
import '../widgets/test_widget.dart';
import '../widgets/ustkisim.dart';
import '../widgets/yan_menu.dart';

class UrunEklemeForm extends StatefulWidget {
  static const routeName = '/UrunEklemeForm';

  const UrunEklemeForm({Key? key}) : super(key: key);

  @override
  _UrunEklemeFormState createState() => _UrunEklemeFormState();
}

class _UrunEklemeFormState extends State<UrunEklemeForm> {
  final _formKey = GlobalKey<FormState>();
  String katValue='Meyveler';
  late final TextEditingController _titleController, _priceController;
  int _groupValue =1;
  bool ispiece=false;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  @override


  void temizleform(){
    setState(() {
      _groupValue=1;
      ispiece=false;
      _titleController.clear();
      _priceController.clear();
      _pickedImage=null;
      webImage = Uint8List(8);
    });
  }

  void initState() {
    _priceController = TextEditingController();
    _titleController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _uploadForm() async {
    final isValid = _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Araclar(context).getTheme;
    final color = Araclar(context).color;
    final _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    Size size = Araclar(context).getScreenSize;

    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: _scaffoldColor,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.0,
        ),
      ),
    );
    return Scaffold(
      key: context.read<MenuController>().getAddProductscaffoldKey,
      drawer: const SideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Header(fct: () {
                      context.read<MenuController>().controlAddProductsMenu();
                    }, title: 'Ürün ekleme',showText: false,),
                  ),
                  Container(
                    width: size.width > 650 ? 650 : size.width,
                    color: Theme.of(context).cardColor,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextWidget(
                            text: 'Ürün adı*',
                            color: color,
                            isTitle: true,textSize: 18,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _titleController,
                            key: const ValueKey('Title'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ürün adı boş burakmayın ';
                              }
                              return null;
                            },
                            decoration: inputDecoration,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: 'Fiyat \₺*',
                                        color: color,
                                        isTitle: true, textSize: 14,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                          controller: _priceController,
                                          key: const ValueKey('Fiyat \₺'),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'TL olması';
                                            }
                                            return null;
                                          },
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9.]')),
                                          ],
                                          decoration: inputDecoration,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextWidget(
                                        text: 'Ürün ketegorisi*',
                                        color: color,
                                        isTitle: true,textSize: 14,
                                      ),
                                      const SizedBox(height: 10),
                                      Container(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _ketegoritur(),
                                      ),color: _scaffoldColor,),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextWidget(
                                        text: 'Birim*',
                                        color: color,
                                        isTitle: true,textSize: 14,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(text: 'Kg', color: color, textSize: 12),
                                          Radio(value: 1, groupValue: _groupValue, onChanged: (valuee){
                                            setState(() {
                                              _groupValue = 1;
                                              ispiece=false;
                                            });
                                          },activeColor: Colors.green,),
                                          TextWidget(text: 'Adet', color: color, textSize: 12),
                                          Radio(value: 2, groupValue: _groupValue, onChanged: (valuee){
                                            setState(() {
                                              _groupValue = 2;
                                              ispiece=true;
                                            },
                                            );
                                          },
                                            activeColor: Colors.green,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Image to be picked code is here
                              Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: size.width>650?350:size.width*0.45,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),color: Theme.of(context).scaffoldBackgroundColor,),
                                      child: _pickedImage == null
                                          ? dottedBorder(color: color)
                                          : ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child:  kIsWeb
                                            ? Image.memory(webImage,
                                            fit: BoxFit.fill)
                                            : Image.file(_pickedImage!,
                                            fit: BoxFit.fill),
                                      )
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _pickedImage=null;
                                              webImage = Uint8List(8);
                                            });
                                          },
                                          child: TextWidget(
                                            text: 'Silme',
                                            color: Colors.red,
                                            textSize: 14,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: TextWidget(
                                            text: 'Resim yükle',
                                            color: Colors.blue,
                                            textSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonsWidget(
                                  onPressed: () {
                                    temizleform();
                                  },
                                  text: 'Herşey sil',
                                  icon: IconlyBold.danger,
                                  backgroundColor: Colors.red.shade300,
                                ),
                                ButtonsWidget(
                                  onPressed: () {
                                    _uploadForm();
                                  },
                                  text: 'Yükle',
                                  icon: IconlyBold.upload,
                                  backgroundColor: Colors.blue,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Widget dottedBorder({required Color color}){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        dashPattern: [6,7],
        borderType: BorderType.RRect,
        color: color,
        radius:Radius.circular(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.image_outlined,color: color,size: 50,),
              TextButton(onPressed: (){_pickImage();}, child: TextWidget(text: 'bir resim seç', color: Colors.blue, textSize: 16))
            ],
          ),
        )
      ),
    );
  }
  Widget _ketegoritur(){
    return DropdownButtonHideUnderline(
        child:DropdownButton<String>(
          value: katValue,
          onChanged: (value){
              setState(() {
                katValue=value!;
              });
              print(katValue);
          },
          hint: Text('ketegori seçin'),
          items: [
            DropdownMenuItem(child: Text('Meyveler'),value: 'Meyveler',),
            DropdownMenuItem(child: Text('Sebzeler'),value: 'Sebzeler',),
            DropdownMenuItem(child: Text('Içecekler'),value: 'Icecekler',),
            DropdownMenuItem(child: Text('Baharatlar'),value: 'Baharatlar',),
            DropdownMenuItem(child: Text('Etler'),value: 'Etler',),
            DropdownMenuItem(child: Text('Deniz yemekleri'),value: 'Deniz yemekleri',),
          ],
        )
    );
  }
}