import QtQuick 2.3

FocusScope {
    id: _root
    property bool _FORM_TYPE_FORM: true

    property var validator: null

    signal accepted()
    signal rejected()
    signal submitted()

    function resetFocus() {
        _focusFirstInput(this)
    }

    function checkInput(element) {
        var ok = true
        for (var i = 0; i < element.children.length; ++i)
        {
            var child = element.children[i]
            if (!child._FORM_TYPE_IGNORE_IN_FORM_VALIDATION)
            {
                if (child._FORM_TYPE_ACCEPTABLE)
                {
                    if (!child.acceptableInput)
                    {
                        ok = false
                    }
                }
                ok = ok && checkInput(child)
            }
        }
        return ok
    }

    onSubmitted: {
        var accept = false
        if (validator)
        {
            if (validator() && checkInput(this)) accept = true
        }
        else
        {
            if (checkInput(this)) accept = true
        }

        if (accept) accepted()
        else rejected()
    }

    function submit() {
        submitted()
    }

    Keys.onReturnPressed: submitted()
    Keys.onEnterPressed: submitted()

    function clear()
    {
        clearElement(this)
    }

    function clearElement(element)
    {
        for (var i = 0; i < element.children.length; ++i)
        {
            var child = element.children[i]
            if (!child._FORM_TYPE_IGNORE_IN_FORM_CLEARING)
            {
                if (child._FORM_TYPE_INPUT_TEXT)
                {
                    child.text = ""
                }
                clearElement(child)
            }
        }
    }

    function _focusFirstInput(element)
    {
        var found = false
        for (var i = 0; i < element.children.length && found == false; ++i)
        {
            var child = element.children[i]
            if (child._FORM_TYPE_INPUT)
            {
                child.focus = true
                found = true
            }
            found = found || _focusFirstInput(child)
        }
        return found
    }

    Component.onCompleted: _focusFirstInput(this)
}
