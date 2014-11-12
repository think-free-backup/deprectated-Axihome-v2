import QtQuick 2.2
import QtGraphicalEffects 1.0
import "shared"
import "shared/QmlComponants"

Item{

    id: axihome

    width : 1024
    height : 728

    property bool screenOrientationLandscape : width > height
    
    property alias axifont : axifontelem.name
    property double fontSize: height / 20

    FontLoader { id: axifontelem; source: "shared/assets/fonts/meiryo.ttf" }
    
    Image{
    
        anchors.fill: parent
        source: "shared/assets/wood.jpg"   
    }
    
    Rectangle{
    
        opacity: 0.8
        color: "#000000"
        anchors.fill:parent
    }


    /* Mimic view */

    MimicView{

        anchors.fill: parent
    }

    Text{

        id: time
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: parent.width /100 * 2.5
        color: "white"
        font.pixelSize: axihome.fontSize
        font.family: axifont
        font.bold: true
        text: "17:36"
    }
    
    Text{
    
        id: mode
        anchors.left: time.left
        anchors.top: time.bottom
        color: "#aaa"
        font.pixelSize: 2* (axifont.fontSize / 3)
        font.family: axifont
        text: "Away mode"
    }

    /* Menu button */

    IconButton{

        id: mainMenuButton

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: width
        width : screenOrientationLandscape ? parent.width / 30 : parent.width / 15
        height: width * 1.2
        radius: width / 10

        image: "../assets/menu.png"

        onClicked: if(mainMenu.visible) mainMenu.visible = false; else mainMenu.visible = true
    }

    /* Main menu */

    MouseArea{

        anchors.fill: parent
        enabled: mainMenu.visible

        onClicked: mainMenu.visible = false
    }

    RectangularGlow {

        anchors.fill: mainMenu
        glowRadius: mainMenu.radius
        spread: 0.1
        color: "#09c"
        opacity: 0.8
        visible: mainMenu.visible
        //cornerRadius: rect.radius + glowRadius
    }

    Rectangle{

        id: mainMenu

        height: parent.height / 1.1
        width: parent.width / 1.2
        anchors.bottom: mainMenuButton.bottom
        anchors.right: mainMenuButton.right

        color: "#111"
        radius: width / 100
        visible: false
    }

    /* Slider menu */

    Item{

        id: slider
        anchors.fill: parent

        states: [
            State {
                name: "hidden"
                PropertyChanges { target: sliderMenu; x: -sliderMenu.width}
            },
            State {
                name: "visible"
                PropertyChanges { target: sliderMenu; x: 0}
            }
        ]

        // Mouse hide menu

        MouseArea{

            anchors.fill: parent
            enabled: slider.state == "visible"

            onClicked: slider.state = "hidden"
        }

        // Slider menu content

        Item{

            id: sliderMenu

            anchors.top: parent.top
            x: -width

            height: parent.height
            width: screenOrientationLandscape ? parent.width / 4 : 2 * parent.width / 3

            Rectangle{

                anchors.fill: parent
                color: "#000"
                opacity: 0.9
            }

            Behavior on x{

                PropertyAnimation { duration: 150 }
            }

            MouseArea{

                anchors.fill: parent
            }

            ListView{

                property int marginPercent : 20

                anchors.fill: parent
                anchors.margins: parent.width / marginPercent
                anchors.topMargin: parent.width / marginPercent
                anchors.bottomMargin: parent.width / marginPercent
                model: 15
                spacing: parent.width / marginPercent

                delegate: SlideButton{

                    width: parent.width + parent.width / 10 - 10
                    visualWidth: parent.width - 10
                    x: 5
                    height: width /3
                    visual: SliderButtonVisual{

                        place: "Salon"
                        temperature: "21 ºC"
                        borderColor: (model.index % 7 == 0) ? "#c00" : "#9c0"
                    }

                    onSlided: {

                        slider.state = "hidden"
                    }
                }
            }
        }
    }

    /* Slider menu trigger */

    SwipeArea{

        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.width / 20
        height: parent.height

        activationAreaX: width/2

        onRight:
            slider.state = "visible"
    }
}
