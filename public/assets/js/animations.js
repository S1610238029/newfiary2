function closeNav(){
    var sidebar = document.getElementById("sidebar").classList.toggle("active");
    document.getElementById("placeholder").classList.toggle("active");
    document.getElementById("arrow").classList.toggle("active");
    console.log("toggle");
}

$(document).ready(function() {
    $('#example').DataTable( {
        "order": [[ 3, "asc" ]],
        "stateSave": true,
        "language": {
            "lengthMenu": "Zeige _MENU_ Einträge pro Seite",
            "zeroRecords": "Nichts gefunden - sorry",
            "info": "Seite _PAGE_ von _PAGES_",
            "infoEmpty": "Keien Einträge verfügbar",
            "infoFiltered": "(gefiltert von _MAX_ Gesamteinträgen)",
            "search": "Suchen",
            "paginatePrevious": "Vorherige"
        }

    } );
} );

