/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Mobility Components.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

// Based on http://www.geeks3d.com/20100909/shader-library-gaussian-blur-post-processing-filter-in-glsl/

import QtQuick 2.0

Item {
id: root
    property alias targetWidth: verticalShader.targetWidth
    property alias targetHeight: verticalShader.targetHeight
    property alias source: verticalShader.source

    // Constant properties which must be supported by every effect
    property int numParameters: 1
    property bool supportsDivider: true

    property real param1Value: 0.5
    property real dividerValue: 0.5

    Effect {
        id: verticalShader
        anchors.fill:  parent
        property real dividerValue: parent.dividerValue
        property real blurSize: 4.0 * parent.param1Value / targetHeight
        fragmentShaderFilename: "shaders/gaussianblur_v.fsh"
    }

    Effect {
        id: horizontalShader
        anchors.fill: parent
        property real dividerValue: parent.dividerValue
        property real blurSize: 4.0 * parent.param1Value / targetWidth
        fragmentShaderFilename: "shaders/gaussianblur_h.fsh"
        source: horizontalShaderSource

        ShaderEffectSource {
            id: horizontalShaderSource
            sourceItem: verticalShader
            smooth: true
            hideSource: true
        }
    }
}
