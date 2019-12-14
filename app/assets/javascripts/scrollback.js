// Function du bouton scrollback

document.addEventListener('DOMContentLoaded', function() {

	window.onscroll = function() {
		document.getElementById("Scroller").className = (window.pageYOffset > 500) ? "visible" : "invisible";    
	};

	document.getElementById("Scroller").onclick = function() {
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};

	// ce n'est pas DRY mais problème de chargement en définissant la variable let scroller = document.getElementById("Scroller")

});
