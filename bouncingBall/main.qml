import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Bouncing ball")

    Image {
        id: ball
        source: "/ball.png"
        y: 400

        MouseArea{
            anchors.fill: parent
            onClicked: ballAnim.running = true
        }

        ParallelAnimation{
            id: ballAnim

            NumberAnimation {
                target: ball
                property: "x"
                from: 50; to: 500; duration: 2000
                easing.type: "OutSine"
            }

            SequentialAnimation{
                NumberAnimation {
                    target: ball
                    property: "y"
                    from: 400; to: 100
                    duration: 500
                    easing.type: "OutSine"
                }


                NumberAnimation {
                    target: ball
                    property: "y"
                    from: 100; to: 400
                    duration: 1500
                    easing.type: "OutBounce"
                }
            }

            SequentialAnimation{
                RotationAnimation{
                    target: ball
                    properties: "rotation"
                    from: 0; to: 360
                    duration: 2000
                    direction: RotationAnimation.Clockwise
                }
            }



        }

    }
}
