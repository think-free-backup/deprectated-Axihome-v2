import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{

    property color borderColor: "#00000000"
    property alias temperature : bt_temperature.text
    property alias place : bt_name.text

//    RectangularGlow {

//        anchors.fill: rect
//        glowRadius: width / 100
//        spread: 0.1
//        color: rect.border.color
//        opacity: 0.8
//        cornerRadius: rect.radius + glowRadius
//    }

    Rectangle{

        id: rect

        color: "#111"
        radius: 6
        border.width: 1
        border.color: parent.borderColor
        anchors.fill: parent

        Text{

            id: bt_temperature
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: parent.width /100 * 5
            color: "#aaa"
            font.pixelSize: parent.parent.height / 4
            font.family: axifont
            font.bold: true
            text: ""
        }

        Text{

            id: bt_name
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: parent.width /100 * 5
            color: "#eee"
            font.pixelSize: parent.parent.height / 4
            font.family: axifont
            font.bold: true
            text: ""
        }
    }
}
