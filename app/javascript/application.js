// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

// load jquery first from separate file along with Datatable:
import './load_jquery.js';

// load bootstrap before datatables' bootstrap css
import 'bootstrap/dist/js/bootstrap.bundle.js';
import 'datatables.net-bs4/js/dataTables.bootstrap4.js';

// load datatables.mark.js. This jquery plugin highlights your search result:
import 'datatables.mark.js/dist/datatables.mark.js';

// initialize the table:
import './custom.js';
