import QtQuick 2.3
import QtQuick.Controls 1.2

ComboBox {
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

    function primaryAction()
    {
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

    Keys.onReturnPressed: primaryAction()
    Keys.onEnterPressed: primaryAction()
}

