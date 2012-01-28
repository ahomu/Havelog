Clay.ready(function(cw) {
  /**
   * yes js!
   */
  cw('html').clazz('-no-js');

  /**
   * highglight
   */
  var codes = cw.elm('pre'), code, i = 0;
  while (code = codes[i++]) {
    hljs.highlightBlock(code, '    ');
  }
});
