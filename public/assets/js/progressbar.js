/**
 * Created by Natascha on 06.11.2018.
 */

/* Erster Test der Animationen für die Progress Bar beim Eintrag erstellen */
$(document).ready(function() {
    $(".next-button").click(function() {
        var current = $(this).parent();
        var next = $(this)
            .parent()
            .next();
        $(".progress li")
            .eq($("fieldset").index(next))
            .addClass("active");
        current.hide();
        next.show();
    });

    $(".prev-button").click(function() {
        var current = $(this).parent();
        var prev = $(this)
            .parent()
            .prev();
        $(".progress li")
            .eq($("fieldset").index(current))
            .removeClass("active");
        current.hide();
        prev.show();
    });

    /* Funktioniert noh nicht 100% */
    $(".reset-button").click(function() {
        var current = $(this).parent();
        var next = $(this)
            .first();
        $(".progress li")
            .eq($("fieldset").index(0))
            .addClass("active");
        current.hide();
        next.show();
    });

    /* Abbrechen */

    /*if kategorie is einsatz dann show fieldset with id="einsatz"*/
    $(".einsatz-button").click(function() {
        var current = $(this).parent();
        var next = $(this)
            .parent()
            .next();
        $(".progress li")
            .eq($("fieldset#einsatz").index(next))
            .addClass("active");
        current.hide();
        next.show();
        $("p#kategorie_einfügen").html("Kategorie Einsatz");
    });




});

