import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialColorDemo(),
  );
}

class MaterialColorDemo extends StatefulWidget {
  const MaterialColorDemo({super.key});

  @override
  State<MaterialColorDemo> createState() => _MaterialColorDemoState();
}

class _MaterialColorDemoState extends State<MaterialColorDemo> {
  bool useLightMode = true;
  ThemeMode themeMode = ThemeMode.system;
  Color colorSelected = Colors.green;

  void handleBrightnessChange(bool value) {
    setState(() {
      useLightMode = value;
      themeMode = value ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void handleColorSelect(Color color) {
    setState(() {
      colorSelected = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Color Demo',
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected,
        brightness: Brightness.dark,
      ),
      home: MaterialColorsScreen(
        selectedColor: colorSelected,
        onBrightnessChanged: handleBrightnessChange,
        onColorSelected: handleColorSelect,
        useLightMode: useLightMode,
      ),
    );
  }
}


class MaterialColorsScreen extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<bool> onBrightnessChanged;
  final ValueChanged<Color> onColorSelected;
  final bool useLightMode;

  const MaterialColorsScreen({
    required this.selectedColor,
    required this.onBrightnessChanged,
    required this.onColorSelected,
    required this.useLightMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Colors'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        actions: [
          Switch(
            value: useLightMode,
            onChanged: onBrightnessChanged,
            activeColor: Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ColorPickerDialog(
                  selectedColor: selectedColor,
                  onColorSelected: onColorSelected,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColorBlock('Primary', colorScheme.primary, colorScheme.onPrimary),
              _buildColorBlock('Primary Container', colorScheme.primaryContainer, colorScheme.onPrimaryContainer),
              _buildColorBlock('Secondary', colorScheme.secondary, colorScheme.onSecondary),
              _buildColorBlock('Secondary Container', colorScheme.secondaryContainer, colorScheme.onSecondaryContainer),
              _buildColorBlock('Tertiary', colorScheme.tertiary, colorScheme.onTertiary),
              _buildColorBlock('Tertiary Container', colorScheme.tertiaryContainer, colorScheme.onTertiaryContainer),
              _buildColorBlock('Error', colorScheme.error, colorScheme.onError),
              _buildColorBlock('Error Container', colorScheme.errorContainer, colorScheme.onErrorContainer),
              _buildColorBlock('Background', colorScheme.surface, colorScheme.onSurface),
              _buildColorBlock('Surface', colorScheme.surface, colorScheme.onSurface),
              _buildColorBlock('Inverse Surface', colorScheme.inverseSurface, colorScheme.onInverseSurface),
              _buildColorBlock('Outline', colorScheme.outline, colorScheme.surface),
              _buildColorBlock('Outline Variant', colorScheme.outlineVariant, colorScheme.surface),
              _buildColorBlock('Surface Tint', colorScheme.surfaceTint, colorScheme.onPrimary),
              const SizedBox(height: 20),
              const Text(
                'Note: These blocks demonstrate different colors used in Material Theme.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorBlock(String label, Color backgroundColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}

class ColorPickerDialog extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ColorPickerDialog({
    required this.selectedColor,
    required this.onColorSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Convert both lists to List<Color> to avoid type issues.
    final List<Color> colors = [
      ...Colors.primaries,
    ].map((color) => color as Color).toList();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: colors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final color = colors[index];
            return GestureDetector(
              onTap: () {
                onColorSelected(color);
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                width: 50,
                height: 50,
                child: selectedColor == color
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
