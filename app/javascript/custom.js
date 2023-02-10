if (window.jquery) {
 console.log("jquery loaded");
} else {
console.log("jquery NOT loaded");
}

$(document).ready(function () {
  //$('#example').DataTable();
  $("#example").DataTable({
    mark: true // used by https://yarnpkg.com/package/datatables.mark.js
  });

});
