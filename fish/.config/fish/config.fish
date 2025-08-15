/opt/homebrew/bin/brew shellenv | source

if status is-interactive
	set -g fish_greeting ''

	set -gx PATH "$HOME/.bun/bin:$PATH"
	set -gx PATH "/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
	set -gx PATH "/opt/homebrew/opt/libpq/bin:$PATH"
	set -gx PATH "/opt/homebrew/opt/postgresql@16/bin:$PATH"
	set -gx PATH "/Users/brett/.local/share/nvm/v24.6.0/bin:$PATH"

	set -gx DATABASE_PASSWORD "postgrespass"
	set -gx EDITOR nvim
	set -gx PGDATA "/Users/brett/Library/Application Support/Postgres/var-16"
	set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@1.1)"
	set -gx VISUAL nvim
end
