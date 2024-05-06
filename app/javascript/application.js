// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import '@turbo-boost/elements'
import "./controllers"
import "trix"
import "@rails/actiontext"
import "flowbite/dist/flowbite.turbo.js";

document.addEventListener("turbo:frame-render", (event) => {
  const frame = event.target

  // implement `data-turbo-action="advance_params"`
  if (frame.dataset.turboAction === "persist_params") {
    const url = new URL(location);
    const frameUrl = new URL(frame.src)

    console.log("persist_params", {frameUrl, url})

    frameUrl.searchParams.forEach((v,k) => {
      url.searchParams.set(k, v);
    })

    history.pushState({}, "", url);
  }
});
