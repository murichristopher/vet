import { Controller } from "@hotwired/stimulus";
import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import timeGridPlugin from "@fullcalendar/timegrid";
import { Modal } from "bootstrap";
import esLocale from "@fullcalendar/core/locales/pt-br";
class AddEventModal {
  constructor(element, callback) {
    this.element = new Modal(element);
    this.callback = callback;
    this.actionElements = {
      SAVE_BUTTON: this.element._element.querySelector("#save-event"),
      EVENT_NAME_INPUT:
        this.element._element.querySelector("#event-name-modal"),
      FORM_ELEMENT: this.element._element.querySelector("#form"),
    };
  }

  init() {
    this.element.show();
    this.bindEvents();
  }

  bindEvents() {
    const onSaveButtonClick = () => {
      const { EVENT_NAME_INPUT } = this.actionElements;

      if (EVENT_NAME_INPUT) {
        this.callback({ eventName: EVENT_NAME_INPUT.value });
        this.actionElements.EVENT_NAME_INPUT.value = "";
        this.element.hide();

        this.actionElements.SAVE_BUTTON.removeEventListener(
          "click",
          onSaveButtonClick
        );
        // this.actionElements.FORM_ELEMENT.removeEventListener(
        //   "submit",
        //   onSaveButtonClick
        // );
      }
    };

    this.actionElements.SAVE_BUTTON.addEventListener(
      "click",
      onSaveButtonClick
    );
    // this.actionElements.FORM_ELEMENT.addEventListener(
    //   "submit",
    //   onSaveButtonClick
    // );
  }
}
export default class extends Controller {
  static targets = [
    "calendar",
    "eventNameModal",
    "eventColorModal",
    "eventDate",
  ];

  connect() {
    this.initializeCalendar();
  }

  async getEvents() {
    try {
      const response = await fetch("/events", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      });

      if (!response.ok) {
        throw new Error("Failed to fetch events");
      }

      const data = await response.json();
      console.log("Events data:", data);
      return data;
    } catch (error) {
      console.error("Error fetching events:", error);
      throw error; // Re-throw the error to propagate it further if needed
    }
  }

  async initializeCalendar() {
    const calendarEl = this.calendarTarget;
    const events = await this.getEvents();

    this.calendar = new Calendar(calendarEl, {
      plugins: [timeGridPlugin, interactionPlugin],
      editable: true,
      locale: "pt-br",
      initialView: "timeGridWeek",
      selectable: true,
      droppable: true,
      events: events,
      dateClick: this.handleDateClick.bind(this),
      businessHours: true,
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth,timeGridWeek,timeGridDay",
      },
      slotMinTime: "08:00:00",
      slotMaxTime: "18:00:00", // Do not display hours after 9 PM.
      eventColor: "#BF324C", // Default color for all events, green in this case.
      hiddenDays: [0, 6], // Hides Sunday
      businessHours: [
        {
          daysOfWeek: [1, 2, 3, 4, 5], // Monday to Friday
          startTime: "08:00", // 8am
          endTime: "18:00", // 6pm
        },
      ],
    });

    this.calendar.render();
  }

  handleDateClick(info) {
    const modalElement = document.getElementById("event-modal");
    const modal = new AddEventModal(modalElement, ({ eventName }) => {
      this.saveEvent({ name: eventName, date: info.dateStr });
    });

    modal.init();
  }

  saveEvent({ name, date }) {
    const title = name;
    // const color = this.eventColorModalTarget.value;

    this.calendar.addEvent({
      title: title,
      start: date,
      // color: color,
    });
  }

  saveCalendarState() {
    // You should send the current state of the calendar to the backend here
    // For example, you can send the calendar's events data

    const events = this.calendar.getEvents().map((event) => ({
      title: event.title,
      start: event.startStr,
      // Add more properties as needed
    }));

    // Send `events` to the backend using an HTTP request (e.g., fetch or axios)
    // Example using fetch:
    fetch("/events", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ events }),
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to save calendar state");
        }
        // Handle successful response if needed
      })
      .catch((error) => {
        console.error("Error saving calendar state:", error);
        // Handle error if needed
      });
  }
}
