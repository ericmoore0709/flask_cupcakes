$(document).ready(async function () {

    const data = await axios.get('http://localhost:5000/api/cupcakes')
        .then((result) => {
            for (x of result.data.cupcakes) {
                $('#cupcake_list').append($('<li></li>').text(x.flavor).addClass('list-group-item'))
            }
        })

});

$('#cupcake_form').submit(async function (e) {
    e.preventDefault();

    const flavor = $('#flavor').val();
    const size = $('#size').val();
    const rating = $('#rating').val();
    const image = $('#image').val();

    request_data = { flavor, size, rating, image };

    const result = await axios.post('http://localhost:5000/api/cupcakes', JSON.stringify(request_data), {
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then((result) => {
            if (result.data.errors) {
                const $ul = $('<ul>')
                for (error of result.data.errors) {
                    let $li = $('<li></li>').text(error)
                    $ul.append($li)
                }
                $('#errors').append($ul)
            }
            if (result.data.cupcake) {
                $('#cupcake_list').append($('<li></li>').text(result.data.cupcake.flavor).addClass('list-group-item'))
            }
        })

});