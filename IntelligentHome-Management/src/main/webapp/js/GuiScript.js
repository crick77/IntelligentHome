var codeText;
var insertText;
var updateText;

$(document).ready(function () {

    $(".submit_rule").on("click", function (evt) {
        evt.stopImmediatePropagation();
        evt.preventDefault();
        var rule = {};
        rule.name = $("#Insert input[name='script_name']").val();
        rule.sensors = $("#Insert #sensors-select").val();
        rule.actuators = $("#Insert #actuators-select").val();
        rule.codetext = $("#Insert textarea[name='message']").val();
        rule.enabled = $("#Insert input[name='enabledORdisabled']").is(":checked");
        sendJSON("POST",rule, "http://localhost:8080/IntelligentHome-Management/api/rest/services/saverule");
        //sendJSONProva($("input[name='script_url']").val());
    });

    $(".update_rule").on("click", function (evt) {
        evt.stopImmediatePropagation();
        evt.preventDefault();
        var rule = {};
        rule.id = $("#Update input[name='id_script']").val();
        rule.name = $("#Update input[name='script_name']").val();
        rule.sensors = $("#Update #sensors-select-update").val();
        rule.actuators = $("#Update #actuators-select-update").val();
        rule.codetext = $("#Update textarea[name='message']").val();
        rule.enabled = $("#Update input[name='enabledORdisabled']").is(":checked");
        sendJSON("PUT",rule, "http://localhost:8080/IntelligentHome-Management/api/rest/services/update");
    });

    $("input[name='enabledORdisabled'").on("click", function (evt) {
        var enabled = $("input[name='enabledORdisabled']").is(":checked");
        var label = $(this).parents(".wrap-checkbox").find(".checkbox-label");
        if (enabled) {
            $(label).text("Abilitato");
        } else {
            $(label).text("Disabilitato");
        }
    });

    $("input[name='action-choose']").on("click", function (evt) {
        var update = $("input[name='action-choose']").is(":checked");
        var label = $(this).parents(".wrap-checkbox").find(".checkbox-choice-label");
        if (update) {
            $(label).text("Aggiorna");
            $("#Insert").removeClass("show").addClass("hidden");
            $("#Update").removeClass("hidden").addClass("show");
        } else {
            $(label).text("Inserisci");
            $("#Update").removeClass("show").addClass("hidden");
            $("#Insert").removeClass("hidden").addClass("show");
        }
    });
    /*VIEW BUTTON*/
    $("#grid-data").on("click",".view-btn",function(evt){
        var textarea = $(this).parent().find(".hidden").val();
        //$("#modal-script-view .modal-body #textarea-scripts").val(textarea);
        codeText.setValue(textarea);
        $("#modal-script-view").modal();
        // setTimeout(function () {
        //     codeText.refresh();
        //     //codeText.click();
        // }, 1);
    });
    /*UPDATE BUTTON*/
    $("#grid-data").on("click",".update-btn",function(evt){
        var tr = $(this).parents("tr");
        var id = $(tr).find("td:eq(0)").text();
        var name = $(tr).find("td:eq(1)").text();
        var sensors = [];
        $(tr).find("td:eq(2) li.select2-selection__choice").each(function() {
            sensors.push($(this).text());
        });
        var actuators = [];
        $(tr).find("td:eq(3) li.select2-selection__choice").each(function(){
            actuators.push($(this).text());
        });
        var script = $(tr).find("td:eq(4) textarea").text();
        var enabled = ($(tr).find("td:eq(5)").text() === "true");
        $("#Update input[name='id_script']").val(id);
        $("#Update input[name='script_name']").val(name);

        $("#Update #sensors-select-update").val(sensors);
        $("#Update #sensors-select-update").trigger("change.select2");

        $("#Update #actuators-select-update").val(actuators);
        $("#Update #actuators-select-update").trigger("change.select2");

        //$("#Update textarea[name='message']").val(script);
        updateText.on("blur",function(){
            updateText.save();
            console.log("BLUR SAVED:",$("#Update textarea[name='message']").val());
        });

        updateText.refresh();
        updateText.setValue(script);
        updateText.save();
        setTimeout(function() {
            updateText.refresh();
        },1);


        if($("#Update input[name='enabledORdisabled']").is(":checked") == true) {
            if(enabled == false) {
                $("#Update input[name='enabledORdisabled']").click();
            }
        }
        if($("#Update input[name='enabledORdisabled']").is(":checked") == false) {
            if(enabled == true) {
                $("#Update input[name='enabledORdisabled']").click();
            }
        }

        console.log(id);  
        $("#Update .wrapper").removeClass("hidden").addClass("show");
    });

    $("#modal-script-view").on("shown.bs.modal",function(){
        codeText.refresh();
    });

    $("#modal-script-view").on("hide.bs.modal",function(){
        codeText.setValue("");
        codeText.refresh();
    });
    Initialize();
});


function Initialize() {
    //setByJSON("json/Sensors.json","#sensors-select");
    //setByJSON("json/Actuators.json","#actuators-select");

    /*Insert Select*/
    getExternalDevices("http://localhost:8080/IntelligentHome-Management/api/rest/services/getSensors", "#sensors-select");
    getExternalDevices("http://localhost:8080/IntelligentHome-Management/api/rest/services/getActuators", "#actuators-select");
    /*Update Select*/
    getExternalDevices("http://localhost:8080/IntelligentHome-Management/api/rest/services/getSensors", "#sensors-select-update");
    getExternalDevices("http://localhost:8080/IntelligentHome-Management/api/rest/services/getActuators", "#actuators-select-update");

    InitUpdate();
};

function InitUpdate() {
    updateJSON();
    codeText = CodeMirror.fromTextArea(document.getElementById("textarea-scripts"), 
    {mode:'javascript',
     //autoRefresh:true,
     lineNumbers:true,
     readOnly:true,
     indentWithTabs:true,
     lineWrapping:true
    });
    insertText = CodeMirror.fromTextArea(document.getElementById("textarea-insert"), 
    {mode:'javascript',
     autoRefresh:true,
     lineNumbers:true,
     readOnly:false,
     indentWithTabs:true,
     lineWrapping:true
    });
    updateText = CodeMirror.fromTextArea(document.getElementById("textarea-update"), 
    {mode:'javascript',
     autoRefresh:true,
     lineNumbers:true,
     readOnly:false,
     indentWithTabs:true,
     lineWrapping:true
    });

    insertText.on("blur",function(){
        insertText.save();
        console.log("BLUR SAVED:",$("#Insert textarea[name='message']").val());
    });
}

function setByJSON(url, tag_select) {
    var result = "";
    $.getJSON(url, function (data) {
        $.each(data, function (key, value) {
            $.each(value, function (obj_key, obj_value) {
                var option = "<option value='" + obj_value + "'>" + obj_value + "</option>";
                $(tag_select).append(option);
            });
        });
    });
};

function sendJSON(typeSend,obj, myurl) {
    $.ajax({
        url: myurl,
        type: typeSend,
        //dataType: 'text',
        contentType: 'text/plain',
        data: JSON.stringify(obj),
        success: function (data) {
            console.log(data);
            alert("OK");
        },
        error: function (xhr, ajaxOptions, ThrownError) {
            console.log(xhr.status);
            console.log("Error");
        }
    });
};

function sendJSONProva(myurl) {
    $.ajax({
        url: myurl,
        type: 'get',
        dataType: 'json',
        //contentType: 'application/json',
        data: { a: 5, b: 10 },
        success: function (data) {
            console.log(data);
        },
        error: function (data) {
            console.log(data);
        }
    });
};

function getExternalDevices(url, tag_select) {
    $.getJSON(url, function (data) {
        $.each(data, function (obj_key, obj_value) {
            var option = "<option value='" + obj_value + "'>" + obj_value + "</option>";
            $(tag_select).append(option);
        });
    });
};

function updateJSON() {
    var url = "http://localhost:8080/IntelligentHome-Management/api/rest/services/getScripts";
    var tr = "";
    var tbody = $("<tbody>");
    var inputBtn = "<input type='button' class='update-btn' value='Aggiorna' />";
    $.getJSON(url, function (data) {
        $.each(data, function (key, value) {
            value = JSON.parse(value);
            tr = $("<tr>");
            $.each(value, function (el_key, el_value) {
                if (Object.prototype.toString.call(el_value) === '[object Array]') {
                    var spanArr = createUpdateTableSelect(el_value);
                    $(tr).append($("<td>").append($("<div>").append(spanArr)));
                } else {
                    if(el_key == "codetext") {
                        el_value = $("<textarea>").attr("readonly",true).addClass("hidden").text(el_value);
                        $(tr).append($("<td>").append("<input class='view-btn' type='button' value='Mostra'/>").append(el_value));
                    }else {
                         $(tr).append($("<td>").text(el_value));
                    }    
                } 
            });
            $(tbody).append($(tr).append($("<td>").append(inputBtn)));
        });
        $("#grid-data").append(tbody);
        //$("#grid-data").bootgrid();
    });
};

function createUpdateTableSelect(arrayElem) {
    var selectRev = "<span class=\"select2 select2-container select2-container--default select2-container--below\" dir=\"ltr\" style=\"width: 146.863px;\">" +
                    "<span class=\"selection\">" +
                    "<span class=\"select2-selection select2-selection--multiple\" role=\"combobox\" aria-haspopup=\"true\" aria-expanded=\"false\" tabindex=\"-1\">" +
                    "<ul class=\"select2-selection__rendered\">"; 
                   
    var endRev =    "<li class=\"select2-search select2-search--inline\">" + 
                        "<input class=\"select2-search__field\" type=\"search\" tabindex=\"0\" autocomplete=\"off\" autocorrect=\"off\" autocapitalize=\"off\" spellcheck=\"false\" role=\"textbox\" aria-autocomplete=\"list\" placeholder=\"\" style=\"width: 0.75em;\">" + 
                            "</li>" +
                            "</ul>" +
                            "</span>" +
                            "</span>" +
                            "<span class=\"dropdown-wrapper\" aria-hidden=\"true\"></span>" +
                            "</span>";
    var li_rev = "";
    $.each(arrayElem,function(key,value){
        li_rev = li_rev + "<li class=\"select2-selection__choice\" title=" + value + ">" + 
                          "<span class=\"select2-selection__choice__remove\" role=\"presentation\"></span>" + value + "</li>";
    });
    return selectRev + li_rev +endRev;              
};
