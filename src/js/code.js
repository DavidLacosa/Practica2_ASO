//var missatgeError = "error";
var copsCreat = 0;

function enviar(){

    var contadorErrors = 0; //Variable que conta quants errors hi ha.
    var missatgeError;

    //Agafem els valor introduits dins dels inputs.
    var nom = document.getElementById("usuari").value;
    var contra = document.getElementById("contrasenya").value;

    //TODO: Falta que el text s'actualitzi depenent de l'error.
    if(!nom){ //No hi ha nom.
        contadorErrors++;
        missatgeError = "Falta el nom."
    }
    if(!contra){ //No hi ha contrasenya.
        if(contadorErrors > 0) missatgeError = "Falta el nom i la contrassenya.";
        else missatgeError = "Falta la contrassenya.";
    }
    
    if(copsCreat == 0 && contadorErrors != 0){
        //Creem un div que contingui el text.
        var areaText = document.createElement('div');
        areaText.className = "linia";
        areaText.style = "height: 20px; width: 170px;"

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
        copsCreat++;
    }
    
}