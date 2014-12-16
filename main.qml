import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

ApplicationWindow {
    title: qsTr("A real form")
    width: 640
    height: 480

    Component.onCompleted: form.forceActiveFocus()

    FForm {
        id: form
        padding: 15
        onAccepted: {
            var surname = surnameInput.text
            var name    = nameInput.text
            var phone   = phoneInput.text
            var lang    = langInput.currentText
            console.log("Surname:  '" + surname + "'")
            console.log("Name:     '" + name    + "'")
            console.log("Phone:    '" + phone   + "'")
            console.log("Language: '" + lang    + "'")
            console.log("Time:     '" + (new Date()).toLocaleString()   + "'")
        }
        onRejected: {
            console.warn("You are not done yet.")
        }

        Row {
            FLabel {
                text: qsTr("Surname")
                target: surnameInput
                width: 80
            }

            FTextField {
                id: surnameInput
                width: 200
            }
        }

        Row {
            FLabel {
                text: qsTr("Name")
                target: nameInput
                width: 80
            }

            FTextField {
                id: nameInput
                width: 200
            }
        }

        Row {
            FLabel {
                text: qsTr("Phone")
                target: phoneInput
                width: 80
            }

            FTextField {
                id: phoneInput
                width: 200
                validator: RegExpValidator {
                    regExp: /^(\+)?[-. 0-9]{9,12}$/
                }
            }
        }

        Row {
            FLabel {
                text: qsTr("Language")
                target: langInput
                width: 80
            }

            FComboBox {
                id: langInput
                model: ['en', 'fr', 'es', 'de']
            }
        }

        Row {
            anchors.right: parent.right

            FClearButton { }
            FSubmitButton { }
        }
    }
}
