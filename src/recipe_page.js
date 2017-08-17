document.addEventListener('DOMContentLoaded', (e) => {
    let url = Utils.getParameterByName('query_url');
    XHR.post(`http://52.78.41.124/recipes?url=${url}`, (e) => {
        let jsonData;
        try {
            jsonData = JSON.parse(e.target.responseText);
        }
        catch (e) {
            // exception
        }

        document.querySelector('.recipe_detail .title').innerText = jsonData.title;
        document.querySelector('.recipe_detail .subtitle').innerText = jsonData.subtitle;
        document.querySelector('.recipe_detail .circle_img').style.cssText = `background-image: url("${jsonData.image}")`;
        document.querySelector('.detail_link a').href = jsonData.url;
        document.querySelector('.missed_material .subtitle').innerText = jsonData.missed_material;
        document.querySelector('.recipe_cart .title_main').innerText = jsonData.title;
    });

    console.info(Utils.getParameterByName('query_url'));
    /////////////////////////////////////
    document.querySelector(".product_img").addEventListener("click", modalHandler);
    document.querySelector(".modal_close").addEventListener("click", closeModal);
});


function modalHandler() {
    const dimmed = document.querySelector(".dimmed");
    const modal = document.querySelector(".recipe_modal");
    const dimmed_black = document.querySelector(".dimmed_black");

    modal.classList.remove("display_none");
    dimmed.classList.add("apply_dimmed");
    dimmed_black.classList.add("apply_dimmed_black");
}

function closeModal() {
    const dimmed = document.querySelector(".dimmed");
    const modal = document.querySelector(".recipe_modal");
    const dimmed_black = document.querySelector(".dimmed_black");

    modal.classList.add("display_none");
    dimmed.classList.remove("apply_dimmed");
    dimmed_black.classList.remove("apply_dimmed_black");
}

