
// funcion para cargar el login.jsp en mi archivo index. (Modal)
$(document).ready(function () {
    //se ba a ejecutar cuando se abre el modal
    //llamo con el id LoginModalDatos
    $('#loginModal').on('show.bs.modal', function (){
        //Realizop la peticion al Ajax para cargar el contenido de Login.jsp
        $.ajax({
            url:'/carro_compras1/vistas/login.jsp',
            method: 'GET',
            success: function (response){
                $('#LoginModalDatos').html(response);
            },
            error:function (){
                $('#LoginModalDatos').html('<p>Error al cargar el contenido</p>')
            }
        });
    });
});
// funcion para cargar el servlet en el body de mi archivo principal
$(document).ready(function (){
   //llamo a mi id LoginRegistro del body del hrml para cargar el servlet
   $.ajax({
       url: '/carro_compras1/productos', // ubicacion exacta del servlet
       method: 'GET',
       success: function (response){
           $('#LoginRegistro').html(response);
       },
       error:function (){
           $('#LoginRegistro').html('<p>Error al cargar el contenido</p>')
       }
   })
});
