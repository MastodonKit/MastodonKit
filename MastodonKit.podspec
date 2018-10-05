Pod::Spec.new do |s|
  s.name                    = 'MastodonKit'
  s.version                 = '2.0.0'
  s.license                 = 'MIT'
  s.summary                 = 'MastodonKit is a Swift Framework that wraps the Mastodon API.'
  s.description             = 'MastodonKit covers all the endpoints and entities from Mastodon\'s API and is designed to be simple to use.'
  s.homepage                = 'https://github.com/MastodonKit/MastodonKit'
  s.documentation_url       = 'https://mastodonkit.github.io/MastodonKit'
  s.social_media_url        = 'https://mastodon.technology/@ornithocoder'
  s.authors                 = { 'Ornithologist Coder' => 'ornithocoder@users.noreply.github.com' }
  s.source                  = { :git => 'https://github.com/MastodonKit/MastodonKit.git', :tag => s.version }

  s.ios.deployment_target   = '10.0'
  s.osx.deployment_target   = '10.12'
  s.swift_version           = '4.2'

  s.source_files            = 'Sources/**/*.swift'
end
