library bwu_ng_elements.icon.icon;

import 'package:angular2/core.dart'
    show
        AfterViewInit,
        Component,
        ElementRef,
        Input,
        OnChanges,
        SimpleChange,
        ViewChild,
        ViewEncapsulation;
import 'dart:svg' show SvgElement;
import 'package:bwu_ng_elements/icon/iconset_registry.dart'
    show IconSetRegistry;
import 'package:bwu_ng_elements/icon/iconset_svg.dart' show BwuIconSetSvg;
import 'dart:html' show Element;

/// Display an icon provided by an icon set.
@Component(
    selector: 'bwu-icon',
    //encapsulation: ViewEncapsulation.Native,
    host: const {'[style.width]': 'width', '[style.height]': 'height',},
    template: '''
<svg #icon
  [attr.viewBox]="viewBoxSize"
  xmlns="http://www.w3.org/2000/svg"
  preserveAspectRatio="xMidYMid meet"
  style="pointer-events: none; display: block; width: 100%; height: 100%;"
  >
</svg>
''',
    styles: const [
      '''
:host {
  display: block;
  fill: currentColor;
}'''
    ])
class BwuIcon implements AfterViewInit, OnChanges {
  ///
  BwuIcon(this._iconSetRegistry) {
    _iconSetRegistry.iconSetAdded.listen((String iconSetName) {
      if (_svgIcon == null && icon != null && icon.isNotEmpty) {
        _updateIcon(icon);
      }
    });
  }

  SvgElement _svgIcon;

  /// Returns the SVG of the icon.
  SvgElement get svgIcon => _svgIcon;

  @ViewChild('icon')

  /// The DOM element where the icon is appended when inserted into the DOM.
  ElementRef iconRef;

  String _width;

  /// Get the current element width.
  @Input()
  String get width => _width ?? '24px';

  /// Set the element width.
  @Input()
  set width(String value) {
    _width = value;
  }

  String _height;

  /// Get the current element width.
  @Input()
  String get height => _height ?? width;

  /// Set the element width.
  @Input()
  set height(String value) {
    _height = value;
  }

  IconSetRegistry _iconSetRegistry;

  /// The id of the icon.
  /// For an icon of the default iconset this is just the icon name, for icons
  /// of other iconsets the format is `IconSetName:IconName`.
  @Input()
  String icon;

  /// The viewbox size used for the icon.
  @Input()
  String size;

  /// Get the viewbox size string calculated from [size].
  String get viewBoxSize {
    if (size != null) {
      return '0 0 $size $size';
    }
    final BwuIconSetSvg iconSet = _getIconSet(icon);
    if (iconSet == null) {
      return '0 0 ${BwuIconSetSvg.defaultSize} ${BwuIconSetSvg.defaultSize}';
    }
    return '0 0 ${iconSet.size} ${iconSet.size}';
  }

  BwuIconSetSvg _getIconSet(String iconName) {
    String iconSetName;
    if (iconName == null || iconName.isEmpty) {
      iconSetName = _iconSetRegistry.defaultIconSetName;
    } else {
      iconSetName = iconName.contains(':')
          ? iconName.substring(0, iconName.lastIndexOf(':'))
          : _iconSetRegistry.defaultIconSetName;
    }
    if (iconName == null || iconName.isEmpty) {
      iconSetName = _iconSetRegistry.defaultIconSetName;
    }
    return _iconSetRegistry.iconSets[iconSetName];
  }

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    changes.forEach((String property, SimpleChange change) {
      if (property == 'icon' && change.currentValue is String) {
        _updateIcon(change.currentValue);
      }
    });
  }

  void _updateIcon(String iconName) {
    if (_svgIcon != null) {
      _svgIcon.remove();
    }
    if (iconRef != null && iconName != null && iconName.isNotEmpty) {
      final BwuIconSetSvg iconSet = _getIconSet(iconName);
      if (iconSet != null) {
        String iconId = iconName.contains(':')
            ? iconName.substring(iconName.lastIndexOf(':') + 1)
            : iconName;
        _svgIcon = iconSet.getIcon(iconId);
        if (_svgIcon != null) {
          (iconRef.nativeElement as Element).append(_svgIcon);
        }
      }
    }
  }

  @override
  void ngAfterViewInit() {
    _updateIcon(icon);
  }
}
