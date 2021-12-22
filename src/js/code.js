var missatgeError = "error";
var contadorErrors = 0;

function enviar(){

    //Agafem els valor introduits dins dels inputs.
    var nom = document.getElementById("usuari").value;
    var contra = document.getElementById("contrasenya").value;

    //TODO: Falta que el text s'actualitzi depenent de l'error.
    
    if(contadorErrors == 0){
        //Creem un div que contingui el text.
        var areaText = document.createElement('div');
        areaText.className = "linia";
        areaText.style = "height: 20px; width: 170px; border: rgb(161, 223, 46) 5px solid;"

        //Creem l'element de text que indica que hi ha un error.
        var textError = document.createElement('p');
        textError.innerHTML = "[ERROR]";
        textError.style = "margin-right: 20px; font-size: 12px; font-weight: 300; color: red;"

        //Creem l'element de text que indica quin és l'error.
        var textMissatge = document.createElement('p');
        textMissatge.innerHTML = missatgeError;
        textMissatge.style = "font-size: 12px; font-weight: 100;"

        //Afegim els elements al DOM.
        areaText.appendChild(textError);
        areaText.appendChild(textMissatge);
        document.getElementById("centrada").appendChild(areaText);

        //Sumem el contador per a que no es crein més missatges d'error.
        contadorErrors++;
    }
    
}