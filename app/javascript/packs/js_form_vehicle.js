const selectBrand = document.getElementById('vehicle_brand');
const selectModel = document.getElementById('vehicle_model');

selectBrand.addEventListener('change', (event) => {
  fill_vehicles(event.target.value)  
});

function removeOptions(selectElement) {
  var i, L = selectElement.options.length - 1;
  
  for(i = L; i >= 0; i--) {
    selectElement.remove(i);
  }
}

function fill_vehicles(id_brand) {
  fetch(`http://fipeapi.appspot.com/api/1/carros/veiculos/${id_brand}.json`)
  .then(res => res.json())
  .then(response => {
    removeOptions(selectModel)

    var opt = document.createElement("option");
    selectModel.add(opt, null);


    for(var model of response){
      var opt = document.createElement("option");

      opt.value = model.name;
      opt.text = model.name;

      selectModel.add(opt, null);
    }

  })
  .catch(err => {
    removeOptions(selectModel)  
  });
}