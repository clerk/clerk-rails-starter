module ApplicationHelper
  def clerk_frontend_api
    Base64.decode64(publishable_key.sub(/pk_(test|live)/, "")).sub("$", "")
  end

  def clerk_script_tag
    javascript_include_tag(
      script_url,
      {
        "data-clerk-publishable-key": publishable_key,
        crossorigin: "anonymous",
        onload: "startClerk()",
        defer: true,
        nonce: true
      }
    )
  end

  private

  def publishable_key
    ENV.fetch("CLERK_PUBLISHABLE_KEY")
  end


  def script_url_from_env
    ENV["CLERKJS_SCRIPT_URL"].presence
  end

  def script_url
    script_url_from_env || "https://#{clerk_frontend_api}/npm/@clerk/clerk-js@5/dist/clerk.browser.js"
  end
end
