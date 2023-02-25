import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({
    super.key,
    required this.value,
    required this.searchSugestions,
  });

  String value;
  Function(String text) searchSugestions;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  bool _hasText = false;
  bool _isOnSearch = false;
  List<String> searchSuggestion = [];

  @override
  void initState() {
    super.initState();
    _updateText(widget.value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Search oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _updateText(widget.value);
    }
  }

  void _updateText(String text, {bool collapsed = true}) {
    if (text != controller.text) {
      controller.value = TextEditingValue(
          text: text,
          selection: collapsed
              ? TextSelection.collapsed(offset: text.length)
              : TextSelection(baseOffset: 0, extentOffset: text.length));
    }
    _updateWidgetValue();
    _handleHasText();
  }

  void _setFocused() {
    setState(() {
      focusNode.requestFocus();
    });
  }

  void _setUnFocused() {
    setState(() {
      focusNode.unfocus();
    });
  }

  void _handleHasText() {
    setState(() {
      _hasText = (controller.text != "") ? true : false;
    });
  }

  void _onChanged(String text) {
    _handleHasText();
    _updateWidgetValue();
    searchSuggestion = widget.searchSugestions(text);
  }

  void _onPressed() {
    if (!_isOnSearch) {
      if (controller.text != "") {
        _updateText("");
      } else {
        if (focusNode.hasFocus) {
          _setFocused();
        } else {
          _setFocused();
        }
      }
    } else {
      _updateText("");
      //TODO: Logica de cancelar busqueda
    }
  }

  void _onSubmited(String text) {
    if (text != "") {
      setState(() {
        _isOnSearch = true;
      });
    } else {
      focusNode.requestFocus();
    }
  }

  void _onTap() {
    _setFocused();
  }

  void _updateWidgetValue() {
    var text = controller.text;
    widget.value = text;
  }

  @override
  Widget build(BuildContext context) {
    var insetColor = Theme.of(context).colorScheme.onSurfaceVariant;
    var backgroundColor = Theme.of(context).colorScheme.surface;

    // TODO: implement build
    return Card(
      elevation: 3,
      color: backgroundColor,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 56,
            ),
            child: TextField(
              onChanged: _onChanged,
              onTap: _onTap,
              onSubmitted: _onSubmited,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              focusNode: focusNode,
              controller: controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Buscar...',
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: insetColor,
                    ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  selectedIcon: const Icon(Icons.close),
                  color: insetColor,
                  isSelected: _hasText,
                  onPressed: _onPressed,
                ),
                prefix: SizedBox.fromSize(
                  size: const Size(20, 1),
                ),
                constraints: const BoxConstraints(
                  minHeight: 50,
                  minWidth: 100,
                ),
              ),
            ),
          ),
          if (focusNode.hasFocus)
            _SearchSuggestion(searchSuggestion, _setUnFocused, _hasText,)
        ],
      ),
    );
  }
}

class _SearchSuggestion extends StatelessWidget {
  const _SearchSuggestion(this._searchSuggestionData, this._onTapOutside,this._hasText);
  final List<String> _searchSuggestionData;
  final Function _onTapOutside;
  final bool _hasText;

  //TODO: Sugerencias presionables que lancen la vista de la emoción;v
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if ((_hasText) &&(_searchSuggestionData.isNotEmpty))
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            height: 1,
          ),
        TextFieldTapRegion(
            onTapOutside: (e) {
              _onTapOutside.call();
            },
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 180,
              ),
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (String suggestion in _searchSuggestionData)
                          ListTile(
                            title: Text(
                              suggestion,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {},
                            ),
                          ),
                      ],
                    )),
                  ]),
            ))
      ],
    );
  }
}
