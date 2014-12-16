import QtQuick 2.3
import QtQuick.Controls 1.2

FButton {
    text: qsTr("Submit")

    onButtonAction: {
        var form = findParentForm()
        if (!form)
        {
            console.warn("Parent form not found.")
        }
        else
        {
            form.submit()
        }
    }
}
