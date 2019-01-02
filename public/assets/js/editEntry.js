$(document).ready(function() {

    var selectedKategorie = $('#createEntry_unterkategorie').val();
    toggleVisibility(selectedKategorie);

   $('#createEntry_unterkategorie').change(function() {
        selectedKategorie = $(this).val();
       toggleVisibility(selectedKategorie);
    });

});

function toggleVisibility(select) {
    var unterkategorieDiv = $('#createEntry_unterunterkategorie').parent();
    var brandeinsatz = $('#createEntry_brandeinsatz').parent();
    var brandwache = $('#createEntry_brandsicherheitswache').parent();
    if (select == '0') {
        unterkategorieDiv.hide();
        brandeinsatz.show();
        brandwache.hide();
    } else if (select == '1') {
        unterkategorieDiv.hide();
        brandeinsatz.hide();
        brandwache.show();
    } else if (select == '2') {
        unterkategorieDiv.show();
        brandeinsatz.hide();
        brandwache.hide();
    } else {
        unterkategorieDiv.hide();
        brandeinsatz.hide();
    }
}