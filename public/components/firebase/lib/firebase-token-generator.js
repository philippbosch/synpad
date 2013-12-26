(function() {var k=null,m=!1,n=this;
function q(a){var b=typeof a;if("object"==b)if(a){if(a instanceof Array)return"array";if(a instanceof Object)return b;var c=Object.prototype.toString.call(a);if("[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a.length&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))return"array";if("[object Function]"==c||"undefined"!=typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("call"))return"function"}else return"null";else if("function"==
b&&"undefined"==typeof a.call)return"object";return b}Math.floor(2147483648*Math.random()).toString(36);var r={};function aa(){this.i=void 0}
function s(a,b,c){switch(typeof b){case "string":t(b,c);break;case "number":c.push(isFinite(b)&&!isNaN(b)?b:"null");break;case "boolean":c.push(b);break;case "undefined":c.push("null");break;case "object":if(b==k){c.push("null");break}if("array"==q(b)){var d=b.length;c.push("[");for(var e="",f=0;f<d;f++)c.push(e),e=b[f],s(a,a.i?a.i.call(b,String(f),e):e,c),e=",";c.push("]");break}c.push("{");d="";for(f in b)Object.prototype.hasOwnProperty.call(b,f)&&(e=b[f],"function"!=typeof e&&(c.push(d),t(f,c),
c.push(":"),s(a,a.i?a.i.call(b,f,e):e,c),d=","));c.push("}");break;case "function":break;default:throw Error("Unknown type: "+typeof b);}}var u={'"':'\\"',"\\":"\\\\","/":"\\/","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\u000b"},ba=/\uffff/.test("\uffff")?/[\\\"\x00-\x1f\x7f-\uffff]/g:/[\\\"\x00-\x1f\x7f-\xff]/g;
function t(a,b){b.push('"',a.replace(ba,function(a){if(a in u)return u[a];var b=a.charCodeAt(0),e="\\u";16>b?e+="000":256>b?e+="00":4096>b&&(e+="0");return u[a]=e+b.toString(16)}),'"')};function w(a){if("undefined"!==typeof JSON&&void 0!==JSON.stringify)a=JSON.stringify(a);else{var b=[];s(new aa,a,b);a=b.join("")}return a};function x(a,b,c){var d;1>c?d="at least 1":c>b&&(d=0===b?"none":"no more than "+b);if(d)throw Error(a+" failed: Was called with "+c+(1===c?" argument.":" arguments.")+" Expects "+d+".");}function ca(a,b,c){var d="";switch(b){case 1:d=c?"first":"First";break;case 2:d=c?"second":"Second";break;case 3:d=c?"third":"Third";break;case 4:d=c?"fourth":"Fourth";break;default:r.L.Q.U.assert(m,"errorPrefix_ called with argumentNumber > 4.  Need to update it?")}return a+" failed: "+(d+" argument ")};var y=Math,z={},A=z.p={};function da(){}
var B=A.r={extend:function(a){da.prototype=this;var b=new da;a&&b.P(a);b.q=this;return b},create:function(){var a=this.extend();a.h.apply(a,arguments);return a},h:function(){},P:function(a){for(var b in a)a.hasOwnProperty(b)&&(this[b]=a[b]);a.hasOwnProperty("toString")&&(this.toString=a.toString)},c:function(){return this.q.extend(this)}},C=A.A=B.extend({h:function(a,b){a=this.b=a||[];this.a=void 0!=b?b:4*a.length},toString:function(a){return(a||ea).stringify(this)},concat:function(a){var b=this.b,
c=a.b,d=this.a,a=a.a;this.K();if(d%4)for(var e=0;e<a;e++)b[d+e>>>2]|=(c[e>>>2]>>>24-8*(e%4)&255)<<24-8*((d+e)%4);else if(65535<c.length)for(e=0;e<a;e+=4)b[d+e>>>2]=c[e>>>2];else b.push.apply(b,c);this.a+=a;return this},K:function(){var a=this.b,b=this.a;a[b>>>2]&=4294967295<<32-8*(b%4);a.length=y.ceil(b/4)},c:function(){var a=B.c.call(this);a.b=this.b.slice(0);return a},random:function(a){for(var b=[],c=0;c<a;c+=4)b.push(4294967296*y.random()|0);return C.create(b,a)}}),D=z.N={},ea=D.S={stringify:function(a){for(var b=
a.b,a=a.a,c=[],d=0;d<a;d++){var e=b[d>>>2]>>>24-8*(d%4)&255;c.push((e>>>4).toString(16));c.push((e&15).toString(16))}return c.join("")},parse:function(a){for(var b=a.length,c=[],d=0;d<b;d+=2)c[d>>>3]|=parseInt(a.substr(d,2),16)<<24-4*(d%8);return C.create(c,b/2)}},fa=D.T={stringify:function(a){for(var b=a.b,a=a.a,c=[],d=0;d<a;d++)c.push(String.fromCharCode(b[d>>>2]>>>24-8*(d%4)&255));return c.join("")},parse:function(a){for(var b=a.length,c=[],d=0;d<b;d++)c[d>>>2]|=(a.charCodeAt(d)&255)<<24-8*(d%
4);return C.create(c,b)}},ga=D.z={stringify:function(a){try{return decodeURIComponent(escape(fa.stringify(a)))}catch(b){throw Error("Malformed UTF-8 data");}},parse:function(a){return fa.parse(unescape(encodeURIComponent(a)))}},E=A.R=B.extend({reset:function(){this.f=C.create();this.k=0},l:function(a){"string"==typeof a&&(a=ga.parse(a));this.f.concat(a);this.k+=a.a},m:function(a){var b=this.f,c=b.b,d=b.a,e=this.o,f=d/(4*e),f=a?y.ceil(f):y.max((f|0)-this.I,0),a=f*e,d=y.min(4*a,d);if(a){for(var g=0;g<
a;g+=e)this.F(c,g);g=c.splice(0,a);b.a-=d}return C.create(g,d)},c:function(){var a=B.c.call(this);a.f=this.f.c();return a},I:0});A.t=E.extend({h:function(){this.reset()},reset:function(){E.reset.call(this);this.G()},update:function(a){this.l(a);this.m();return this},e:function(a){a&&this.l(a);this.D();return this.g},c:function(){var a=E.c.call(this);a.g=this.g.c();return a},o:16,B:function(a){return function(b,c){return a.create(c).e(b)}},C:function(a){return function(b,c){return ha.s.create(a,c).e(b)}}});
for(var ha=z.n={},F=Math,G=z.p,ia=G.A,G=G.t,H=z.n,ja=[],ka=[],I=2,J=0;64>J;){var K;a:{for(var la=I,ma=F.sqrt(la),L=2;L<=ma;L++)if(!(la%L)){K=m;break a}K=!0}K&&(8>J&&(ja[J]=4294967296*(F.pow(I,0.5)-(F.pow(I,0.5)|0))|0),ka[J]=4294967296*(F.pow(I,1/3)-(F.pow(I,1/3)|0))|0,J++);I++}
var M=[],H=H.w=G.extend({G:function(){this.g=ia.create(ja.slice(0))},F:function(a,b){for(var c=this.g.b,d=c[0],e=c[1],f=c[2],g=c[3],h=c[4],i=c[5],v=c[6],R=c[7],j=0;64>j;j++){if(16>j)M[j]=a[b+j]|0;else{var l=M[j-15],p=M[j-2];M[j]=((l<<25|l>>>7)^(l<<14|l>>>18)^l>>>3)+M[j-7]+((p<<15|p>>>17)^(p<<13|p>>>19)^p>>>10)+M[j-16]}l=R+((h<<26|h>>>6)^(h<<21|h>>>11)^(h<<7|h>>>25))+(h&i^~h&v)+ka[j]+M[j];p=((d<<30|d>>>2)^(d<<19|d>>>13)^(d<<10|d>>>22))+(d&e^d&f^e&f);R=v;v=i;i=h;h=g+l|0;g=f;f=e;e=d;d=l+p|0}c[0]=c[0]+
d|0;c[1]=c[1]+e|0;c[2]=c[2]+f|0;c[3]=c[3]+g|0;c[4]=c[4]+h|0;c[5]=c[5]+i|0;c[6]=c[6]+v|0;c[7]=c[7]+R|0},D:function(){var a=this.f,b=a.b,c=8*this.k,d=8*a.a;b[d>>>5]|=128<<24-d%32;b[(d+64>>>9<<4)+15]=c;a.a=4*b.length;this.m()}});z.w=G.B(H);z.u=G.C(H);var na=z.N.z;
z.n.s=z.p.r.extend({h:function(a,b){a=this.j=a.create();"string"==typeof b&&(b=na.parse(b));var c=a.o,d=4*c;b.a>d&&(b=a.e(b));for(var e=this.J=b.c(),f=this.H=b.c(),g=e.b,h=f.b,i=0;i<c;i++)g[i]^=1549556828,h[i]^=909522486;e.a=f.a=d;this.reset()},reset:function(){var a=this.j;a.reset();a.update(this.H)},update:function(a){this.j.update(a);return this},e:function(a){var b=this.j,a=b.e(a);b.reset();return b.e(this.J.c().concat(a))}});function N(a,b,c){var d=o;if(typeof a!==b)throw Error("FirebaseTokenGenerator.createToken option "+d+" must be "+c);};Math.random();var O,P,Q,S;function oa(){return n.navigator?n.navigator.userAgent:k}S=Q=P=O=m;var T;if(T=oa()){var pa=n.navigator;O=0==T.indexOf("Opera");P=!O&&-1!=T.indexOf("MSIE");Q=!O&&-1!=T.indexOf("WebKit");S=!O&&!Q&&"Gecko"==pa.product}var qa=P,ra=S,sa=Q;var U;if(O&&n.opera){var ta=n.opera.version;"function"==typeof ta&&ta()}else ra?U=/rv\:([^\);]+)(\)|;)/:qa?U=/MSIE\s+([^\);]+)(\)|;)/:sa&&(U=/WebKit\/(\S+)/),U&&U.exec(oa());var V=k,W=k;
function ua(a){var b=q(a);if(!("array"==b||"object"==b&&"number"==typeof a.length))throw Error("encodeByteArray takes an array as a parameter");if(!V){V={};W={};for(b=0;65>b;b++)V[b]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".charAt(b),W[b]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.".charAt(b)}for(var b=W,c=[],d=0;d<a.length;d+=3){var e=a[d],f=d+1<a.length,g=f?a[d+1]:0,h=d+2<a.length,i=h?a[d+2]:0,v=e>>2,e=(e&3)<<4|g>>4,g=(g&15)<<2|i>>6,i=i&63;h||(i=
64,f||(g=64));c.push(b[v],b[e],b[g],b[i])}return c.join("")};function X(a){x("new FirebaseTokenGenerator",1,arguments.length);if("string"!=typeof a)throw Error(ca("new FirebaseTokenGenerator",1,m)+"must be a valid firebase namespace secret.");this.O=a}var Y=["FirebaseTokenGenerator"],Z=n;!(Y[0]in Z)&&Z.execScript&&Z.execScript("var "+Y[0]);for(var $;Y.length&&($=Y.shift());)!Y.length&&void 0!==X?Z[$]=X:Z=Z[$]?Z[$]:Z[$]={};
X.prototype.M=function(a,b){x("FirebaseTokenGenerator.createToken",2,arguments.length);if(void 0!==b&&(b==k||"object"!=typeof b))throw Error(ca("FirebaseTokenGenerator.createToken",2,!0)+"must be a dictionary of token options.");b=b||{};if(va(a)&&va(b))throw Error("FirebaseTokenGenerator.createToken: data is empty and no options are set.  This token will have no effect on Firebase.");var c=b,d={};for(o in c)switch(o){case "expires":N(c[o],"number","a number.");d.exp=c[o];break;case "notBefore":N(c[o],
"number","a number.");d.nbf=c[o];break;case "admin":N(c[o],"boolean","a boolean.");d.admin=c[o];break;case "debug":N(c[o],"boolean","a boolean.");d.debug=c[o];break;case "simulate":N(c[o],"boolean","a boolean.");d.simulate=c[o];break;default:throw Error("FirebaseTokenGenerator.createToken unrecognized option: "+o);}d.v=0;d.iat=Math.floor((new Date).getTime()/1E3);d.d=a;for(var c=wa(w({typ:"JWT",alg:"HS256"})),d=wa(w(d)),e=z.u(c+"."+d,this.O).toString(),f=[],g=0;g<e.length;g+=2)f.push(parseInt(e.substr(g,
2),16));e=ua(f);e=xa(e);return c+"."+d+"."+e};X.prototype.createToken=X.prototype.M;function wa(a){for(var b=[],c=0,d=0;d<a.length;d++){var e=a.charCodeAt(d);55296<=e&&56319>=e&&(e-=55296,d++,r.L.Q.assert(d<a.length,"Surrogate pair missing trail surrogate."),e=65536+(e<<10)+(a.charCodeAt(d)-56320));128>e?b[c++]=e:(2048>e?b[c++]=e>>6|192:(65536>e?b[c++]=e>>12|224:(b[c++]=e>>18|240,b[c++]=e>>12&63|128),b[c++]=e>>6&63|128),b[c++]=e&63|128)}a=ua(b);return xa(a)}
function xa(a){var b=a.indexOf(".");return 0<=b?a.substring(0,b):a}function va(a){if("object"!==typeof a)return m;if(a===k)return!0;for(var b in a)if(Object.prototype.hasOwnProperty.call(a,b))return m;return!0};})();
