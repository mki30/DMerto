del  .\cmp\eRoadAlljs*.js
del eRoadAlljs*.js
type eroad.js >> eRoadAlljs.js

java -jar compiler.jar --js=eRoadAlljs.js --js_output_file=.\cmp\eRoadAlljs.js
java -jar compiler.jar --js=jquery.layout-latest.js --js_output_file=.\cmp\jquery.layout-latest.js

