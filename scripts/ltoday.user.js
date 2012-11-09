// ==UserScript==
// @name           User script template
// @namespace      http://mywebsite.com/myscripts
// @description    A template for creating new user scripts from
// @include        *.linuxtoday.com/*
// ==/UserScript==

var a = document.getElementsByTagName('a')
for(var i in a)
	if(a[i].innerText == 'Complete Story')
		window.location.href = a[i].href
