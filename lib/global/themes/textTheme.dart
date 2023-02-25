import 'dart:ui';

import 'package:flutter/material.dart';

const myTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: displayFont,
    fontSize: 57,
    height: 1.123,
    fontVariations: [
      FontVariation('wght', 400)
    ],
  ),
  displayMedium: TextStyle(
    fontFamily: displayFont,
    fontSize: 45,
    height: 1.156,
    fontVariations: [
      FontVariation('wght', 400)
    ]
  ),
  displaySmall: TextStyle(
    fontFamily: displayFont,
    fontSize: 36,
    height: 1.222,
    fontVariations: [
      FontVariation('wght', 400)
    ]
  ),
  headlineLarge: TextStyle(
    fontFamily: headlineFont,
    fontSize: 32,
    height: 1.25,
    fontVariations: [
      FontVariation('opsz',100),
      FontVariation('wght', 400)
    ]
  ),
  headlineMedium:TextStyle(
    fontFamily: headlineFont,
    fontSize: 28,
    height: 1.286,
    fontVariations: [
      FontVariation('opsz',100),
      FontVariation('wght', 400)
    ]
  ),
  headlineSmall:TextStyle(
    fontFamily: headlineFont,
    fontSize: 24,
    height: 1.333,
    fontVariations: [
      FontVariation('opsz',100),
      FontVariation('wght', 400)
    ]
  ),
  titleLarge: TextStyle(
    fontFamily: titleFont,
    fontSize: 22,
    height: 1.273,
    fontVariations: [
      FontVariation('wght', 400)
    ]
  ),
  titleMedium: TextStyle(
    fontFamily: titleFont,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.15,
    fontVariations: [
      FontVariation('wght', 500)
    ]
  ),
  titleSmall: TextStyle(
    fontFamily: titleFont,
    fontSize: 14,
    height: 1.428,
    letterSpacing: 0.1,
    fontVariations:[
      FontVariation('wght', 500)
    ]
  ),
  labelLarge: TextStyle(
    fontFamily: labelFont,
    fontSize: 14,
    height: 1.428,
    letterSpacing: 0.1,
    fontVariations: [
      FontVariation('wght', 500)
    ]
  ),
  labelMedium: TextStyle(
    fontFamily: labelFont,
    fontSize: 12,
    height: 1.333,
    letterSpacing: 0.5,
    fontVariations: [
      FontVariation('wght', 500)
    ]
  ),
  labelSmall: TextStyle(
    fontFamily: labelFont,
    fontSize: 11,
    height: 1.45,
    letterSpacing: 0.5,
    fontVariations:[
      FontVariation('wght', 500)
    ]
  ),
  bodyLarge: TextStyle(
    fontFamily: bodyFont,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
    fontVariations:[
      FontVariation('wght', 400),
    ]
  ),
  bodyMedium: TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    height: 1.428,
    letterSpacing: 0.25,
    fontVariations: [
      FontVariation('wght', 400)
    ]
  ),
  bodySmall: TextStyle(
    fontFamily: bodyFont,
    fontSize: 12,
    height: 1.333,
    letterSpacing: 0.4,
    fontVariations: [
      FontVariation('wght', 400)
    ]
  )
);
const displayFont = 'Unbounded';
const headlineFont = 'Literata';
const titleFont = 'Unbounded';
const bodyFont = 'Roboto Flex';


const labelFont = 'Roboto Flex';
