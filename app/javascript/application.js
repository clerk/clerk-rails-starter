// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Start Clerk as soon as ClerkJS is loaded
// Called from application_helpers.clerk_script_tag included in app erb
window.startClerk = async () => {
  const clerk = window.Clerk
  try {
    // Load Clerk environment & session if available
    await clerk.load();

    // Mounts the UI that shows the user avatar, and menus for account settings and logout button
    function mountUserButton() {
      // nothing to load if the user hasn't signed in
      if (!clerk.user) {
        return;
      }

      // why do something if it's already done ?
      const hasClerkAlreadyInstantiated = document.getElementById('user-button').hasChildNodes();
      if (hasClerkAlreadyInstantiated) {
        return;
      }

      // do the actual profile management UI loading
      const userButtonEl = document.getElementById('user-button');
      clerk.mountUserButton(userButtonEl);
    }

    // everytime turbolink loads on page transitions, mount our UI again
    document.addEventListener("turbolinks:load", mountUserButton);

    // mount the very first time
    mountUserButton();
  } catch (err) {
    console.error('Clerk: ', err);
  }
}
