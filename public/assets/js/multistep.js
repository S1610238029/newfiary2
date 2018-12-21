/**
 * Created by Natascha on 06.11.2018.
*/
$(".costum-button").on("click", function() {
    $("body").scrollTop(0);
});

var errorP='<p class="errors">Pflichtfeld darf nicht leer sein!</p>';




/* Erster Test der Animationen für die Progress Bar beim Eintrag erstellen */




    $(".custom-button").click(function() {
        $("html, body").animate({
            scrollTop: 0
        }, 800);
        return false;
    });




    /* Abbrechen */
$(document).ready(function() {

    /*on document load hide all einsatzkategories*/
    $('div#brandeinsatz').hide();
    $('div#brandsicherheitswache').hide();
    $('div#technischerEinsatz').hide();

    /*wrap input+label checkboxes into a div*/
    $('input[type=checkbox]+label').each(function () {
        $(this).prepend($(this).prev());
        $(this).wrap("<div class='col-6 col-sm-6 col-lg-3 left checkboxFormat'></div>");
    });
    $('input[type=radio]+label').each(function () {
        $(this).prepend($(this).prev());
        $(this).wrap("<div class='col-6 col-sm-6 col-lg-3 left checkboxFormat'></div>");
    });

    $('div#form_anlass div').each(function () {
        $(this).removeClass("col-lg-3");
        $(this).addClass("col-lg-6");
    });

    $('div.uebung').hide();
    $('div.einsatz').hide();
    $('div.tätigkeiten').hide();

    $('#form_save').addClass("custom-button");
    $('#form_save').unwrap();

    var textkategorie=sessionStorage.getItem('kategorie');
    $("p#kategorie_einfügen").text('Kategorie: ' + textkategorie);

    /*$('button.next-button').hide();*/

    if($("#createEntry_beginnZeit").val()!= null){
        $('button.next-button').show();
}

    /*while clicking on one of the main kategories*/
    $(".kategorie").click(function () {

    $('button.next-button').show();



        var kategorie = $(this).val();
        console.log(kategorie);
        sessionStorage.setItem('kategorie', kategorie);

    });




        if (textkategorie == 'Einsatz') { //Einsatz
            $('#createEntry_kategorie option[value="Einsatz"]').attr("selected", "selected");
            $("#title").text(textkategorie + 'details');
            $("#subtitle").text('Bitte gib hier die Details des Einsatzes bekannt!');


            $('div.uebung').hide();
            $('div.tätigkeiten').hide();
            $('div.einsatz').show();
            $('#createEntry_unterkategorie option').slice(4, 61).remove(); //remove übung

        } else if (textkategorie == 'Übung') { //Übung
            $('#createEntry_kategorie option[value="Übung"]').attr("selected", "selected");
            $("#title").text(textkategorie + 'sdetails');
            $("#subtitle").text('Bitte gib hier die Details der ' + textkategorie + ' bekannt!');

            $('#createEntry_unterkategorie option').slice(1, 4).remove();
            $('#createEntry_unterkategorie option').slice(27, 61).remove();

            $('div.einsatz').hide();
            $('div.tätigkeiten').hide();
            $('div.uebung').show();

            $('#lage label').text("Übungsannahme");
            $('#form_lagebeimEintreffen').attr("placeholder", "Genaue Beschreibung der Übungsannahme...");

        } else { //Tätigkeit
            $('#createEntry_kategorie option[value="Tätigkeit"]').attr("selected", "selected");
            $("#title").text(textkategorie + 'sdetails');
            $("#subtitle").text('Bitte gib hier die Details der ' + textkategorie + ' bekannt!');

            $('#createEntry_unterkategorie option').slice(1, 30).remove();

            $('div.einsatz').hide();
            $('div.uebung').hide();
            $('div.tätigkeiten').show();
        }


        //$('#form_unterunterkategorie').attr('required', 'true');
        $('#createEntry_unterkategorie').attr('required', 'true');

        $('#createEntry_unterkategorie').change(function () {
            var selectedKategorie = $(this).val();
            console.log(selectedKategorie);
            if (selectedKategorie == '0') { //brandeinsatz
                $('div#brandsicherheitswache').hide();
                $('div#brandsicherheitswache input').attr('disabled', 'true');
                $('div#technischerEinsatz').hide();
                $('div#technischerEisnatz select').attr('disabled', 'true');
                $('div#brandeinsatz').show();
            } else if (selectedKategorie == '1') {
                $('div#brandeinsatz').hide();
                $('div#brandeinsatz input').attr('disabled', 'true');
                $('div#technischerEinsatz').hide();
                $('div#technischerEisnatz select').attr('disabled', 'true');
                $('div#brandsicherheitswache').show();
            } else if (selectedKategorie == '2') {

                $('div#brandsicherheitswache').hide();
                $('div#brandsicherheitswache input').attr('disabled', 'true');
                $('div#brandeinsatz').hide();
                $('div#brandeinsatz input').attr('disabled', 'true');
                $('div#technischerEinsatz').show();
            } else if (selectedKategorie == '3'){
                $('div#brandeinsatz').hide();
                $('div#brandeinsatz input').attr('disabled', 'true');
                $('div#brandsicherheitswache').hide();
                $('div#brandsicherheitswache input').attr('disabled', 'true');
                $('div#technischerEinsatz').hide();
                $('div#technischerEisnatz select').attr('disabled', 'true');
                $('div#createEntry_unterunterkategorie').attr('required', 'true');

            }





    });

});



$(document).ready(function() {
    var open = $('.open-navnew'),
        close = $('.close');


    open.click(function() {
        if($('#wrapper').hasClass('toggled')){

            $('#wrapper').removeClass('toggled');
        }else{

            $('#wrapper').addClass('toggled');
        }

    });




    $('#häuser_newentry').DataTable( {
        "order": [[ 0, "asc" ]],
        "stateSave": true,
        "pagingType": "simple",
        "lengthMenu": [[3, 5, 10, 20, -1], [3, 5, 10, 20, "All"]],
        "language": {
            "lengthMenu": "Zeige _MENU_ Einträge pro Seite",
            "zeroRecords": "Nichts gefunden - sorry",
            "info": "Seite _PAGE_ von _PAGES_",
            "infoEmpty": "Keien Einträge verfügbar",
            "infoFiltered": "(gefiltert von _MAX_ Gesamteinträgen)",
            "search": "Suchen",
            "paginate":{
                "previous":"<",
                "next":">"
            }


        }
    } );
});





