import QtQuick 2.2

Item{

    id: mimicview

    property double mimicscale : 8.5
    property bool screenOrientationLandscape : width > height

    ListView {

        anchors.fill: parent
        orientation: ListView.Horizontal
        clip: true
        snapMode: ListView.SnapOneItem

        model: ListModel {
            ListElement {
                name: "bas"
            }
            ListElement {
                name: "bas"
            }
            ListElement {
                name: "bas"
            }
        }
        delegate: Item{

            width: mimicview.width
            height: mimicview.height

            Item{

                id: loaderitem

                width: mimicview.mimicscale * mimicview.width/10
                height: mimicview.mimicscale * mimicview.height/10
                anchors.centerIn: parent

                Loader{

                    id:loader

                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../mimics/" + name + ".qml"

                    state: screenOrientationLandscape ? "Landscape" : "Portrait"

                    states: [
                        State {
                            name: "Landscape"
                            PropertyChanges { target: loader; anchors.verticalCenter: loaderitem.verticalCenter}
                            PropertyChanges { target: loader; anchors.top: undefined}
                            PropertyChanges { target: loader; height: parent.height}
                            PropertyChanges { target: loader; width: (height / 3) * 4}
                            PropertyChanges { target: loader; anchors.topMargin: 0}
                        },
                        State {
                            name: "Portrait"
                            PropertyChanges { target: loader; anchors.verticalCenter: undefined}
                            PropertyChanges { target: loader; anchors.top: loaderitem.top}
                            PropertyChanges { target: loader; height: (width / 3) * 2}
                            PropertyChanges { target: loader; width: parent.width}
                            PropertyChanges { target: loader; anchors.topMargin: loaderitem.height / 10}
                        }
                    ]
                }
            }
        }
    }
}
