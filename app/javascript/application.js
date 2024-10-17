// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap";

document.addEventListener("turbo:load", function () {
    setTimeout(function () {
        // Select all success alerts
        const successAlerts = document.querySelectorAll('.alert.alert-success');
        successAlerts.forEach(alert => {
            const bootstrapAlert = bootstrap.Alert.getInstance(alert);
            if (bootstrapAlert) {
                bootstrapAlert.close();
            } else {
                alert.classList.remove('show');
                alert.classList.add('fade');
            }
        });
    }, 5000); // Adjust duration as needed
});

document.addEventListener("DOMContentLoaded", function () {
    const deleteLinks = document.querySelectorAll('a[data-bs-toggle="modal"]');
    deleteLinks.forEach(link => {
        link.addEventListener("click", function () {
            const productId = this.dataset.productId;
            const deleteButton = document.querySelector("#deleteModal .btn-danger");
            deleteButton.onclick = function () {
                deleteButton.form.action = "/products/" + productId;
            };
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    setTimeout(function () {
        const alerts = document.querySelectorAll('.alert, .notice');
        alerts.forEach(alert => {
            alert.classList.add('fade-out'); // Add the fade-out class
        });
    }, 5000); // Wait 5 seconds before fading

    // Optionally, remove the alert from the DOM after fading
    setTimeout(function () {
        const alerts = document.querySelectorAll('.alert, .notice');
        alerts.forEach(alert => {
            alert.style.display = 'none'; // Hide the alert completely
        });
    }, 5500); // 5 seconds + fade time
});
