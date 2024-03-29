import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  bool _isLoading = false;

  @override
  void initState() {
    _imageUrlFocus.addListener(updateImage);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith(".jpg") ||
        url.toLowerCase().endsWith(".png") ||
        url.toLowerCase().endsWith(".jpeg");

    return isValidUrl && endsWithFile;
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() => _isLoading = true);

    try {
      await Provider.of<ProductList>(
        context,
        listen: false,
      ).saveProduct(_formData);
      Navigator.of(context).pop();
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ocorreu um error'),
          content: const Text("Error ao salvar o produto"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de Produto"),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: (_formData['name'] ?? '') as String,
                        decoration: const InputDecoration(labelText: "Nome"),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocus);
                        },
                        onSaved: (name) => _formData['name'] = name ?? "",
                        validator: (nameValidator) {
                          final name = nameValidator ?? "";
                          if (name.trim().isEmpty) {
                            return "Nome é obrigatório";
                          }
                          if (name.trim().length < 3) {
                            return "Minimo de 3 letras";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['price']?.toString(),
                        decoration: const InputDecoration(labelText: "Preço"),
                        textInputAction: TextInputAction.next,
                        focusNode: _priceFocus,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_descriptionFocus);
                        },
                        onSaved: (price) =>
                            _formData['price'] = double.parse(price ?? "0"),
                        validator: (priceValidator) {
                          final String priceString = priceValidator ?? "";
                          final double price =
                              double.tryParse(priceString) ?? -1;

                          if (price <= 0) {
                            return "Informe um preço válido";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['description']?.toString(),
                        decoration:
                            const InputDecoration(labelText: "Descição"),
                        focusNode: _descriptionFocus,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onSaved: (description) =>
                            _formData['description'] = description ?? "",
                        validator: (descriptionValidator) {
                          final description = descriptionValidator ?? "";
                          if (description.trim().isEmpty) {
                            return "Descrição é obrigatório";
                          }
                          if (description.trim().length < 10) {
                            return "Minimo de 10 letras";
                          }

                          return null;
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Url da Imagem"),
                              focusNode: _imageUrlFocus,
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageUrlController,
                              onFieldSubmitted: (_) => _submitForm(),
                              onSaved: (imageUrl) =>
                                  _formData['imageUrl'] = imageUrl ?? "",
                              validator: (imageUrlValidator) {
                                final imageUrl = imageUrlValidator ?? "";
                                if (!isValidImageUrl(imageUrl)) {
                                  return "Url invalida";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: _imageUrlController.text.isEmpty
                                ? const Text('Informe a Url')
                                : Image.network(_imageUrlController.text),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
    );
  }
}
