import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin, { Draggable } from '@fullcalendar/interaction';

// Connects to data-controller="calendar"


export default class extends Controller {
  static targets = ["calendar", "draggableEl"];

  connect() {
    console.log("CALENDAR TARGET", this.calendarTarget)
    console.log("DRAGGABLE", this.draggableEl)

    const calendar = new Calendar(this.calendarTarget, {
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
      plugins: [interactionPlugin, dayGridPlugin],
      droppable: true,
      initialView: "dayGridMonth",
    });

    new Draggable(this.draggableElTarget, {
      eventData: {
        title: "my event",
        duration: "02:00",
      },
    });

    calendar.render();
  }
}
