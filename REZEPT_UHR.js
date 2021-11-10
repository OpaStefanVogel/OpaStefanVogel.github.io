  var SPANS=document.getElementsByTagName("span");
  var UHREN=Array();
//  alert(SPANS.length);
  for (j=0;j<SPANS.length;j++) {
    if (SPANS.item(j).getAttribute("class")=="UHR") {
      UHREN.push(SPANS.item(j));
      }
    }
//  alert(UHREN.length);
var AKTUELLE_ZEIT=0;
var VORHERIGE_ZEIT=0;
var ZIELZEIT=0;
var YPOS=0;
function Kartoffeluhr(){
  AKTUELLE_ZEIT=Date.now();
  for (j=0;j<UHREN.length;j++) {
    node=UHREN[j].lastElementChild;
    if (node.getAttribute("angehalten")=="nein") {
      ZIELZEIT=node.getAttribute("Zielzeit");
      DIFFERENZ=ZIELZEIT-AKTUELLE_ZEIT;
      if (DIFFERENZ<0) {
        DIFFERENZ=-DIFFERENZ;
//        node.setAttribute("angehalten","ja");
        node.setAttribute("style","background:blue");
        }
      NOCHZEIT=new Date(DIFFERENZ);
      if (NOCHZEIT.getSeconds()<10) {TB=":0"} else { TB = ":" };
      node.lastChild.nodeValue=((NOCHZEIT.getHours()-1)*60+NOCHZEIT.getMinutes())+TB+NOCHZEIT.getSeconds();
      }
    }
  }
setInterval(Kartoffeluhr,999);

function CLICKI(event) {
  event.preventDefault();
  node=event.target;
  YPOS=event.touches[0].screenY;
  AKTUELLE_ZEIT=Date.now();
  if (AKTUELLE_ZEIT<VORHERIGE_ZEIT+600) {
    //alert("doppelclick");
    node.setAttribute("angehalten","ja");
    node.lastChild.nodeValue=node.getAttribute("Anfangszeit");    
    node.setAttribute("style","");
    } else {
  NOCH_ZEIT=node.lastChild.nodeValue.split(":");
  //alert(NOCH_ZEIT[0]*60000+NOCH_ZEIT[1]*1000);
  ZIELZEIT=AKTUELLE_ZEIT+NOCH_ZEIT[0]*60000+NOCH_ZEIT[1]*1000;
  node.setAttribute("Zielzeit",ZIELZEIT);
  //alert(node.getAttribute("Zielzeit"));
  if (node.getAttribute("angehalten")=="ja") {
    node.setAttribute("angehalten","nein");
    node.setAttribute("style","background:yellow; outline:solid red");
    } else {
      node.setAttribute("angehalten","ja");
      node.setAttribute("style","background:yellow;");
      }
      }
  VORHERIGE_ZEIT=AKTUELLE_ZEIT;
  }
function DRAGGI(event) {
/*funktioniert nicht auf screens, wo ondragstart vor onclick ausgeführt wird oder sowas
  event.preventDefault();
  node=event.target;
  node.setAttribute("angehalten","ja");
  if (YPOS <= event.touches[0].screenY) {
    node.lastChild.nodeValue=node.getAttribute("Merkzeit");
    } else {
      node.setAttribute("Merkzeit",node.lastChild.nodeValue);
      node.lastChild.nodeValue=node.getAttribute("Anfangszeit");
      }
  node.setAttribute("style","");
*/
  }





//fuer TIME:
function CLICKTIME() {
  event.preventDefault();
  node=event.target;
//  alert(node.lastChild.nodeValue.split(":","T"));
  CLICKTIMEOBJ=new Date(node.lastChild.nodeValue);
  alert(CLICKTIMEOBJ.toString());
  }


