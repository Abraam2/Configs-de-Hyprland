import Quickshell
import qs.Data as Dat
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtMultimedia

Scope {
    id: root
    property bool shouldShow: false
    property var targetScreen: null

    Process {
        id: poweroffProcess
        command: ["/home/abraham/.mydotfiles/com.ml4w.dotfiles/.config/custom_Scripts/power.sh", "shutdown"]
        running: false
    }
    Process {
        id: restartProcess
        command: ["/home/abraham/.mydotfiles/com.ml4w.dotfiles/.config/custom_Scripts/power.sh", "reboot"]
        running: false
    }
    Process {
        id: logoutProcess
        command: ["/home/abraham/.mydotfiles/com.ml4w.dotfiles/.config/custom_Scripts/power.sh", "exit"]
        running: false
    }

    LazyLoader {
        active: true
        PanelWindow {
            id: p3rpauseWindow
            visible: root.shouldShow
            screen: root.targetScreen
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: visible ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None
            anchors {
                right: true
                left: true
                top: true
                bottom: true
            }
            onVisibleChanged: {
                if (visible)
                    overlay.resetMenu();
            }
            Rectangle {
                id: overlay
                anchors.fill: parent
                color: "transparent"
                property int stage: 0

                property int activeIndex: 0

                function resetMenu() {
                    stage = 0;
                    opacity = 1;
                    activeIndex = 0;
                    
                    // Reseteamos las imágenes
                    pngSequence.visible = false;
                    pngSequence.currentFrame = 0;
                    
                    // Reseteamos la capa media (Transición)
                    part2Video.stop();
                    part2Video.visible = false;
                    
                    // Reseteamos la capa fondo (Bucle infinito)
                    part3Video.stop();
                    part3Video.visible = true; // Se queda visible al fondo preparándose
                    
                    startDelay.start();
                }
                
                Timer {
                    id: startDelay
                    interval: 80
                    repeat: false
                    onTriggered: {
                        pngSequence.visible = true;
                        frameAnimation.start();
                    }
                }

                NumberAnimation {
                    id: hideAnimation
                    target: overlay
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 300
                    easing.type: Easing.InCubic
                    onFinished: {
                        frameAnimation.stop();
                        part2Video.stop();
                        part3Video.stop();
                        root.shouldShow = false;
                        overlay.stage = 0;
                        pngSequence.currentFrame = 0;
                        Qt.quit();
                    }
                }

                // ==========================================
                // CAPA 1 (AL FONDO DEL TODO): Bucle Infinito
                // ==========================================
                Video {
                    id: part3Video
                    anchors.fill: parent
                    source: Qt.resolvedUrl("../Assets/p3r menu/part3.mp4")
                    fillMode: VideoOutput.PreserveAspectCrop
                    loops: MediaPlayer.Infinite
                    volume: 0
                    visible: true // Siempre visible para evitar parpadeos
                }

                // ==========================================
                // CAPA 2 (EN MEDIO): Vídeo de Transición
                // ==========================================
                Video {
                    id: part2Video
                    anchors.fill: parent
                    source: Qt.resolvedUrl("../Assets/p3r menu/part2.mp4")
                    fillMode: VideoOutput.PreserveAspectCrop
                    volume: 0
                    visible: false
                    onPositionChanged: {
                        // Arrancamos el vídeo del fondo 80ms antes de que este termine
                        if (duration > 0 && position >= duration - 80 && overlay.stage === 1) {
                            part3Video.play();
                        }
                    }
                    onPlaybackStateChanged: {
                        // Cuando termine la transición, simplemente la ocultamos.
                        // El vídeo 3 ya estará corriendo justo debajo. Cero cortes.
                        if (playbackState === MediaPlayer.StoppedState && overlay.stage === 1) {
                            overlay.stage = 2;
                            part2Video.visible = false;
                        }
                    }
                }

                // ==========================================
                // CAPA 3 (FRENTE): Secuencia PNG Intro
                // ==========================================
                Image {
                    id: pngSequence
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    visible: false
                    cache: true
                    asynchronous: false
                    property int currentFrame: 0
                    property int totalFrames: 12
                    property int frameRate: 60
                    source: Qt.resolvedUrl("../Assets/p3r menu/png/pngseq" + String(currentFrame).padStart(2, '0') + ".png")

                    onStatusChanged: {
                        if (status === Image.Ready && currentFrame === 0) {
                            // Listo
                        }
                    }

                    Timer {
                        id: frameAnimation
                        interval: 17
                        repeat: true
                        onTriggered: {
                            if (pngSequence.currentFrame < pngSequence.totalFrames - 1) {
                                pngSequence.currentFrame++;
                            } else {
                                stop();
                                pngSequence.visible = false;
                                overlay.stage = 1;
                                part2Video.visible = true;
                                part2Video.play();
                            }
                        }
                    }
                }

                // ── Opciones de Energía ──
                Item {
                    id: powerOptionsContainer
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: 50
                    anchors.verticalCenterOffset: 10
                    width: 800
                    height: 500
                    visible: overlay.stage >= 1
                    z: 10

                    PowerItem {
                        myIndex: 0
                        offsetY: -75
                        itemRotation: 3
                        normalIcon: Qt.resolvedUrl("../Assets/iconpack/shutdown.png")
                        hoverIcon: Qt.resolvedUrl("../Assets/iconpack/shutdown1.png")
                        action: () => poweroffProcess.running = true
                    }
                    PowerItem {
                        myIndex: 1
                        offsetY: 100
                        itemRotation: -5
                        normalIcon: Qt.resolvedUrl("../Assets/iconpack/restart.png")
                        hoverIcon: Qt.resolvedUrl("../Assets/iconpack/restart1.png")
                        action: () => restartProcess.running = true
                    }
                    PowerItem {
                        myIndex: 2
                        offsetY: 300
                        itemRotation: -12
                        normalIcon: Qt.resolvedUrl("../Assets/iconpack/logout.png")
                        hoverIcon: Qt.resolvedUrl("../Assets/iconpack/logout1.png")
                        action: () => logoutProcess.running = true
                    }
                }

                // ── Dismiss y Teclado ──
                FocusScope {
                    anchors.fill: parent
                    focus: visible

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.BlankCursor
                    }

                    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Escape) {
                            hideAnimation.start();
                            event.accepted = true;
                        } else
                        if (event.key === Qt.Key_Down || event.key === Qt.Key_Right) {
                            overlay.activeIndex = (overlay.activeIndex + 1) % 3;
                            event.accepted = true;
                        } else if (event.key === Qt.Key_Up || event.key === Qt.Key_Left) {
                            overlay.activeIndex = (overlay.activeIndex - 1 + 3) % 3;
                            event.accepted = true;
                        } else
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            if (overlay.activeIndex === 0)
                                poweroffProcess.running = true;
                            else if (overlay.activeIndex === 1)
                                restartProcess.running = true;
                            else if (overlay.activeIndex === 2)
                                logoutProcess.running = true;
                            event.accepted = true;
                        } else
                        if (event.key === Qt.Key_S) {
                            poweroffProcess.running = true;
                            event.accepted = true;
                        } else if (event.key === Qt.Key_R) {
                            restartProcess.running = true;
                            event.accepted = true;
                        } else if (event.key === Qt.Key_E) {
                            logoutProcess.running = true;
                            event.accepted = true;
                        }
                    }
                }
            }
        }
    }

    component PowerItem: Item {
        id: powerItemRoot
        required property string normalIcon
        required property string hoverIcon
        required property var action
        required property int myIndex
        property real itemRotation: 0
        property int offsetY: 0

        x: 30
        y: offsetY
        width: 900
        height: 350
        rotation: itemRotation

        property bool isCurrentlyActive: overlay.activeIndex === myIndex

        scale: isCurrentlyActive ? 1.1 : 1.0
        transformOrigin: Item.Center
        Behavior on scale {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: powerItemRoot.isCurrentlyActive ? powerItemRoot.hoverIcon : powerItemRoot.normalIcon
        }
    }
}
