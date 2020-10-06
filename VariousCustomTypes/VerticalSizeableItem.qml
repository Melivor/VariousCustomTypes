import QtQuick 2.12
import "../Style"
Rectangle {
    id:rootItem
    color:horusTheme.foregroundColor
    border.color: horusTheme.borderColor
    onEnabledChanged: PropertyAnimation { target: rootItem; property: "height"; duration: 300; to: enabled?implicitHeight:0 }
    radius: horusTheme.baseRadius
    property int maximumHeight:parent.height
    property int minimumHeight:0
    //    Rectangle{
    //        anchors.top:parent.top
    //        width:parent.width
    //        height: 7
    //        color:"light grey"

    //    }
    Rectangle {
        implicitWidth: parent.width
        implicitHeight: 4
        MouseArea{
            id:mouseArea
            //property real yStart:
            property bool hovered:false
            hoverEnabled: true
            anchors.fill:parent
            //onPressed:cursorShape=Qt.SplitVCursor
            onMouseYChanged: {
                if(pressed){
                    if((rootItem.height+height/2-mouseY)<maximumHeight && (rootItem.height+height/2-mouseY)>minimumHeight){
                        rootItem.y=(rootItem.y-mouseY);
                        rootItem.height=(rootItem.height+height/2-mouseY);
                        rootItem.implicitHeight=rootItem.height
                    }


                }
            }
            onEntered: {hovered=true;}
            onExited: hovered=false
            Component.onCompleted: cursorShape=Qt.SplitVCursor
        }
        Rectangle{

            implicitWidth: parent.width
            implicitHeight: parent.height/4
            color: mouseArea.hovered ? mouseArea.pressed ?Qt.darker(horusTheme.borderColor, 1.1):Qt.darker(horusTheme.borderColor, 1.2)
            : horusTheme.borderColor
        }

            //visible: SplitHandle.hovered ?true:false

        }
            Behavior on visible {
                NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
            }
        }