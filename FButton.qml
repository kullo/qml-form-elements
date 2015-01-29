import QtQuick 2.3
import QtQuick.Controls 1.2

Button {
    property bool _FORM_TYPE_IGNORE_IN_FORM_VALIDATION: true
    property bool _FORM_TYPE_IGNORE_IN_FORM_CLEARING: true

    signal buttonAction()

    onClicked: buttonAction()
    Keys.onReturnPressed: if (activeFocus) buttonAction()
    Keys.onEnterPressed: if (activeFocus) buttonAction()

    function findParentForm()
    {
        var elem = parent
        do {
            if (elem._FORM_TYPE_FORM)
            {
                return elem
            }
            elem = elem.parent
        } while (elem)
        return null
    }
}
