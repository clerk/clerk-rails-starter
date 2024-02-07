module ApplicationHelper
  def clerk_frontend_api
    Base64.decode64(ENV.fetch("CLERK_PUBLISHABLE_KEY").sub(/pk_(test|live)/, "")).sub("$", "")
  end

  def clerk_script_tag
    script_url = ENV["CLERKJS_SCRIPT_URL"].presence ||
      "https://#{clerk_frontend_api()}/npm/@clerk/clerk-js@5.0.0-beta-v5.20/dist/clerk.browser.js"

    javascript_include_tag(
      script_url,
      {
        "data-clerk-publishable-key": ENV.fetch("CLERK_PUBLISHABLE_KEY"),
        crossorigin: "anonymous",
        onload: "startClerk()",
        defer: true,
        nonce: true
      }
    )
  end
end
