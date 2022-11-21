using UnityEngine;
using UnityEditor;

public static class HandleUtilities
{
    public static void DrawSceneViewOutline(Vector3 pos, Color c, GUIStyle sty)
    {
        var eps = siz * 0.007f;
        var r = Vector3.right * eps;
        var u = Vector3.up * eps;
        Handles.Label(pos + r, c, sty);
        Handles.Label(pos - r, c, sty);
        Handles.Label(pos + u, c, sty);
        Handles.Label(pos - u, c, sty);

        Handles.Label(pos + r + u, c, sty);
        Handles.Label(pos - r + u, c, sty);
        Handles.Label(pos - r - u, c, sty);
        Handles.Label(pos + r - u, c, sty);
    }
}