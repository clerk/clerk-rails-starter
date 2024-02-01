# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

# This works...but it's not ideal. It's better to use the nonce_generator and nonce_directives
# Rails.application.configure do
#   config.content_security_policy do |policy|
#     policy.script_src :self, "https://#{ENV.fetch('CLERK_FRONTEND_API')}", :unsafe_inline
#     policy.style_src :self, "https://#{ENV.fetch('CLERK_FRONTEND_API')}", :unsafe_inline
#     policy.worker_src :self, :blob
#   end
# end

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :https, "#{ENV.fetch('CLERK_FRONTEND_API')}"
    policy.script_src :self, :https, "https://#{ENV.fetch('CLERK_FRONTEND_API')}"
    policy.style_src :self, :https, "https://#{ENV.fetch('CLERK_FRONTEND_API')}"
    policy.worker_src :self, :blob
    policy.img_src :self, :https, :data, "img.clerk.com"
  end

end

Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
Rails.application.config.content_security_policy_nonce_directives = %w(script-src style-src)