$(document).ready(function() {

    var collectionHolder = $('div#createEntry_besatzung');
    var newLinkLi = $('<li style="list-style-type:none;"></li>');


    $('div#createEntry_besatzung').append('<div><a href="#" class="add-tag">Füge ein Besatzungsmitglied hinzu</a></div>');

    $('div#edit_besatzung').append('<div><a href="#" class="remove-tag custom-button">Entfernen</a></div>');

    var selectedKategorie = $('#createEntry_unterkategorie').val();
    toggleVisibility(selectedKategorie);

   $('#createEntry_unterkategorie').change(function() {
        selectedKategorie = $(this).val();
       toggleVisibility(selectedKategorie);
    });

    $('.remove-tag').click(function(e) {
        e.preventDefault();

        $(this).parent().remove();

        return false;
    });

    $('.add-tag').click(function(e) {
        e.preventDefault();

        // add a new tag form (see code block below)
        addTagForm(collectionHolder, newLinkLi);
    });
});

function addTagForm(collectionHolder, newLinkLi) {
    console.log("AddTAgForm");
    // Get the data-prototype explained earlier
    var prototype = collectionHolder.data('prototype');

    // get the new index
    var index = collectionHolder.data('index');

    // Replace '$$name$$' in the prototype's HTML to
    // instead be a number based on how many items we have
    var newForm = prototype.replace(/__name__/g, index);

    // increase the index with one for the next item
    collectionHolder.data('index', index + 1);

    collectionHolder.data('index', collectionHolder.find(':input').length);



    // Display the form in the page in an li, before the "Add a tag" link li
    var newFormLi = $('<li></li>').append(newForm);

    // also add a remove button, just for this example
    newFormLi.append('<a href="#" class="remove-tag custom-button">Entfernen</a>');

    newLinkLi.before(newFormLi);

    // handle the removal, just for this example
    $('.remove-tag').click(function(e) {
        e.preventDefault();

        $(this).parent().remove();

        return false;
    });
}

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