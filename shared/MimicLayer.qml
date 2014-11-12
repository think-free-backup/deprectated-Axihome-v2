import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{

    clip: true

    property alias source : layerimage.source
    property alias overlayColor : overlay.color
    property alias overlayVisible : overlay.visible
    property alias glowColor :  glow.color
    property alias glowVisible : glow.visible

    Image {
        id: layerimage
        smooth: true
        source: ""
        anchors.fill: parent
    }

    Glow {
    
        id: glow
        anchors.fill: layerimage
        source: layerimage
        radius: 8
        samples: 16
        spread: 0.25
        visible: false
    }

    ColorOverlay {
        id: overlay
        anchors.fill: layerimage
        source: layerimage
    }
}
