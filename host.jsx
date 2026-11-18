// Вызывается из панели: вставляет GIF в активную композицию.
function insertGif(path) {
    var comp = app.project.activeItem;
    if (!(comp instanceof CompItem)) {
        return "Открой композицию и сделай её активной";
    }
    var f = new File(path);
    if (!f.exists) {
        return "Файл не найден: " + path;
    }

    app.beginUndoGroup("Вставить GIF");
    try {
        var footage = app.project.importFile(new ImportOptions(f));
        var layer = comp.layers.add(footage);

        layer.property("Position").setValue([comp.width / 2, comp.height / 2]);

        var k = Math.min(comp.width / footage.width, comp.height / footage.height) * 100;
        layer.property("Scale").setValue([k, k]);

        // Зациклить GIF на всю длину композиции
        layer.timeRemapEnabled = true;
        layer.property("Time Remap").expression = "loopOut('cycle')";
        layer.outPoint = comp.duration;
        layer.startTime = comp.time;
    } catch (e) {
        app.endUndoGroup();
        return "Ошибка: " + e.toString();
    }
    app.endUndoGroup();
    return "OK";
}
