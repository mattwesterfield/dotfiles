!function(e,r){for(var t in r)e[t]=r[t]}(exports,function(e){var r={};function t(o){if(r[o])return r[o].exports;var n=r[o]={i:o,l:!1,exports:{}};return e[o].call(n.exports,n,n.exports,t),n.l=!0,n.exports}return t.m=e,t.c=r,t.d=function(e,r,o){t.o(e,r)||Object.defineProperty(e,r,{enumerable:!0,get:o})},t.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},t.t=function(e,r){if(1&r&&(e=t(e)),8&r)return e;if(4&r&&"object"==typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(t.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&r&&"string"!=typeof e)for(var n in e)t.d(o,n,function(r){return e[r]}.bind(null,n));return o},t.n=function(e){var r=e&&e.__esModule?function(){return e.default}:function(){return e};return t.d(r,"a",r),r},t.o=function(e,r){return Object.prototype.hasOwnProperty.call(e,r)},t.p="",t(t.s=449)}({14:function(e,r){e.exports=require("http")},449:function(e,r,t){"use strict";Object.defineProperty(r,"__esModule",{value:!0}),r.getCredential=void 0;const o=t(14),n=process.env.REMOTE_CONTAINERS_IPC;function s(e){const r={get:"fill",store:"approve",erase:"reject"}[e];if(void 0===r)return void console.log("Expected get, store or erase.");let t="";process.stdin.setEncoding("utf8"),process.stdin.on("data",e=>{t+=e,"\n"!==t&&-1===t.indexOf("\n\n",t.length-2)||(process.stdin.pause(),i(r,t).catch(console.error))}),process.stdin.on("end",()=>{i(r,t).catch(console.error)})}async function i(e,r){const t=await(s={command:e,stdin:r},new Promise(e=>{const r=JSON.stringify(s);if(!n)return console.error("Remote-Containers CLI: RPC pipe not configured. Message: "+r),void e(void 0);const t={socketPath:n,path:"/",method:"POST"},i=o.request(t,r=>{const t=[];r.setEncoding("utf8"),r.on("data",e=>{t.push(e)}),r.on("error",()=>c("Error in response")),r.on("end",()=>{e(t.join(""))})});i.on("error",()=>c("Error in request")),i.write(r),i.end()}));var s;t||process.exit(-1);const{stdout:i,stderr:u,code:d}=JSON.parse(t);i&&process.stdout.write(i),u&&process.stderr.write(u),d&&process.exit(d)}function c(e){console.error("Unable to connect to VS Code Remote-Containers extension."),console.error(e),process.exit(1)}r.getCredential=s,s(process.argv[2])}}));
//# sourceMappingURL=remoteContainersCli.js.map