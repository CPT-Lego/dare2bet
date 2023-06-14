import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static values = {
    endtime: String
  }

  static targets = ['span']

  connect() {
    const span = this.spanTarget
    const endtimeValue = this.endtimeValue
    const timer = setInterval(function() {
      // Get today's date and time
      const now = new Date().getTime();
      const endtime = Date.parse(endtimeValue)

      // Find the distance between now and the count down date
      var distance = endtime - now;

      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // Display the result in the element with id="demo"
      span.textContent = days + "d " + hours + "h "
      + minutes + "m " + seconds + "s ";

      // If the count down is finished, write some text
      if (distance < 0) {
        clearInterval(timer);
        span.textContent = "EXPIRED";
      }
    }, 1000)
  }
}
