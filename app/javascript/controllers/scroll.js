
<script>
  document.addEventListener("DOMContentLoaded", function() {
    var scrollLink = document.getElementById("scroll-link");
    if (scrollLink) {
      scrollLink.addEventListener("click", function(e) {
        e.preventDefault();
        var targetElement = document.getElementById("scroll-link");
        if (targetElement) {
          targetElement.scrollIntoView({ behavior: "smooth" });
        }
      });
    }
  });
</script>
