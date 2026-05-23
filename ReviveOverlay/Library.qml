import QtQuick;
import Qt.labs.folderlistmodel;
import "Oculus.js" as Oculus;

Item {
    property string library;
    property string libraryURL;

    FolderListModel {
        folder: libraryURL + 'Manifests/';
        nameFilters: ["*.json"];
        showDirs: false;
        onCountChanged: {
            Oculus.removeLibrary(library)
            for (var i = 0; i < count; i++) {
                Oculus.loadManifest(get(i, "fileURL"), library);
            }
        }
    }
}
