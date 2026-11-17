# komari-agent-abasthan

Runs a Komari monitoring agent as a Background Worker on Abasthan, so the container shows up as a node in an existing Komari panel alongside other servers.

How it works: start.sh downloads the komari-agent binary (Linux amd64) from the official GitHub release and runs it in the foreground. All configuration comes from environment variables set in the Abasthan dashboard — nothing secret lives in this repo.

Deploy: create a Background Worker on Abasthan from this public repo, Python runtime, Free plan, build command echo build-ok, start command bash start.sh.
