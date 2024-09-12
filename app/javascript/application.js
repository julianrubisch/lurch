// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import * as bootstrap from "bootstrap";

document.addEventListener("turbo:load", () => {
  const dialogs = document.querySelectorAll(".modal");

  dialogs.forEach((dialog) => {
    dialog.addEventListener("turbo:frame-missing", async (e) => {
      const { ok, url } = e.detail.response;

      if (ok) {
        e.preventDefault();
        e.detail.visit(url, { action: "replace" });
      }
    });
  });
});
