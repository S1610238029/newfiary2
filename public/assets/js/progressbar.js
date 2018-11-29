/**
 * Created by Natascha on 06.11.2018.
*/
$(".costum-button").on("click", function() {
    $("body").scrollTop(0);
});

/* Erster Test der Animationen für die Progress Bar beim Eintrag erstellen */
$(document).ready(function() {
    $(".next-button").click(function() {
        var current = $(this).parent();
        var next = $(this)
            .parent()
            .next();
        $(".progressbar li")
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
        $(".progressbar li")
            .eq($("fieldset").index(current))
            .removeClass("active");
        current.hide();
        prev.show();
    });



    $(".custom-button").click(function() {
        $("html, body").animate({
            scrollTop: 0
        }, 800);
        return false;
    });



    /* Funktioniert noh nicht 100% */
  /*  $(".reset-button").click(function() {
        var current = $(this).parent();
        var next = $(this)
            .first();
        $(".progress li")
            .eq($("fieldset").index(0))
            .addClass("active");
        current.hide();
        next.show();
    });*/
    $(".reset-button").click(function() {
        var current = $(this).parent();
        $(".progressbar li").removeClass("active");
        $(".progressbar li:first-child").addClass("active");
        current.hide();
        $("fieldset#kategoriewahl").show();
    });


    /* Abbrechen */


    /*on document load hide all einsatzkategories*/
    $('div#brandeinsatz').hide();
    $('div#brandsicherheitswache').hide();
    $('div#technischerEinsatz').hide();

    /*wrap input+label checkboxes into a div*/
    $('input[type=checkbox]+label').each(function(){
        $(this).prepend($(this).prev());
        $(this).wrap("<div class='col-6 col-sm-6 col-lg-3 left checkboxFormat'></div>");
    });
    $('input[type=radio]+label').each(function(){
        $(this).prepend($(this).prev());
        $(this).wrap("<div class='col-6 col-sm-6 col-lg-3 left checkboxFormat'></div>");
    });

    $('div.uebung').hide();
    $('div.einsatz').hide();

    /*while clicking on one of the main kategories*/
    $(".kategorie").click(function() {
        var kategorie=$(this).val();
        $("p#kategorie_einfügen").text('Kategorie: '+ kategorie);

        if(kategorie=='Einsatz') {
            $("#title").text(kategorie + 'details');
            $("#subtitle").text('Bitte gib hier die Details des Einsatzes bekannt!');
            $('#form_unterkategorie').prepend($('<option>', {value : '', selected : 'selected', text: 'Bitte wählen...'}));

            $('div.uebung').hide();
            $('div.einsatz').show();
        }else{
            $("#title").text(kategorie + 'sdetails');
            $("#subtitle").text('Bitte gib hier die Details der '+ kategorie +' bekannt!');

            $('div.einsatz').hide();
            $('div.uebung').show();
        }

        $('#form_unterunterkategorie').prepend($('<option>', {value : '', selected : 'selected', text: 'Bitte wählen...'}));
        $('#form_unterunterkategorie').attr('required', 'true');
        $('#form_unterkategorie').attr('required', 'true');

        $('#form_unterkategorie').change(function(){
            var selectedKategorie=$(this).val();
            console.log(selectedKategorie);
            if(selectedKategorie=='0'){ //brandeinsatz
                $('div#brandsicherheitswache').hide();
                $('div#technischerEinsatz').hide();
                $('div#brandeinsatz').show();
            }else if(selectedKategorie=='1'){
                $('div#brandeinsatz').hide();
                $('div#technischerEinsatz').hide();
                $('div#brandsicherheitswache').show();
            }else if(selectedKategorie=='2'){

                $('div#brandsicherheitswache').hide();
                $('div#brandeinsatz').hide();
                $('div#technischerEinsatz').show();
            }else{
                $('div#brandeinsatz').hide();
                $('div#brandsicherheitswache').hide();
                $('div#technischerEinsatz').hide();

            }


        });



    });


});





