if not status is-interactive; return; end

abbr --add -- '-' 'cd -'
abbr --add -- 'cd-' 'cd -'

function __dotdot
  string replace '/../' '' (
      string replace --all '.' '/..' (
          string replace --regex '(\w)\.\.' '$1 ..' $argv[1]
      )
  )
end

abbr --add dotdot --position anywhere --regex '\.\.\.+' --function __dotdot
abbr --add cd_dotdot --position command --regex 'cd\.\.+' --function __dotdot
