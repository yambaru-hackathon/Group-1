import 'package:flutter/material.dart';

class CountryDropdownButton extends StatelessWidget {
  const CountryDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.removeOption = true,
  });

  final String? value;
  final Function(String?) onChanged;
  final bool removeOption;

  @override
  Widget build(BuildContext context) {
    List<String> countryOptions = [
      'すべて',
      'シンガポール',
      '日本',
      '中国',
      'インド',
      'タイ',
      'ベトナム',
      'マレーシア',
      'フィリピン',
      'インドネシア',
      '台湾',
      '韓国',
    ];

    if (!removeOption) {
      countryOptions.remove('すべて');
    }

    return DropdownButton<String>(
      value: value,
      onChanged: (newValue) => onChanged(newValue),
      items: countryOptions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class GenderDropdownButton extends StatelessWidget {
  const GenderDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    List<String> genderOptions = ['男性', '女性', '選択しない'];
    return DropdownButton<String>(
      value: genderOptions.contains(value) ? value : null,
      onChanged: (newValue) => onChanged(newValue == '選択しない' ? null : newValue),
      items: genderOptions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class TPODropdownButton extends StatelessWidget {
  const TPODropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    List<String> tpoOptions = [
      '海',
      '旅行',
      'キャンパス',
      'カフェ',
      'デート',
      'オフィス',
      '選択しない'
    ];
    return DropdownButton<String>(
      value: value,
      onChanged: (newValue) => onChanged(newValue == '選択しない' ? null : newValue),
      items: tpoOptions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class SeasonDropdownButton extends StatelessWidget {
  const SeasonDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    List<String> seasonOptions = ['春', '夏', '秋', '冬', '選択しない'];
    return DropdownButton<String>(
      value: value,
      onChanged: (newValue) => onChanged(newValue == '選択しない' ? null : newValue),
      items: seasonOptions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
