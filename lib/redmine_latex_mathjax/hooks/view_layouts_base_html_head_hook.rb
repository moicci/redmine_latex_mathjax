module RedmineLatexMathjax
  module Hooks
    class ViewLayoutsBaseHtmlHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
          return "<script type='text/javascript' async src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=default'>
MathJax.Hub.Config({
  displayAlign: 'left',
  displayIndent: '2em',
  tex2jax: {
	inlineMath: [ ['$','$'], ['\\\\\\\\(','\\\\\\\\)'] ],
	displayMath: [ ['$$','$$'], [\"\\\\\\\\[\",\"\\\\\\\\]\"] ],
	processEscapes: true
  }
});
</script>" + "
<script type=\"text/javascript\">
  // Own submitPreview script with Mathjax trigger. Copy & Paste of public/javascripts/application.js
  function MJsubmitPreview(url, form, target) {
	$.ajax({
  	  url: url,
  	  type: 'post',
  	  data: $('#'+form).serialize(),
  	  success: function(data){
    	$('#'+target).html(data);
    	MathJax.Hub.Queue([\"Typeset\",MathJax.Hub,target]);
  	  }
	});
  }
  // Replace function submitPreview with own version with a Mathjax trigger
  document.addEventListener(\"DOMContentLoaded\", function() {
	a = document.getElementsByTagName(\"a\");
    for( var x=0; x < a.length; x++ ) {
      if ( a[x].onclick ) {
        str = a[x].getAttribute(\"onclick\");
        if (str.indexOf(\"submitPreview\") === 0) {
      	  a[x].setAttribute(\"onclick\", str.replace(\"submitPreview\",\"MJsubmitPreview\"));
          break;
      	};
      };  
	};	
  });
</script>"
      end
    end
  end
end
